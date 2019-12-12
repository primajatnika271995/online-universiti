import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_event.dart';
import 'package:online_university/src/bloc/course_bloc/course_state.dart';
import 'package:online_university/src/models/course_model.dart';
import 'package:online_university/src/services/course_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_details.dart';
import 'package:online_university/src/views/component/currency_formatted.dart';

class OwnedCourseScreen extends StatefulWidget {
  final Function callback;
  OwnedCourseScreen({this.callback});

  @override
  _OwnedCourseScreenState createState() => _OwnedCourseScreenState();
}

class _OwnedCourseScreenState extends State<OwnedCourseScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  // TODO: implement context
  BuildContext get context => super.context;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // ignore: close_sinks
    final courseOwnedBloc = BlocProvider.of<CourseBloc>(context);
    courseOwnedBloc.add(FetchCourseOwned());
    super.didChangeDependencies();
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                appBar(),
                Expanded(
                  child: Container(
                    child: BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseIsNotLoaded) {
                          return SizedBox();
                        } else if (state is CourseIsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 4,
                            ),
                          );
                        } else if (state is CourseIsLoaded) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.getListCourse.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var value = state.getListCourse[index];
                                var count = state.getListCourse.length > 10
                                    ? 10
                                    : state.getListCourse.length;
                                var animation = Tween(begin: 0.0, end: 1.0)
                                    .animate(CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval(
                                        (1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                                animationController.forward();

                                return CategoryView(
                                  animation: animation,
                                  data: value,
                                  animationController: animationController,
                                  callback: () {
                                    widget.callback(value.idCourse);
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Owned Course",
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.collections_bookmark,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
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
//                  callback();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        builder: (context) => CourseBloc(CourseService()),
                        child: BisnisKreatifDetails(idCourse: data.idCourse),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: <Widget>[
                      imageContent(),
                      descriptionContent(),
                    ],
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
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: AspectRatio(
        aspectRatio: 2,
        child: Image.network(
          data.bannerCourseUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget descriptionContent() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.courseTitle,
                      style: AppTheme.title,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 5, bottom: 5, right: 10),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.mentorProfileUrl),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.mentorName,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              "Jobs : ${data.mentorTitle}",
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.subtitle,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text("PURCHASE",
                            style: AppTheme.title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
