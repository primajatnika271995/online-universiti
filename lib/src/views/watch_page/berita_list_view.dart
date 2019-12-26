import 'package:flutter/material.dart';
import 'package:online_university/src/models/berita_model.dart';
import 'package:online_university/src/utils/app_theme.dart';

class BeritaListView extends StatefulWidget {
  final Function callback;
  BeritaListView({Key key, this.callback}) : super(key: key);

  @override
  _BeritaListViewState createState() => _BeritaListViewState();
}

class _BeritaListViewState extends State<BeritaListView> with TickerProviderStateMixin {
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
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 16),
      child: Container(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          padding:
              const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
          itemCount: BeritaModel.listData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var value = BeritaModel.listData[index];
            var count = BeritaModel.listData.length > 10
                ? 10
                : BeritaModel.listData.length;
            var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animationController,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
            animationController.forward();

            return CategoryView(
              value: value,
              animation: animation,
              animationController: animationController,
              callback: () {
                widget.callback(value.id);
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
  final BeritaModel value;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
      this.value,
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
                callback();
              },
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(value.urlThumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: value.resourceType == "video"
                            ? Icon(Icons.play_circle_outline,
                                color: AppTheme.nearlyWhite)
                            : SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                            width: 250,
                            child: Text(value.title, style: AppTheme.title)),
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
