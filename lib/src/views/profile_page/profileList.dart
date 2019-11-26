import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileListPage extends StatefulWidget {
  @override
  _ProfileListPageState createState() => _ProfileListPageState();
}

class _ProfileListPageState extends State<ProfileListPage> {
  SharedPreferences _preferences;

  bool _playBackground = false;

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  void _onSignOut() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();

    Navigator.of(context).pushReplacementNamed('/');
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
                          return Container(
                            child: FutureBuilder(
                              future: getData(),
                              builder: (BuildContext context, snapshot) {
                                if (!snapshot.hasData)
                                  return SizedBox();
                                else
                                  return SingleChildScrollView(
                                    child: Container(
                                      color: Colors.grey[200],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              "Notifications",
                                              style: AppTheme.download,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Personalized Notifications",
                                                      style: AppTheme.title,
                                                    ),
                                                    Text(
                                                      "You\'re all set to get personalized updated and alerts.",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              "Playback",
                                              style: AppTheme.download,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      "Continue Video in Background",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                      child: Switch(
                                                        activeColor: AppTheme.blue_stone,
                                                        value: _playBackground,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _playBackground = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              "Get In Touch",
                                              style: AppTheme.download,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Rate Online Universiti",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Contact Support",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Share Feedback",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Term of Service",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Privacy",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {
                                                _onSignOut();
                                              },
                                              splashColor: AppTheme.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Sign Out",
                                                      style: TextStyle(
                                                        color:
                                                            AppTheme.blue_stone,
                                                        fontWeight:
                                                            FontWeight.w600
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppTheme.nearlyWhite,
                                            child: InkWell(
                                              onTap: () {},
                                              splashColor: AppTheme.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20,
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      "Version 1.0.0.0",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "ID: 3b810192b1-9an1219-12d1f1066",
                                                      style: AppTheme.subtitle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                              },
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
        color: AppTheme.nearlyWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
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
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Settings",
                style: new TextStyle(
                  fontSize: 22,
                  color: AppTheme.darkText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
