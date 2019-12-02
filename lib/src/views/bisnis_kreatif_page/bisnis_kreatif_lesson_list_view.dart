import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_bloc.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_event.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_state.dart';
import 'package:online_university/src/models/materiModel.dart';
import 'package:online_university/src/utils/appTheme.dart';

class BisnisKreatifLessonListView extends StatefulWidget {
  final idCourse;
  final Function callback;

  BisnisKreatifLessonListView({Key key, this.idCourse, this.callback}): super(key: key);

  @override
  _BisnisKreatifLessonListViewState createState() => _BisnisKreatifLessonListViewState();
}

class _BisnisKreatifLessonListViewState extends State<BisnisKreatifLessonListView> with TickerProviderStateMixin {

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

    final materiBloc = BlocProvider.of<MateriBloc>(context);
    materiBloc.add(FetchMateriCourse(widget.idCourse));

    return Container(
      child: BlocBuilder<MateriBloc, MateriState>(
        builder: (context, state) {
          if (state is MateriIsNotLoaded)
            return SizedBox();
          else if (state is MateriIsLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 4,
              ),
            );
          } else if (state is MateriIsLoaded) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemCount: state.getListMateri.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var value = state.getListMateri[index];
                  var count = state.getListMateri.length > 10
                      ? 10
                      : state.getListMateri.length;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return CategoryView(
                    animation: animation,
                    data: value,
                    animationController: animationController,
                    callback: () {
                      widget.callback();
                    },
                  );
                },
              ),
            );
          } else {
            return Text("s");
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final MateriModel data;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
        this.data,
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
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 8, bottom: 10),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.dark_grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: descriptionContent(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget imageContent() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      child: Image.network(
        data.listContentMateri[0].urlThumbnail,
        fit: BoxFit.cover,
        width: 130,
        height: 90,
      ),
    );
  }

  Widget descriptionContent() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            imageContent(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(data.materiTitle, style: AppTheme.title),
                    Text(
                      data.idCourses,
                      style: AppTheme.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Meet your new instuctor: writer, director, producer, and stand-up extraordinaire . In your first lesson tells you what you\'ll learn, whe he\'s teaching.",
          style: AppTheme.subtitle,
        ),
      ],
    );
  }
}
