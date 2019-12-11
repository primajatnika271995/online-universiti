import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorBloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorEvent.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorState.dart';
import 'package:online_university/src/services/courseService.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_details.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/video_player.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/home.dart';
import 'package:online_university/src/views/mentor_page/mentor_details_overview.dart';
import 'package:online_university/src/views/mentor_page/mentor_lesson_list_view.dart';

class MentorDetails extends StatefulWidget {
  final String idUser;
  MentorDetails({Key key, this.idUser}) : super(key: key);

  @override
  _MentorDetailsState createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails> {
  ScrollController _scrollController = new ScrollController();
  final int _tabLength = 2;

  _onViewVideo(String url) {
    log.info(url);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(url: url),
      ),
    );
  }

  _onViewCourseDetails(String idCourse) {
    log.info(idCourse);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => CourseBloc(CourseService()),
          child: BisnisKreatifDetails(idCourse: idCourse),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final mentorBloc = BlocProvider.of<MentorBloc>(context);
    mentorBloc.add(FetchMentorByID(widget.idUser));

    return DefaultTabController(
      length: _tabLength,
      child: BlocBuilder<MentorBloc, MentorState>(
        builder: (context, state) {
          if (state is MentorIsNotLoaded)
            return SizedBox();
          else if (state is MentorIsLoading)
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppTheme.nearlyWhite),
              strokeWidth: 4,
            ));
          else if (state is MentorByIDIsLoaded)
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: 600,
                    color: AppTheme.blue_stone,
                    child: Image.network(
                      state.getMentor.imageUrl,
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
                                                state.getMentor.name,
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
                                                  state.getMentor.coachTitle,
                                                  style: AppTheme.courseTitle,
                                                ),
                                              ),
//                                              takeTheClassBtn(),
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
                                MentorDetailsOverview(
                                  value: state.getMentor,
                                ),
                                BlocProvider(
                                  builder: (context) =>
                                      CourseBloc(CourseService()),
                                  child: MentorLessonListView(
                                    idMentor: state.getMentor.idUserProfile,
                                    callback: (String idCourse) {
                                      _onViewCourseDetails(idCourse);
                                    },
                                  ),
                                ),
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
          onPressed: () {
            _onViewVideo(
                "https://res.cloudinary.com/jejaring-uploader/video/upload/v1575975066/teaser-ori_sevlga.mp4");
          },
          color: Colors.red,
          child: Text(
            "WATCH TRAILER",
            style: AppTheme.title,
          ),
        ),
      ),
    );
  }
}
