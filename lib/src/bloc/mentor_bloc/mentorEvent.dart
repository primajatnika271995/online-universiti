import 'package:equatable/equatable.dart';

class MentorEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchMentor extends MentorEvent {

}

class FetchMentorByID extends MentorEvent {
  final userId;

  FetchMentorByID(this.userId);

  @override
  // TODO: implement props
  List<Object> get props => [userId];
}

class ResetMentor extends MentorEvent {

}