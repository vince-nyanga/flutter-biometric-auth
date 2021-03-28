import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
}
