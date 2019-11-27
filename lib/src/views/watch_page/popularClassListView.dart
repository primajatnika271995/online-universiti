import 'package:flutter/material.dart';
import 'package:online_university/src/models/classPreviews.dart';
import 'package:online_university/src/models/popularClass.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/utils/hexConverter.dart';

class PopularClassListView extends StatefulWidget {
  final Function callback;
  PopularClassListView({Key key, this.callback}) : super(key: key);

  @override
  _PopularClassListViewState createState() => _PopularClassListViewState();
}

class _PopularClassListViewState extends State<PopularClassListView>
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
      padding: const EdgeInsets.only(top: 5, bottom: 16, left: 3),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            return ListView.builder(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
              itemCount: PopularClass.listPopularClass.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var count = PopularClass.listPopularClass.length > 10
                    ? 10
                    : PopularClass.listPopularClass.length;
                var animation = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();

                return CategoryView(
                  category: PopularClass.listPopularClass[index],
                  animation: animation,
                  animationController: animationController,
                  callback: () {
                    widget.callback();
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final PopularClass category;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () {
                  callback();
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 55,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(category.imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Container(
                                width: 160,
                                child: Text(category.mentorName,
                                    style: AppTheme.title)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 3, left: 10),
                              child:
                                  Text(category.jobs, style: AppTheme.subtitle))
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
