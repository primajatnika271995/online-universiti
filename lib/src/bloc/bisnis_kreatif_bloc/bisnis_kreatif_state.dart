import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/bisnisKreatifModel.dart';

class BisnisKreatifState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BisnisKreatifNotFound extends BisnisKreatifState {

}

class BisnisKreatifIsLoading extends BisnisKreatifState {

}

class BisnisKreatifIsLoaded extends BisnisKreatifState {
  final _data;

  BisnisKreatifIsLoaded(this._data);
  List<BisnisKreatifModel> get getListBisnisKreatif => _data;

  @override
  // TODO: implement props
  List<Object> get props => [_data];
}

class BisnisKreatifIsNotLoaded extends BisnisKreatifState {

}