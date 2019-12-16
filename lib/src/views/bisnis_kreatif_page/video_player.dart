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
import 'package:url_launcher/url_launcher.dart';
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

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);
    _playerController = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {});
    super.initState();
  }

  _onPlayVideo(String url) {
    setState(() {
      _playerController = VideoPlayerController.network(url)
        ..initialize().then((_) {});
    });
  }

  _onViewDocument() async {
    const url = "https://drive.google.com/file/d/1cw4IrkaBnzJr2Qm5InLlT6_yDKO0ora5/view";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Couldn\'t open Document';
    }
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
              appBar(),
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
                        delegate: ContestTabHeader(resourceFile()),
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
                              _onPlayVideo(url);
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
//      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,

    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                height: 40,
                width: 200,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
        ],
      ),
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

  Widget resourceFile() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () {
                _onViewDocument();
              },
              icon: Icon(Icons.attach_file, color: AppTheme.dark_grey),
              label: Text(
                "PDF/Document (1)",
                style: TextStyle(color: AppTheme.dark_grey),
              ),
              color: AppTheme.nearlyWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.work, color: AppTheme.dark_grey),
              label: Text(
                "Certificate",
                style: TextStyle(color: AppTheme.dark_grey),
              ),
              color: AppTheme.nearlyWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


