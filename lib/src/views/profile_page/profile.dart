import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:online_university/src/views/profile_page/profileList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences _preferences;
  ProfileData _profileData = new ProfileData();

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  void checkToken() async {
    _preferences = await SharedPreferences.getInstance();
    var isAuth = _preferences.getString(LocalStorage.ACCESS_TOKEN_KEY);

    if (isAuth != null) {
      log.info("Token { $isAuth }");
      setState(() {
        _profileData.name = _preferences.getString(LocalStorage.NAME_KEY);
        _profileData.email = _preferences.getString(LocalStorage.EMAIL_KEY);
        _profileData.imgUrl =
            _preferences.getString(LocalStorage.PROFILE_IMG_KEY);
      });
    } else {}
  }

  _onNavigationLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snaphsot) {
          if (!snaphsot.hasData)
            return SizedBox();
          else
            return Padding(
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
                        if (!snaphsot.hasData)
                          return SizedBox();
                        else
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
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
                      },
                    ),
                  ),
                ],
              ),
            );
        },
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
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
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
                    Icons.settings,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {},
                ),
              ),
            ),
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
