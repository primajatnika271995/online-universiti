import 'package:flutter/material.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:online_university/src/utils/appTheme.dart';

class MentorDetailsOverview extends StatelessWidget {
  MentorModel value;
  MentorDetailsOverview({this.value});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("MEET YOUR NEW MENTOR", style: AppTheme.subtitle),
              ),
              Text(
                value.aboutMe,
                style: AppTheme.caption,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("WHAT YOU\'LL GET", style: AppTheme.subtitle),
              ),
            ],
          ),
        ),
        Container(
          color: AppTheme.dark_grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.ondemand_video,
                          color: AppTheme.nearlyWhite,
                          size: 25,
                        ),
                      ),
                      Text(
                        "32 Lessons",
                        style: AppTheme.caption,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.star_border,
                          color: AppTheme.nearlyWhite,
                          size: 25,
                        ),
                      ),
                      Text(
                        "Exclusive learning materials",
                        style: AppTheme.caption,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: AppTheme.nearlyWhite,
                          size: 25,
                        ),
                      ),
                      Text(
                        "100% guaranteed",
                        style: AppTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AppTheme.dark_grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            child: Wrap(
              spacing: 10,
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.videocam, color: AppTheme.dark_grey),
                  label: Text(
                    "Video (3)",
                    style: TextStyle(color: AppTheme.dark_grey),
                  ),
                  color: AppTheme.nearlyWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.attach_file, color: AppTheme.dark_grey),
                  label: Text(
                    "PDF/Document (1)",
                    style: TextStyle(color: AppTheme.dark_grey),
                  ),
                  color: AppTheme.nearlyWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings_backup_restore,
                      color: AppTheme.dark_grey),
                  label: Text(
                    "Examination (1)",
                    style: TextStyle(color: AppTheme.dark_grey),
                  ),
                  color: AppTheme.nearlyWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.work, color: AppTheme.dark_grey),
                  label: Text(
                    "Certificate",
                    style: TextStyle(color: AppTheme.dark_grey),
                  ),
                  color: AppTheme.nearlyWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ),
//        Container(
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                SizedBox(
//                  height: 15,
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 10),
//                  child: Text("HOW TO ENROLL", style: AppTheme.subtitle),
//                ),
//                SizedBox(
//                  height: 15,
//                ),
//                Text(
//                  "ALL-ACCESS PASS",
//                  style: AppTheme.title,
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 5),
//                  child: Text("Get unlimited access to all 60+ instruction - including ${value.name} - for IDR 2,628,450.00 / year.", style: AppTheme.subtitle),
//                ),
//              ],
//            ),
//          ),
//        ),
//        SizedBox(
//          height: 15,
//        ),
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text("IDR 2,628,450.00", style: AppTheme.title),
//              RaisedButton(
//                onPressed: () {},
//                color: Colors.red,
//                child: Text("CHOOSE", style: AppTheme.chooseBtn),
//              ),
//            ],
//          ),
//        ),
      ],
    );
  }
}
