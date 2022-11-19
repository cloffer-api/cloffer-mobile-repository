import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider) : super(AuthInitial()) {
    on<SendCodeEvent>((event, emit) {
      try {
        provider.sendEmailCode(email: event.email);
        emit(SendCodeState(email: event.email, exception: null));
      } on Exception catch (e) {
        emit(SendCodeState(email: event.email, exception: e));
      }
    });
  }
}
