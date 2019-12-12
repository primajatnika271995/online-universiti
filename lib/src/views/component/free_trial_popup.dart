import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_university/src/utils/app_theme.dart';

void freeTrialPopup(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.8),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                title: Center(
                  child: Image.asset("assets/images/free_trial.png"),
                ),
                content: Container(
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text("Start Free Trial Now",
                            style: AppTheme.popupTitle),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    " ✓ ",
                                    style: AppTheme.subtitle),
                                Expanded(
                                  child: Text(
                                      "Akses GRATIS menonton 2 modul pelajaran untuk setiap kelas!",
                                      style: AppTheme.subtitle),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(" ✓ Belajar dari instruktur terbaik",
                                style: AppTheme.subtitle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(" ✓ Materi dapat diakses selamanya",
                                style: AppTheme.subtitle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: AppTheme.blue_stone,
                    child: Text(
                      "START NOW",
                      style: AppTheme.title,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 1000),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  });
}
