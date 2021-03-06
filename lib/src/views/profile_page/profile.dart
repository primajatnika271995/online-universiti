import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_university/src/bloc/course_bloc/course_bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_bloc.dart';
import 'package:online_university/src/services/course_service.dart';
import 'package:online_university/src/services/login_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:online_university/src/views/profile_page/owned_course_screen.dart';
import 'package:online_university/src/views/profile_page/profile_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences _preferences;
  ProfileData _profileData = new ProfileData();

  Future<bool> getData() async {
    var isAuth = await SharedPreferencesHelper.getAccessToken();

    if (isAuth != null) {
      _profileData.name = await SharedPreferencesHelper.getName();
      _profileData.email = await SharedPreferencesHelper.getEmail();
      _profileData.imgUrl = await SharedPreferencesHelper.getProfileImg();

      return true;
    }

    return false;
  }

  _onNavigationNotif() {
    Navigator.of(context).pushNamed('/transaction-history');
  }

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

  _onNavigationSetting() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileListPage(),
      ),
    );
  }

  _onNavigationOwnedCourse() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => CourseBloc(CourseService()),
          child: OwnedCourseScreen(
            callback: () {},
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                      break;
                    default:
                      if (snapshot.data)
                        return profileData();
                      else
                        return formLogin();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.person_outline,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Your Profile",
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                default:
                  if (snapshot.data)
                    return Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Container(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        color: Colors.white,
                        child: Material(
                          color: Colors.black,
                          child: InkWell(
                            borderRadius:
                            new BorderRadius.circular(AppBar().preferredSize.height),
                            child: Icon(
                              Icons.notifications,
                              size: 25,
                              color: AppTheme.nearlyWhite,
                            ),
                            onTap: () {
                              _onNavigationNotif();
                            },
                          ),
                        ),
                      ),
                    );
                  else
                    return SizedBox();
              }
            },
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                default:
                  if (snapshot.data)
                    return Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Container(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        color: Colors.white,
                        child: Material(
                          color: Colors.black,
                          child: InkWell(
                            borderRadius:
                            new BorderRadius.circular(AppBar().preferredSize.height),
                            child: Icon(
                              Icons.settings,
                              size: 25,
                              color: AppTheme.nearlyWhite,
                            ),
                            onTap: () {
                              _onNavigationSetting();
                            },
                          ),
                        ),
                      ),
                    );
                  else
                    return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget facebookBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: RaisedButton(
        onPressed: () {},
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                width: AppBar().preferredSize.height - 8,
                height: AppBar().preferredSize.height - 8,
                child: Icon(FontAwesomeIcons.facebookSquare,
                    color: Colors.white, size: 30),
              ),
            ),
            Text(
              "CONTINUE WITH FACEBOOK",
              style: TextStyle(
                // h6 -
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 0.18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget googleBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: RaisedButton(
        onPressed: () {},
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                width: AppBar().preferredSize.height - 8,
                height: AppBar().preferredSize.height - 8,
                child: Icon(FontAwesomeIcons.google, color: Colors.redAccent),
              ),
            ),
            Text(
              "CONTINUE WITH GOOGLE",
              style: TextStyle(
                // h6 -
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 0.18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createAccountBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppBar().preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        child: RaisedButton(
          onPressed: () {},
          color: Colors.redAccent,
          child: Text(
            "CREATE AN ACCOUNT",
            style: TextStyle(
              // h6 -
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 0.18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget signInBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: OutlineButton(
        splashColor: Colors.white70,
        onPressed: () {
          _onNavigationLogin();
        },
        child: Text(
          "LOG IN",
          style: TextStyle(color: AppTheme.nearlyWhite),
        ),
      ),
    );
  }

  Widget formLogin() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign in to get started",
            style: TextStyle(
              color: AppTheme.nearlyWhite,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Sign in to access your enrolled classes and account information.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              "By creating an account, you agree to our Terms of Service and Privacy Policy.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          googleBtn(),
          facebookBtn(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          createAccountBtn(),
          signInBtn(),
        ],
      ),
    );
  }

  Widget profileData() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(_profileData.imgUrl),
            backgroundColor: AppTheme.nearlyWhite,
            radius: 35,
          ),
          SizedBox(
            height: 10,
          ),
          Text(_profileData.name, style: AppTheme.title),
          Text("${_profileData.email} • Premium Account",
              style: AppTheme.subtitle),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.dark_grey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListTile(
                  title: Text("Course Tersimpan", style: AppTheme.title),
                  subtitle: Text(
                    "Beberapa course milik anda tersimpan disini. Silahkan pelajari course milik anda.",
                    style: AppTheme.subtitle,
                  ),
                  leading: Icon(
                    Icons.bookmark,
                    color: AppTheme.nearlyWhite,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      _onNavigationOwnedCourse();
                    },
                    color: AppTheme.nearlyWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileData {
  String name;
  String email;
  String imgUrl;

  ProfileData({
    this.name = 'Online Universiti',
    this.email = 'Online Universiti',
    this.imgUrl = '',
  });
}
