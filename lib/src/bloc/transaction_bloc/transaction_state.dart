import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/transactionModel.dart';

class TransactionState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TransactionNotFound extends TransactionState {

}

class TransactionIsLoading extends TransactionState {

}

class TransactionIsLoaded extends TransactionState {
  final _data;

  TransactionIsLoaded(this._data);

  List<TransactionModel> get getListTransaction => _data;

  @override
  // TODO: implement props
  List<Object> get props => [_data];
}

class TransactionIsNotLoaded extends TransactionState {

}