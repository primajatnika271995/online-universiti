import 'package:flutter/material.dart';
import 'package:online_university/src/models/courseDetailsModel.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/currencyFormatted.dart';

class BisnisKreatifOverview extends StatelessWidget {
  CourseDetailsModel value;
  BisnisKreatifOverview({this.value});

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
                  child: Text("Get unlimited access to all 60+ instruction - including ${value.mentorName} - for IDR ${value.coursePrice} / year.", style: AppTheme.subtitle),
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
              Text(formattedCoursePrice(value.coursePrice), style: AppTheme.title),
              RaisedButton(
                onPressed: () {},
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
