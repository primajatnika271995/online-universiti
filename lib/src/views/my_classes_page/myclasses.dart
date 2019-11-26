import 'package:flutter/material.dart';
import 'package:online_university/src/config/localStorage.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/login_page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyClassesPage extends StatefulWidget {
  @override
  _MyClassesPageState createState() => _MyClassesPageState();
}

class _MyClassesPageState extends State<MyClassesPage> {
  SharedPreferences _preferences;

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  void checkToken() async {
    _preferences = await SharedPreferences.getInstance();
    var isAuth = _preferences.getString(LocalStorage.ACCESS_TOKEN_KEY);

    if (isAuth != null)
      log.info("Token { $isAuth }");
    else
      signInDialog();
  }

  @override
  void initState() {
//    signInDialog();
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
                          return Container(
                            child: FutureBuilder(
                              future: getData(),
                              builder: (BuildContext context, snapshot) {
                                if (!snapshot.hasData)
                                  return SizedBox();
                                else
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 20,
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.cloud_download,
                                                    size: 30,
                                                    color: AppTheme.grey),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Text(
                                                    "Downloads",
                                                    style: AppTheme.download,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text("Lists",
                                              style: AppTheme.title),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 85,
                                                  height: 50,
                                                  color: Colors.black26,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text("All Saved Classes",
                                                          style: AppTheme
                                                              .download),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text("0 Classes",
                                                          style: AppTheme
                                                              .subtitle),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 85,
                                                  height: 50,
                                                  color: Colors.black26,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text("Watch History",
                                                          style: AppTheme
                                                              .download),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text("0 Classes",
                                                          style: AppTheme
                                                              .subtitle),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "My Classes",
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
                        child: Icon(Icons.alarm),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  signInDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
          });
    });
  }
}
