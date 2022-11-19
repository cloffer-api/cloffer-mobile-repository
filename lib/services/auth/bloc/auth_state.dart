part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SendCodeState extends AuthState {
  final String email;
  final Exception? exception;
  SendCodeState({required this.email, required this.exception});
}
