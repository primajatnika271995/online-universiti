import 'package:equatable/equatable.dart';

class CourseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchCourseByIdMentor extends CourseEvent {
  final idMentor;

  FetchCourseByIdMentor(this.idMentor);

  @override
  // TODO: implement props
  List<Object> get props => [idMentor];
}

class FetchCourseDetails extends CourseEvent {
  final idCourse;

  FetchCourseDetails(this.idCourse);

  @override
  // TODO: implement props
  List<Object> get props => [idCourse];
}

class FetchCourseOwned extends CourseEvent {

}

class ResetCourse extends CourseEvent {

}