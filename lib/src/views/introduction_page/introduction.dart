import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_bloc.dart';
import 'package:online_university/src/services/login_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';
import 'package:online_university/src/views/introduction_page/page_view_intro.dart';
import 'package:online_university/src/views/login_page/login.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  void _checkAuth() async {
    bool _isAuth = await SharedPreferencesHelper.getSkipIntro();

    if (_isAuth == null) {
      _isAuth = false;
    }

    if (_isAuth)
      Navigator.of(context).pushReplacementNamed('/');
  }

  _onNavigationHome() async {
    await SharedPreferencesHelper.setSkipIntro(true);
    Navigator.of(context).pushReplacementNamed('/');
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _checkAuth();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 430,
                    child: PageViewIntro(),
                  ),
                  Column(
                    children: <Widget>[
//                      signInBtn(),
                      exploreBtn(),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signInBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {
            _onNavigationLogin();
          },
          color: Colors.red,
          child: Text(
            "GET ALL-ACCESS",
            style: TextStyle(color: AppTheme.nearlyWhite),
          ),
        ),
      ),
    );
  }

  Widget exploreBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: OutlineButton(
          onPressed: () {
            _onNavigationHome();
          },
          splashColor: Colors.grey,
          borderSide: BorderSide(
            color: Colors.transparent
          ),
          child: Text(
            "EXPLORE THE APP",
            style: TextStyle(color: AppTheme.nearlyWhite),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 0),
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
        ],
      ),
    );
  }
}
