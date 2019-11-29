import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorEvent.dart';
import 'package:online_university/src/bloc/mentor_bloc/mentorState.dart';
import 'package:online_university/src/models/courseModel.dart';
import 'package:online_university/src/models/mentorModel.dart';
import 'package:online_university/src/services/mentorService.dart';
import 'package:online_university/src/views/component/log.dart';

class MentorBloc extends Bloc<MentorEvent, MentorState> {

  MentorService mentorService;
  MentorBloc(this.mentorService);

  @override
  // TODO: implement initialState
  MentorState get initialState => MentorIsNotLoaded();

  @override
  Stream<MentorState> mapEventToState(MentorEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchMentor) {
      yield MentorIsLoading();

      try {
        List<MentorModel> listMentor = await mentorService.getListMentor();
        yield MentorIsLoaded(listMentor);
      } catch(err) {
        log.warning(err.toString());
        yield MentorIsNotLoaded();
      }
    }

    if (event is FetchMentorByID) {
      yield MentorIsLoading();

      try {
        MentorModel mentor = await mentorService.getMentorByID(event.userId);
        log.info(mentor.name);
        yield MentorByIDIsLoaded(mentor);
      } catch(err) {
        log.warning(err.toString());
        yield MentorIsNotLoaded();
      }
    }
  }
}