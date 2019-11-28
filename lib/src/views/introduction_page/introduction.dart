import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/introduction_page/pageViewIntro.dart';
import 'package:online_university/src/views/login_page/login.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  _onNavigationHome() {
    Navigator.of(context).pushReplacementNamed('/');
  }

  _onNavigationLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 430,
                    child: PageViewIntro(),
                  ),
                  Column(
                    children: <Widget>[
                      signInBtn(),
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
