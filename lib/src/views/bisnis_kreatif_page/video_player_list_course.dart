import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_bloc.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_event.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_state.dart';
import 'package:online_university/src/models/materi_model.dart';
import 'package:online_university/src/utils/app_theme.dart';

class VideoPlayerListCourse extends StatefulWidget {
  final idCourse;
  final Function callback;

  VideoPlayerListCourse({Key key, this.idCourse, this.callback}): super(key: key);
  
  @override
  _VideoPlayerListCourseState createState() => _VideoPlayerListCourseState();
}

class _VideoPlayerListCourseState extends State<VideoPlayerListCourse> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  // TODO: implement context
  BuildContext get context => super.context;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // ignore: close_sinks
    final materiBloc = BlocProvider.of<MateriBloc>(context);
    materiBloc.add(FetchMateriCourse(widget.idCourse));
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
                      widget.callback(value.urlContent);
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
                  left: 18, right: 18, bottom: 10),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: ListTile(
                  title: Text(data.title, style: AppTheme.title),
                  subtitle: Text("Video - 00:00 mins - Resources (1)", style: AppTheme.subtitle,),
                  trailing: Icon(Icons.file_download, color: AppTheme.nearlyWhite,),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
