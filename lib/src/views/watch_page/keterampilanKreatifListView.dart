import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_event.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_state.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/models/bisnisKreatifModel.dart';
import 'package:online_university/src/services/courseService.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_details.dart';

class KeterampilanKreatifListView extends StatefulWidget {
  final Function callback;
  KeterampilanKreatifListView({Key key, this.callback}) : super(key: key);

  @override
  _KeterampilanKreatifListViewState createState() =>
      _KeterampilanKreatifListViewState();
}

class _KeterampilanKreatifListViewState
    extends State<KeterampilanKreatifListView> with TickerProviderStateMixin {
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
    final keterampilanKreatifBloc = BlocProvider.of<BisnisKreatifBloc>(context);
    keterampilanKreatifBloc.add(FetchBisnisKreatif("keterampilan-kreatif"));

    return Container(
      child: BlocBuilder<BisnisKreatifBloc, BisnisKreatifState>(
        builder: (context, state) {
          if (state is BisnisKreatifIsNotLoaded) {
            return SizedBox();
          } else if (state is BisnisKreatifIsLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 4,
              ),
            );
          } else if (state is BisnisKreatifIsLoaded) {
            return Padding(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              child: ListView.separated(
                separatorBuilder: (context, position) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: new SizedBox(
                      height: 10.0,
                      child: new Center(
                        child: new Container(
                          margin: new EdgeInsetsDirectional.only(
                              start: 1.0, end: 1.0),
                          height: 1.0,
                          color: AppTheme.nearlyWhite,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.getListBisnisKreatif.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var value = state.getListBisnisKreatif[index];
                  var count = state.getListBisnisKreatif.length > 10
                      ? 10
                      : state.getListBisnisKreatif.length;
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
  final BisnisKreatifModel data;
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
                          child: Text(
                            "Rp ${data.coursePrice}",
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
