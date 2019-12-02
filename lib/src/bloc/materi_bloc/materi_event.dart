import 'package:equatable/equatable.dart';

class MateriEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchMateriCourse extends MateriEvent {
  final idCourse;

  FetchMateriCourse(this.idCourse);

  @override
  // TODO: implement props
  List<Object> get props => [idCourse];
}

class ResetMateriCourse extends MateriEvent {

}