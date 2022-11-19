part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

//start screen
class SendCodeEvent extends AuthEvent {
  final String email;
  SendCodeEvent({required this.email});
}

class WantToRegisterEvent extends AuthEvent {}

class AuthProblemsEvent extends AuthEvent {}
