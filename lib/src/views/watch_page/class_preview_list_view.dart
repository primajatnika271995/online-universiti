import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_event.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_state.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/models/bisnis_kreatif_model.dart';
import 'package:online_university/src/services/course_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_details.dart';
import 'package:online_university/src/views/component/log.dart';

class ClassPreviewListView extends StatefulWidget {
  final Function callback;
  ClassPreviewListView({Key key, this.callback}) : super(key: key);

  @override
  _ClassPreviewListViewState createState() => _ClassPreviewListViewState();
}

class _ClassPreviewListViewState extends State<ClassPreviewListView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  // TODO: implement context
  BuildContext get context => super.context;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // ignore: close_sinks
    final keterampilanKreatifBloc = BlocProvider.of<BisnisKreatifBloc>(context);
    keterampilanKreatifBloc.add(FetchBisnisKreatif("keterampilan-kreatif"));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 16),
      child: Container(
        height: 220,
        width: double.infinity,
        child: BlocBuilder<BisnisKreatifBloc, BisnisKreatifState>(
          builder: (context, state) {
            if (state is BisnisKreatifIsNotLoaded) {
              return SizedBox();
            } else if (state is BisnisKreatifIsLoading) {
              return SizedBox();
            } else if (state is BisnisKreatifIsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: state.getListBisnisKreatif.length,
                scrollDirection: Axis.horizontal,
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
                    data: value,
                    animation: animation,
                    animationController: animationController,
                    callback: () {
                      widget.callback();
                    },
                  );
                },
              );
            } else {
              return Text("s");
            }
          },
        ),
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
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                log.info(data.idCourse);
//                callback();
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
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(data.bannerCourseUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(width: 160, child: Text(data.courseTitle, style: AppTheme.title, overflow: TextOverflow.ellipsis,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Container(width: 160, child: Text(data.mentorName, style: AppTheme.subtitle)),
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
