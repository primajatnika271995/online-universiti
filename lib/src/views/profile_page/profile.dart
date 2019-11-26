import 'package:flutter/material.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/login_page/login.dart';
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
    } else {
      signInDialog();
    }
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
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
                        if (!snapshot.hasData)
                          return SizedBox();
                        else
                          return SingleChildScrollView(
                            child: Container(
                              child: FutureBuilder(
                                future: getData(),
                                builder: (BuildContext context, snapshot) {
                                  if (!snapshot.hasData)
                                    return SizedBox();
                                  else
                                    return Container();
                                },
                              ),
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
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppTheme.blue_stone,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: AppTheme.nearlyWhite,
                          backgroundImage: NetworkImage(_profileData.imgUrl),
                          radius: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            _profileData.name,
                            style: TextStyle(
                                color: AppTheme.nearlyWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "FOLLOWING 0 • 0 FOLLOWERS",
                            style: TextStyle(
                                color: AppTheme.nearlyWhite, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            color: AppTheme.nearlyWhite,
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  signInDialog() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
//        barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SimpleDialog(
                backgroundColor: AppTheme.blue_stone,
                title: Text(
                  "Online Universiti",
                  style: TextStyle(color: Colors.white),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 15),
                    child: Text(
                      "Sign in to access your classes",
                      style: TextStyle(color: Colors.yellow[600], fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 15),
                    child: Text(
                      "You\'ll see your saved classes. watch history, and be able setup reminders.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: AppTheme.blue_stone),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
