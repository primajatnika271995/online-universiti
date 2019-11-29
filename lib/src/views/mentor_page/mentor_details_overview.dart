import 'package:flutter/material.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:online_university/src/utils/appTheme.dart';

class MentorDetailsOverview extends StatelessWidget {
  MentorModel value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                "Mengawali dunia fotografi secara otodidak di tahun 1979, kini Darwis Triadi telah menjadi maestro fotografi di Indonesia. Melalui perjalanan panjang, titik balik di dunia fotografi bagi Darwis adalah ketika ia mendapatkan penghargaan Hasselblad di Jerman hingga memotret untuk majalah Vogue Prancis di tahun 1990. Hingga saat ini fotografi telah menjadi jalan hidup yang dipilihnya. Di kelas online pertamanya ini, Darwis Triadi akan mengajarkan memotret dengan berbagai teknik pencahayaan seperti lighting character dan bagaimana berimprovisasi dengan cahaya hingga menentukan angle dan komposisi yang menarik pada foto. Selain itu, Darwis juga akan bercerita bagaimana ia menciptakan suatu kualitas cahaya dalam fotonya agar selalu terlihat natural dan hidup.",
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
      ],
    );
  }
}
