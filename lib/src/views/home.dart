import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentor_bloc.dart';
import 'package:online_university/src/services/bisnis_kreatif_service.dart';
import 'package:online_university/src/services/login_service.dart';
import 'package:online_university/src/services/mentor_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/utils/hex_converter.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:online_university/src/views/component/free_trial_popup.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:online_university/src/views/mentor_page/mentor_details.dart';
import 'package:online_university/src/views/profile_page/profile.dart';
import 'package:online_university/src/views/watch_page/berita_list_view.dart';
import 'package:online_university/src/views/watch_page/bisnis_kreatif_list_view.dart';
import 'package:online_university/src/views/watch_page/class_preview_list_view.dart';
import 'package:online_university/src/views/watch_page/keterampilan_kreatif_list_view.dart';
import 'package:online_university/src/views/watch_page/mentor_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;

  ScrollController _scrollController = new ScrollController();

  ProfileData _profileData = new ProfileData();
  Auth _auth = new Auth();

  final int _tabLength = 2;

  bool _isHidden = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(microseconds: 2000), vsync: this);
    _onData();
    super.initState();
  }

  void _onData() async {
    _profileData.imgUrl = await SharedPreferencesHelper.getProfileImg();
    _auth.token = await SharedPreferencesHelper.getAccessToken();

//    if (_auth.token == null || _auth.token.isEmpty) {
//      freeTrialPopup(context);
//    }

    setState(() {});
  }

  void hiddenPromo() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void moveTo() {}

  _onNavigationLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => LoginBloc(LoginService()),
          child: LoginPage(),
        ),
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

  _onDetailsBerita(String idUser) {
    log.info(idUser);
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
                                _isHidden ? SizedBox() : promoContent(),
                                listBerita(),
                                BlocProvider(
                                  builder: (context) =>
                                      MentorBloc(MentorService()),
                                  child: listMentor(),
                                ),
                                BlocProvider(
                                  builder: (context) =>
                                      BisnisKreatifBloc(BisnisKreatifService()),
                                  child: classPreviews(),
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
                          Container(
                            color: Colors.black,
                            child: TabBar(
                              tabs: <Tab>[
                                Tab(text: "Bisnis Kreatif"),
                                Tab(text: 'Keterampilan Kreatif'),
                              ],
                              indicatorColor: Colors.redAccent,
                              labelStyle: AppTheme.title,
                              isScrollable: true,
                              labelPadding: EdgeInsets.symmetric(horizontal: 30),
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

  Widget promoContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 18, right: 18),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.dark_grey,
          image: DecorationImage(
            image: NetworkImage("https://i0.wp.com/www.couponsnewegg.com/wp-content/uploads/2019/03/udemy-100-off-practical-music-theory-101-for-guitar.jpg?resize=750%2C405&ssl=1"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  hiddenPromo();
                },
                borderRadius: BorderRadius.circular(100),
                child: Icon(
                  Icons.cancel,
                  color: AppTheme.dark_grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.dark_grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("Discount 70%", style: AppTheme.title),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listBerita() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 18, right: 16),
          child: Text('LATEST NEWS',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        BeritaListView(
          callback: (String idUser) {
            _onDetailsBerita(idUser);
          },
        ),
      ],
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
