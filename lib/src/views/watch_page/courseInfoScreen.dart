import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:online_university/src/models/courseDetails.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  YoutubePlayerController youtubePlayerController;
  ScrollController _scrollController = new ScrollController();

  InfoTabType infoType = InfoTabType.watch;

  String videoID = "5bTE5fbxDsc";

  bool _isDownload = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        forceHideAnnotation: true,
      ),
    );
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: <Widget>[
                  mainVideo(),
                  Expanded(
                    child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[
                                    mentorUI(),
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
                              fillterBar(),
                            ),
                          ),
                        ];
                      },
                      body: SingleChildScrollView(
                        child: Container(
                          color: AppTheme.nearlyWhite,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 13, right: 13, top: 10),
                                child: Text(
                                    "Strategi Efektif Belajar Gitar Akustik & Elektrik dengan Mudah.",
                                    style: AppTheme.title),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.black12,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("Premium Course",
                                            style: AppTheme.badge),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, right: 2),
                                      child: Icon(Icons.access_time,
                                          size: 16, color: AppTheme.dark_grey),
                                    ),
                                    Text("5h 60m", style: AppTheme.subtitle),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child:
                                          Text("•", style: AppTheme.subtitle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(Icons.favorite_border,
                                          size: 16, color: AppTheme.dark_grey),
                                    ),
                                    Text("0%", style: AppTheme.subtitle),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child:
                                          Text("•", style: AppTheme.subtitle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: Icon(Icons.person_outline,
                                          size: 16, color: AppTheme.dark_grey),
                                    ),
                                    Text("2.2K", style: AppTheme.subtitle),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: Divider(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: SizedBox(
                                  height: 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Download", style: AppTheme.download),
                                      Switch(
                                        value: _isDownload,
                                        onChanged: (value) {
                                          setState(() {
                                            _isDownload = value;
                                          });
                                        },
                                        activeColor: AppTheme.blue_stone,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FutureBuilder(
                                future: getData(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: 70,
                                              width: 120,
                                              child: Skeleton(
                                                height: 70,
                                                width: 120,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 250,
                                                    padding: EdgeInsets.only(
                                                        bottom: 5),
                                                    child: Skeleton(width: 250),
                                                  ),
                                                  Skeleton(width: 250)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  else
                                    return courseList();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainVideo() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
//            color: AppTheme.blue_stone,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          height: 250,
          child: YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            bufferIndicator: CircularProgressIndicator(),
            onReady: () {
              print("Main Video Already");
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 8, right: 8),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: AppBar().preferredSize.height + 40,
                  height: AppBar().preferredSize.height,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child:
                            Icon(Icons.arrow_back, color: AppTheme.nearlyWhite),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "",
                      style: AppTheme.title,
                    ),
                  ),
                ),
                Container(
                  width: AppBar().preferredSize.height + 40,
                  height: AppBar().preferredSize.height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.bookmark_border,
                                color: AppTheme.nearlyWhite),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.more_horiz,
                                color: AppTheme.nearlyWhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mentorUI() {
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
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      child: FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Container(height: 50);
                          else
                            return Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252"),
                                  radius: 25,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Ari Moreno ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: AppTheme.nearlyBlack,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "• Follow",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: AppTheme.blue_stone,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Musician",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                        },
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
              color: AppTheme.nearlyWhite,
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
          color: AppTheme.nearlyWhite,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                buttonCategory(
                    InfoTabType.watch, infoType == InfoTabType.watch),
                SizedBox(
                  width: 16,
                ),
                buttonCategory(
                    InfoTabType.about, infoType == InfoTabType.about),
                SizedBox(
                  width: 16,
                ),
                buttonCategory(
                    InfoTabType.discuss, infoType == InfoTabType.discuss),
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
    if (InfoTabType.watch == infoTabType)
      txt = 'Watch';
    else if (InfoTabType.about == infoTabType)
      txt = 'About';
    else if (InfoTabType.discuss == infoTabType) txt = 'Discuss';

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

  Widget courseList() {
    return ListView.builder(
      itemCount: CourseDetails.courseDetailList.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            onTap: () {
              setState(() {
                print(CourseDetails.courseDetailList[index].idVideo);
                youtubePlayerController
                    .load(CourseDetails.courseDetailList[index].idVideo);
              });
            },
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppTheme.grey,
                        image: DecorationImage(
                          image: NetworkImage(CourseDetails
                              .courseDetailList[index].thumbnailUrl),
                        ),
                      ),
                    ),
                    CourseDetails.courseDetailList[index].lock
                        ? Container(
                            width: 120,
                            height: 70,
                            color: Colors.black45,
                            child: Center(
                              child: Icon(
                                Icons.lock,
                                color: AppTheme.nearlyWhite,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 250,
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          CourseDetails.courseDetailList[index].courseName,
                          style: AppTheme.title,
                        ),
                      ),
                      Text(
                        CourseDetails.courseDetailList[index].times,
                        style: AppTheme.courseSub,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final Widget searchUI;
  ContestTabHeader(
    this.searchUI,
  );
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

enum InfoTabType {
  watch,
  about,
  discuss,
}
