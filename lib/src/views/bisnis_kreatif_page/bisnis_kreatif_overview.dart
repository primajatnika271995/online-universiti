import 'package:flutter/material.dart';
import 'package:online_university/src/models/course_details_model.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/component/currency_formatted.dart';

class BisnisKreatifOverview extends StatelessWidget {
  final Function callback;
  final CourseDetailsModel value;
  BisnisKreatifOverview({Key key, this.value, this.callback}) : super(key: key);

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
                value.courseDescription,
                style: AppTheme.caption,
                textAlign: TextAlign.justify,
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
                  padding: const EdgeInsets.only(top: 5, bottom: 3),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.video_library,
                          color: AppTheme.nearlyWhite,
                          size: 25,
                        ),
                      ),
                      Text(
                        "${value.totalMateri} Chapter",
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
                        "${value.rating}",
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("HOW TO ENROLL", style: AppTheme.subtitle),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "ALL-ACCESS PASS",
                  style: AppTheme.title,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Get unlimited access to all 60+ instruction - including ${value.mentorName} - for ${formattedCoursePrice(value.coursePrice)} / year.",
                    style: AppTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(formattedCoursePrice(value.coursePrice),
                  style: AppTheme.title),
              RaisedButton(
                onPressed: () {
                  callback();
                },
                color: Colors.red,
                child: Text("CHOOSE", style: AppTheme.chooseBtn),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
