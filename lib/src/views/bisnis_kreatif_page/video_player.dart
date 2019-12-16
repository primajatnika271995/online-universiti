import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_event.dart';
import 'package:online_university/src/bloc/course_bloc/course_state.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_bloc.dart';
import 'package:online_university/src/services/materi_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/video_player_list_course.dart';
import 'package:online_university/src/views/home.dart';
import 'package:video_player/video_player.dart';
import 'package:custom_chewie/custom_chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final String idCourse;
  final String title;
  final String mentor;
  VideoPlayerScreen({this.url, this.idCourse, this.title, this.mentor});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> with TickerProviderStateMixin {
  VideoPlayerController _playerController;
  ScrollController _scrollController = new ScrollController();

  InfoTabType infoType = InfoTabType.lectures;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);
    _playerController = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _playerController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // ignore: close_sinks
    final courseBloc = BlocProvider.of<CourseBloc>(context);
    courseBloc.add(FetchCourseDetails(widget.idCourse));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              mainVideo(),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, scrolled) {
                    return <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Column(
                            children: <Widget>[
                              lessonTitle(),
                            ],
                          );
                        }, childCount: 1),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: ContestTabHeader(fillterBar()),
                      ),
                    ];
                  },
                  body: BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseIsNotLoaded)
                        return SizedBox();
                      else if (state is CourseIsLoading)
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(AppTheme.nearlyWhite),
                            strokeWidth: 4,
                          ),
                        );
                      else if (state is CourseDetailsIsLoaded) {
                        return BlocProvider(
                          builder: (context) => MateriBloc(MateriService()),
                          child: VideoPlayerListCourse(
                            idCourse: state.getDetailsCourse.idCourse,
                            callback: (String url) {
//                                      _onViewVideo(url);
                            },
                          ),
                        );
                      }
                      return Text("s", style: AppTheme.title);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget mainVideo() {
    return Chewie(
      _playerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
    );
  }

  Widget lessonTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 13),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: AppTheme.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppTheme.nearlyWhite,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                widget.mentor,
                                style: AppTheme.subtitle,
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
          ),
        ],
      ),
    );
  }

  Widget fillterBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                buttonCategory(
                    InfoTabType.lectures, infoType == InfoTabType.lectures),
                SizedBox(
                  width: 16,
                ),
                buttonCategory(
                    InfoTabType.more, infoType == InfoTabType.more),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  Widget buttonCategory(InfoTabType infoTabType, bool isSelected) {
    var txt = '';
    if (InfoTabType.lectures == infoTabType)
      txt = 'Lectures';
    else if (InfoTabType.more == infoTabType)
      txt = 'More';

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.blue_stone : AppTheme.nearlyWhite,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: AppTheme.blue_stone),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(24)),
            onTap: () {
              setState(() {
                infoType = infoTabType;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 0.27,
                      color: isSelected
                          ? AppTheme.nearlyWhite
                          : AppTheme.blue_stone),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum InfoTabType {
  lectures,
  more,
}

