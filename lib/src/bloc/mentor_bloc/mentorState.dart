import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/courseModel.dart';
import 'package:online_university/src/models/mentorModel.dart';

class MentorState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MentorNotFound extends MentorState {

}

class MentorIsLoading extends MentorState {

}

class MentorIsLoaded extends MentorState {
  final _mentor;

  MentorIsLoaded(this._mentor);
  List<MentorModel> get getListMentor => _mentor;

  @override
  // TODO: implement props
  List<Object> get props => [_mentor];
}

class MentorByIDIsLoaded extends MentorState {
  final _mentor;

  MentorByIDIsLoaded(this._mentor);
  MentorModel get getMentor => _mentor;

  @override
  // TODO: implement props
  List<Object> get props => [_mentor];
}

class MentorIsNotLoaded extends MentorState {

}