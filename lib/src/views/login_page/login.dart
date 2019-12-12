import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_university/src/config/local_storage.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/bloc/loginBloc.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool _loading = false;

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  void _onLoginButton() async {
    _onToggleLoading();
    await loginBloc.login(context, usernameCtrl.text, passwordCtrl.text);
    _onToggleLoading();
  }

  _onToggleLoading() {
    setState(() {
      _loading = !_loading;
    });
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
                          return SingleChildScrollView(
                            child: Container(
                              child: FutureBuilder(
                                future: getData(),
                                builder: (BuildContext context, snapshot) {
                                  if (!snaphsot.hasData)
                                    return SizedBox();
                                  else
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          emailField(),
                                          passwordField(),
                                          _loading
                                              ? loadingReplace()
                                              : signInBtn(),
                                          forgotBtn(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Text(
                                              "Need help? Contact our Support team!",
                                              style: AppTheme.subtitle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
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

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: TextStyle(color: AppTheme.nearlyWhite),
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
        ),
        controller: usernameCtrl,
        style: TextStyle(color: AppTheme.nearlyWhite),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: AppTheme.nearlyWhite),
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
        ),
        controller: passwordCtrl,
        style: TextStyle(color: AppTheme.nearlyWhite),
      ),
    );
  }

  Widget signInBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {
            _onLoginButton();
          },
          color: AppTheme.blue_stone,
          child: Text(
            "Sign In",
            style: TextStyle(color: AppTheme.nearlyWhite),
          ),
        ),
      ),
    );
  }

  Widget forgotBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: OutlineButton(
        onPressed: () {},
        child: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 11, color: AppTheme.nearlyWhite),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        highlightColor: Colors.white,
        splashColor: Colors.grey,
      ),
    );
  }

  Widget loadingReplace() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppTheme.blue_stone),
          strokeWidth: 4,
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
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 8.0,
          ),
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
              color: Colors.black,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.nearlyWhite,
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
                "Log In",
                style: new TextStyle(
                  fontSize: 22,
                  color: AppTheme.nearlyWhite,
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

class Auth {
  String token;

  Auth({this.token});
}
