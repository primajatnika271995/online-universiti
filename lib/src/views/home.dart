import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorBloc.dart';
import 'package:online_university/src/services/bisnisKreatifService.dart';
import 'package:online_university/src/services/mentorService.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/utils/hexConverter.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/views/bisnis_kreatif_page/bisnis_kreatif_details.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:online_university/src/views/mentor_page/mentor_details.dart';
import 'package:online_university/src/views/profile_page/profile.dart';
import 'package:online_university/src/views/watch_page/bisnisKreatifListView.dart';
import 'package:online_university/src/views/watch_page/classPreviewListView.dart';
import 'package:online_university/src/views/watch_page/keterampilanKreatifListView.dart';
import 'package:online_university/src/views/watch_page/mentorListView.dart';
import 'package:online_university/src/views/watch_page/popularClassListView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  SharedPreferences _preferences;

  ScrollController _scrollController = new ScrollController();

  CategoryType categoryType = CategoryType.bisnisKreatif;
  ProfileData _profileData = new ProfileData();
  Auth _auth = new Auth();

  final int _tabLength = 2;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(microseconds: 2000), vsync: this);
    _onData();
    super.initState();
  }

  Future<bool> renderData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  void _onData() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _profileData.imgUrl =
          _preferences.getString(LocalStorage.PROFILE_IMG_KEY);
      _auth.token = _preferences.getString(LocalStorage.ACCESS_TOKEN_KEY);
    });
  }

  _onNavigationLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  _onDetailsMentor(String idUser) {
    log.info(idUser);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => MentorBloc(MentorService()),
          child: MentorDetails(
            idUser: idUser,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabLength,
      child: Container(
        color: Colors.black,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              appBar(),
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
                                searchBar(),
                                BlocProvider(
                                  builder: (context) =>
                                      MentorBloc(MentorService()),
                                  child: listMentor(),
                                ),
                                classPreviews(),
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
                          Container(
                            color: Colors.black,
                            child: TabBar(
                              tabs: <Tab>[
                                Tab(text: "Bisnis Kreatif"),
                                Tab(text: 'Keterampilan Kreatif'),
                              ],
                              indicatorColor: Colors.redAccent,
                              labelStyle: AppTheme.title,
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      BlocProvider(
                        builder: (context) =>
                            BisnisKreatifBloc(BisnisKreatifService()),
                        child: BisnisKreatifListView(
                          callback: () {},
                        ),
                      ),
                      BlocProvider(
                        builder: (context) =>
                            BisnisKreatifBloc(BisnisKreatifService()),
                        child: KeterampilanKreatifListView(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: _auth.token == null ? 80 : 0),
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
          (_auth.token == null)
              ? OutlineButton(
                  onPressed: _onNavigationLogin,
                  highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  child: Text(
                    "LOG IN",
                    style: TextStyle(color: AppTheme.nearlyWhite),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.91,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: new BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: new TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.blue_stone,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget listMentor() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 18, right: 16),
          child: Text('COURSE MENTOR',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        MentorListView(
          callback: (String idUser) {
            _onDetailsMentor(idUser);
          },
        ),
      ],
    );
  }

  Widget classPreviews() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
          child: Text('LATEST CLASS',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        ClassPreviewListView(
          callback: () {
//            moveTo();
          },
        ),
      ],
    );
  }

  void moveTo() {}

  Widget buttonCategory(CategoryType categoryTypeData, bool isSelected) {
    var txt = '';
    if (CategoryType.bisnisKreatif == categoryTypeData)
      txt = 'Bisnis Kreatif';
    else if (CategoryType.keterampilanKreatif == categoryTypeData)
      txt = 'Keterampilan Kreatif';

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
                categoryType = categoryTypeData;
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

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final Widget searchUI;
  ContestTabHeader(this.searchUI);

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

enum CategoryType {
  bisnisKreatif,
  keterampilanKreatif,
}
