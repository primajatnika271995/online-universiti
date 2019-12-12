import 'package:flutter/material.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/mentor_page/mentor_what_your_learn_list_view.dart';

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
                  padding: const EdgeInsets.only(top: 6, bottom: 3),
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
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Text("WHAT YOU\'LL LEARN", style: AppTheme.subtitle),
                ),
              ],
            ),
          ),
        ),
        MentorWhatYourLearn(
          callback: () {},
        ),
      ],
    );
  }
}
