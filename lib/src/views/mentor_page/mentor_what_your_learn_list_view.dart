import 'package:flutter/material.dart';
import 'package:online_university/src/models/popularClass.dart';
import 'package:online_university/src/utils/appTheme.dart';

class MentorWhatYourLearn extends StatefulWidget {
  final Function callback;
  MentorWhatYourLearn({Key key, this.callback}) : super(key: key);

  @override
  _MentorWhatYourLearnState createState() => _MentorWhatYourLearnState();
}

class _MentorWhatYourLearnState extends State<MentorWhatYourLearn>
    with TickerProviderStateMixin {
  AnimationController animationController;

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
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 220,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 0, right: 5, left: 5),
          itemCount: WhatYourLearnModel.listData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var value = WhatYourLearnModel.listData[index];
            var count = WhatYourLearnModel.listData.length > 10
                ? 10
                : WhatYourLearnModel.listData.length;
            var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
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
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final WhatYourLearnModel data;
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
//                callback();
              },
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 230,
                            decoration: BoxDecoration(
                              color: AppTheme.dark_grey,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(data.imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 230,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: Text(data.desc, style: AppTheme.title),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
