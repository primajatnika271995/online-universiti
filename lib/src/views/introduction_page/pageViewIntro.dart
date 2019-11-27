import 'package:flutter/material.dart';
import 'package:online_university/src/utils/appTheme.dart';

class PageViewIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.black,
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
//            SizedBox(
//              height: 10,
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 25, right: 25),
//              child: Text(
//                "Misi Kami Adalah menyediakan alternatif pendidikan keterampilan untuk siapa saja dan dimana saja. Memberikan kesempatan siapa saja untuk bisa menjadi ahli dengan mudah dan murah.",
//                style: TextStyle(
//                  color: AppTheme.nearlyWhite,
//                  fontSize: 13,
//                  fontWeight: FontWeight.w400,
//                ),
//                textAlign: TextAlign.center,
//              ),
//            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.black,
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
      ],
    );
  }
}
