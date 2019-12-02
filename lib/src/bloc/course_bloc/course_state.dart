import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/courseModel.dart';

class CourseState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CourseNotFound extends CourseState {

}

class CourseIsLoading extends CourseState {

}

class CourseIsLoaded extends CourseState {
  final _data;

  CourseIsLoaded(this._data);
  List<CourseModel> get getListCourse => _data;

  @override
  // TODO: implement props
  List<Object> get props => [_data];
}

class CourseIsNotLoaded extends CourseState {

}