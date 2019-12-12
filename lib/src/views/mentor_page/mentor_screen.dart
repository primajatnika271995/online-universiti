import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorBloc.dart';
import 'package:online_university/src/services/mentor_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:online_university/src/views/mentor_page/mentorListView.dart';
import 'package:online_university/src/views/mentor_page/mentor_details.dart';
import 'package:online_university/src/views/watch_page/mentor_list_view.dart';

class MentorPage extends StatefulWidget {
  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {

  _onDetailsMentor(String idUser) {
    log.info(idUser);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => MentorBloc(MentorService()),
          child: MentorDetails(
            idUser: idUser,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          builder: (context) => MentorBloc(MentorService()),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      mentorList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mentorList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 18, right: 16),
          child: Text('ALL MENTOR',
              textAlign: TextAlign.left, style: AppTheme.title),
        ),
        MentorClassListView(
          callback: (String idUser) {
            _onDetailsMentor(idUser);
          },
        ),
      ],
    );
  }
}
