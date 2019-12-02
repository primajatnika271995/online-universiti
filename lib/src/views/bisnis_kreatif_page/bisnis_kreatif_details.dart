import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_event.dart';
import 'package:online_university/src/bloc/course_bloc/course_state.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_overview.dart';
import 'package:online_university/src/views/home.dart';

class BisnisKreatifDetails extends StatefulWidget {
  final String idCourse;
  BisnisKreatifDetails({Key key, this.idCourse}) : super(key: key);

  @override
  _BisnisKreatifDetailsState createState() => _BisnisKreatifDetailsState();
}

class _BisnisKreatifDetailsState extends State<BisnisKreatifDetails> {
  ScrollController _scrollController = new ScrollController();
  final int _tabLength = 2;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final courseBloc = BlocProvider.of<CourseBloc>(context);
    courseBloc.add(FetchCourseDetails(widget.idCourse));

    return DefaultTabController(
      length: _tabLength,
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseIsNotLoaded)
            return SizedBox();
          else if (state is CourseIsLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppTheme.nearlyWhite),
                strokeWidth: 4,
              ),
            );
          else if (state is CourseDetailsIsLoaded) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: 600,
                    color: AppTheme.blue_stone,
                    child: Image.network(
                      state.getDetailsCourse.bannerCourseUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Expanded(
                        child: NestedScrollView(
                          controller: _scrollController,
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 450,
                                          color: Colors.transparent,
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 0,
                                          left: 0,
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                state.getDetailsCourse
                                                    .mentorName,
                                                style: TextStyle(
                                                  color: AppTheme.nearlyWhite,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: Text(
                                                  state.getDetailsCourse
                                                      .courseTitle,
                                                  style: AppTheme.courseTitle,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              takeTheClassBtn(),
                                              watchTrailerBtn(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  childCount: 1,
                                ),
                              ),
                              SliverPersistentHeader(
                                pinned: true,
                                floating: true,
                                delegate: ContestTabHeader(
                                  Material(
                                    color: Colors.black,
                                    child: SizedBox(
                                      height: 80,
                                      child: TabBar(
                                        tabs: <Tab>[
                                          Tab(text: "OVERVIEW"),
                                          Tab(text: "LESSONS"),
                                        ],
                                        indicatorColor: Colors.red,
                                        labelStyle: AppTheme.title,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                          body: Container(
                            color: Colors.black,
                            child: TabBarView(
                              children: [
                                BisnisKreatifOverview(
                                    value: state.getDetailsCourse),
                                Container(),
//                                BlocProvider(
//                                  builder: (context) =>
//                                      CourseBloc(CourseService()),
//                                  child: MentorLessonListView(
//                                    idMentor: state.getMentor.idUserProfile,
//                                  ),
//                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Text("s", style: AppTheme.title);
        },
      ),
    );
  }

  Widget takeTheClassBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {},
          color: Colors.red,
          child: Text(
            "TAKE THE CLASS",
            style: AppTheme.title,
          ),
        ),
      ),
    );
  }

  Widget watchTrailerBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {},
          color: AppTheme.grey,
          child: Text(
            "WATCH TRAILER",
            style: AppTheme.title,
          ),
        ),
      ),
    );
  }
}
