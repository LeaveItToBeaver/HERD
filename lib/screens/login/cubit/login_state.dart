part of 'login_cubit.dart';

enum LoginStatus {initial, submitting, success, error}
class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final Failure failure;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  LoginState copyWith({
    String email,
    String password,
    LoginStatus status,
    Failure failure,
  }) {
    if ((email == null || identical(email, this.email)) &&
        (password == null || identical(password, this.password)) &&
        (status == null || identical(status, this.status)) &&
        (failure == null || identical(failure, this.failure))) {
      return this;
    }

    return new LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
  const LoginState({
    @required this.email,
    @required this.password,
    @required this.status,
    @required this.failure,
});

  factory LoginState.initial() {
    return LoginState(
        email: '',
        password: '',
        status: LoginStatus.initial,
        failure: const Failure(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password, status, failure];
}

