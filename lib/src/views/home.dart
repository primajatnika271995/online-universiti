import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/utils/hexConverter.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/views/profile_page/profile.dart';
import 'package:online_university/src/views/watch_page/categoryListView.dart';
import 'package:online_university/src/views/watch_page/courseInfoScreen.dart';
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
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
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
                      freeClass(),
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
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Online Universiti",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: AppTheme.grey,
                  ),
                ),
                Text(
                  "Learning on the Go",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: AppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: AppTheme.nearlyWhite,
            backgroundImage: NetworkImage(_profileData.imgUrl != null ? _profileData.imgUrl : ''),
          ),
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
              buttonCategory(CategoryType.bisnisKreatif, categoryType == CategoryType.bisnisKreatif),
              SizedBox(
                width: 16,
              ),
              buttonCategory(CategoryType.keterampilanKreatif, categoryType == CategoryType.keterampilanKreatif),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        CategoryListView(
          callback: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget freeClass() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, right: 16),
          child: Text('Try a free class',
              textAlign: TextAlign.left, style: AppTheme.headline),
        ),
        SizedBox(
          height: 5,
        ),
        CategoryListView(
          callback: () {
            moveTo();
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
