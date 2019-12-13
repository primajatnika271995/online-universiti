import 'package:equatable/equatable.dart';
import 'package:online_university/src/models/authenticated.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitial extends LoginState {

}

class LoginLoading extends LoginState {

}

class LoginFailed extends LoginState {

}

class LoginSuccess  extends LoginState {
  final _data;

  LoginSuccess(this._data);
  Authenticated get _authenticated => _data;

  @override
  // TODO: implement props
  List<Object> get props => [_data];
}