import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/home.dart';
import 'package:online_university/src/views/mentor_page/mentor_details_overview.dart';

class MentorDetails extends StatefulWidget {
  @override
  _MentorDetailsState createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails> {
  ScrollController _scrollController = new ScrollController();
  final int _tabLength = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabLength,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              height: 600,
              color: AppTheme.blue_stone,
              child: Image.network(
                "https://i.ytimg.com/vi/VtmtLlEcoPg/maxresdefault.jpg",
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
                                          "Darwis Stiadi",
                                          style: TextStyle(
                                            color: AppTheme.nearlyWhite,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            "PHOTOGRAPHY COACH",
                                            style: AppTheme.courseTitle,
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
                      child: TabBarView(children: [
                        MentorDetailsOverview(),
                        Container(),
                      ],),
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
