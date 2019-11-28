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
      backgroundColor: Colors.black,
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
                              color: Colors.grey[200],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  continueInBackground(),
                                  rateOnlineUniversity(),
                                  contactSupport(),
                                  shareFeedback(),
                                  termOfService(),
                                  privacy(),
                                  logoutBtn(),
                                  versionApp(),
                                ],
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
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
            child: Text(
              "Settings",
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget continueInBackground() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Continue Video in Background",
                style: AppTheme.profileSetting,
              ),
              SizedBox(
                height: 10,
                child: Switch(
                  activeColor: AppTheme.screamin_green,
                  inactiveThumbColor: AppTheme.screamin_green,
                  inactiveTrackColor: AppTheme.nearlyWhite,
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
    );
  }

  Widget rateOnlineUniversity() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Rate Online Universiti",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactSupport() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Contact Support",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shareFeedback() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Share Feedback",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget termOfService() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Term of Service",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget privacy() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Privacy",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutBtn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          _onSignOut();
        },
        splashColor: Colors.grey,
        highlightColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Logout",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget versionApp() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {},
        splashColor: AppTheme.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Version 1.0.0.0",
                style: AppTheme.profileSetting,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "ID: 3b810192b1-9an1219-12d1f1066",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
