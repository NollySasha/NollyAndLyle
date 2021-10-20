import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event.eventType) {
      case EventType.login:
        yield LoggedIn();
        break;
      case EventType.logout:
        yield NotLoggedIn();
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}
