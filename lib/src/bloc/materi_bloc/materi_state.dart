import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/materiModel.dart';

class MateriState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MateriNotFound extends MateriState {

}

class MateriIsLoading extends MateriState {

}

class MateriIsLoaded extends MateriState {
  final _data;

  MateriIsLoaded(this._data);
  List<MateriModel> get getListMateri => _data;

  @override
  // TODO: implement props
  List<Object> get props => [_data];
}

class MateriIsNotLoaded extends MateriState {

}