import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorEvent.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorBloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorState.dart';
import 'package:online_university/src/models/classPreviews.dart';
import 'package:online_university/src/models/mentor.dart';
import 'package:online_university/src/models/courseModel.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:online_university/src/utils/appTheme.dart';

class MentorListView extends StatefulWidget {
  final Function callback;
  MentorListView({Key key, this.callback}) : super(key: key);

  @override
  _MentorListViewState createState() => _MentorListViewState();
}

class _MentorListViewState extends State<MentorListView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final mentorBloc = BlocProvider.of<MentorBloc>(context);
    mentorBloc.add(FetchMentor());

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 16),
      child: Container(
        height: 260,
        width: double.infinity,
        child: BlocBuilder<MentorBloc, MentorState>(
          builder: (context, state) {
            if (state is MentorIsNotLoaded)
              return SizedBox();
            else if (state is MentorIsLoading)
              return SizedBox();
            else if (state is MentorIsLoaded)
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: state.getListMentor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var value = state.getListMentor[index];
                  var count = ClassPreviews.categoryList.length > 10
                      ? 10
                      : ClassPreviews.categoryList.length;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CategoryView(
                    category: value,
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      widget.callback(value.idUserProfile);
                    },
                  );
                },
              );
            return Text("s", style: AppTheme.title);
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final MentorModel category;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(category.imageUrl),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(width: 150, child: Text(category.name, style: AppTheme.title, overflow: TextOverflow.ellipsis,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Container(width: 150, child: Text(category.coachTitle, style: AppTheme.subtitle)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
