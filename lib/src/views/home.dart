import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/utils/hexConverter.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:online_university/src/views/profile_page/profile.dart';
import 'package:online_university/src/views/watch_page/classPreviewListView.dart';
import 'package:online_university/src/views/watch_page/mentorListView.dart';
import 'package:online_university/src/views/watch_page/courseInfoScreen.dart';
import 'package:online_university/src/views/watch_page/popularClassListView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  SharedPreferences _preferences;

  CategoryType categoryType = CategoryType.bisnisKreatif;
  ProfileData _profileData = new ProfileData();
  Auth _auth = new Auth();

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
      _profileData.imgUrl = _preferences.getString(LocalStorage.PROFILE_IMG_KEY);
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

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      searchBar(),
                      categoryUI(),
                      classPreviews(),
                      popularClasses(),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
          (_auth.token == null) ? OutlineButton(
            onPressed: () {
              _onNavigationLogin();
            },
            highlightColor: Colors.grey,
            splashColor: Colors.grey,
            child: Text(
              "LOG IN",
              style: TextStyle(color: AppTheme.nearlyWhite),
            ),
          ) : SizedBox(),
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
            width: MediaQuery.of(context).size.width * 0.75,
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

  Widget categoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
          child: Text('Kamu mau jadi Ahli apa?',
              textAlign: TextAlign.left, style: AppTheme.headline),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              buttonCategory(CategoryType.bisnisKreatif,
                  categoryType == CategoryType.bisnisKreatif),
              SizedBox(
                width: 16,
              ),
              buttonCategory(CategoryType.keterampilanKreatif,
                  categoryType == CategoryType.keterampilanKreatif),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
          child: Text('CLASS MENTOR',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        MentorListView(
          callback: () {
            moveTo();
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
          child: Text('CLASS PREVIEWS',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        ClassPreviewListView(
          callback: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget popularClasses() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
          child: Text('POPULAR CLASSES',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        PopularClassListView(
          callback: () {
//            moveTo();
          },
        ),
      ],
    );
  }

  void moveTo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseInfoScreen(),
      ),
    );
  }

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

enum CategoryType {
  bisnisKreatif,
  keterampilanKreatif,
}
