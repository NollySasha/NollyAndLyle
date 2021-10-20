enum EventType { login, logout }

class AuthEvent {
  late EventType eventType;

  AuthEvent.login() {
    this.eventType = EventType.login;
  }

  AuthEvent.logout() {
    this.eventType = EventType.logout;
  }
}
