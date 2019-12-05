import 'package:equatable/equatable.dart';

class TransactionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchTransaction extends TransactionEvent {
  final status;

  FetchTransaction(this.status);

  @override
  // TODO: implement props
  List<Object> get props => [this.status];
}

class ResetTransaction extends TransactionEvent {

}