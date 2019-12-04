import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_event.dart';
import 'package:online_university/src/bloc/course_bloc/course_state.dart';
import 'package:online_university/src/models/courseDetailsModel.dart';
import 'package:online_university/src/models/courseModel.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/currencyFormatted.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/payment_page/payment_screen.dart';

class MentorLessonListView extends StatefulWidget {
  final String idMentor;
  final Function callback;
  MentorLessonListView({Key key, this.idMentor, this.callback})
      : super(key: key);

  @override
  _MentorLessonListViewState createState() => _MentorLessonListViewState();
}

class _MentorLessonListViewState extends State<MentorLessonListView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  _onCheckoutCourse(CourseDetailsModel state) {
    log.info("Checkout !");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentScreen(
          value: state,
        ),
      ),
    );
  }

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
    final courseBloc = BlocProvider.of<CourseBloc>(context);
    courseBloc.add(FetchCourseByIdMentor(widget.idMentor));

    return Container(
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseIsNotLoaded)
            return SizedBox();
          else if (state is CourseIsLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 4,
              ),
            );
          } else if (state is CourseIsLoaded) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemCount: state.getListCourse.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var value = state.getListCourse[index];
                  var count = state.getListCourse.length > 10
                      ? 10
                      : state.getListCourse.length;
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
  final CourseModel data;
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
        data.bannerCourseUrl,
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
                    Text(data.courseTitle, style: AppTheme.title),
                    Text(
                      data.categoryCourseTitle,
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
          "Meet your new instuctor: writer, director, producer, and stand-up extraordinaire ${data.mentorName}. In your first lesson tells you what you\'ll learn, whe he\'s teaching.",
          style: AppTheme.subtitle,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(formattedCoursePrice(data.coursePrice), style: AppTheme.title),
            RaisedButton(
              onPressed: () {
                callback();
//                _onCheckoutCourse(state.getDetailsCourse);
              },
              color: Colors.red,
              child: Text("CHOOSE", style: AppTheme.chooseBtn),
            ),
          ],
        ),
      ],
    );
  }
}
