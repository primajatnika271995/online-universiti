import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorBloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorEvent.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorState.dart';
import 'package:online_university/src/models/course_model.dart';
import 'package:online_university/src/models/mentor_model.dart';
import 'package:online_university/src/models/popular_class.dart';
import 'package:online_university/src/utils/app_theme.dart';

class MentorClassListView extends StatefulWidget {
  final Function callback;
  MentorClassListView({Key key, this.callback}) : super(key: key);

  @override
  _MentorClassListViewState createState() => _MentorClassListViewState();
}

class _MentorClassListViewState extends State<MentorClassListView>
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
      padding: const EdgeInsets.only(top: 5, bottom: 16, left: 3),
      child: BlocBuilder<MentorBloc, MentorState>(
        builder: (context, state) {
          if (state is MentorIsNotLoaded)
            return Container();
          else if (state is MentorIsLoading)
            return Container(
              height: MediaQuery.of(context).size.height - 150,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppTheme.nearlyWhite),
                  strokeWidth: 4,
                ),
              ),
            );
          else if (state is MentorIsLoaded)
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              itemCount: state.getListMentor.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var value = state.getListMentor[index];
                var count = state.getListMentor.length > 10
                    ? 10
                    : state.getListMentor.length;
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
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () {
                  callback();
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(category.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Container(
                              width: 160,
                              child: Text(
                                category.name,
                                style: AppTheme.title,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3, left: 10),
                            child: Text(
                              category.coachTitle,
                              style: AppTheme.subtitle,
                            ),
                          ),
                        ],
                      ),
                    ),
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
