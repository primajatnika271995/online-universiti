import 'package:equatable/equatable.dart';

class BisnisKreatifEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchBisnisKreatif extends BisnisKreatifEvent {
  final category;

  FetchBisnisKreatif(this.category);

  @override
  // TODO: implement props
  List<Object> get props => [category];
}

class ResetBisnisKreatif extends BisnisKreatifEvent {

}