import 'package:flutter/material.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/component/dots_indicator.dart';

class PageViewIntro extends StatelessWidget {
  final _pageViewCtrl = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black;

  final List<Widget> _pages = [
    Column(
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.black,
          child: Image.asset("assets/images/merah_putih.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "INDONESIA AHLI",
            style: TextStyle(
              color: AppTheme.nearlyWhite,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "JADI AHLI ITU MUDAH DAN MURAH",
          style: TextStyle(
            color: AppTheme.nearlyWhite,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
    Column(
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.black,
          child: Image.asset("assets/images/mentors.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
          child: Text(
            "Desain Pendidikan Keterampilan sudah usang. Tidak pas dan cocok dengan tuntutan jaman. Kami disini untuk mengubahnya.",
            style: TextStyle(
              color: AppTheme.nearlyWhite,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    Column(
      children: <Widget>[
        Container(
          height: 300,
          color: Colors.black,
          child: Image.asset("assets/images/mission_vision.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
          child: Text(
            "Kami adalah sekelompok profesional dan pelaku kreatif yang mengajarkan Keterampilan dan Bisnis Praktis, menuju Indonesia Berdaulat Kreatif.",
            style: TextStyle(
              color: AppTheme.nearlyWhite,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _pageViewCtrl,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            padding: const EdgeInsets.only(top: 50),
            child: new Center(
              child: new DotsIndicator(
                controller: _pageViewCtrl,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _pageViewCtrl.animateToPage(
                    page,
                    duration: _kDuration,
                    curve: _kCurve,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
