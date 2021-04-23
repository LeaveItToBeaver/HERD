part of 'signup_cubit.dart';

enum SignupStatus {initial, submitting, success, error}
class SignupState extends Equatable {
  final String username;
  final String email;
  final String password;
  final SignupStatus status;
  final Failure failure;

  bool get isFormValid => username.isNotEmpty &&
      email.isNotEmpty && password.isNotEmpty;

  SignupState copyWith({
    String username,
    String email,
    String password,
    SignupStatus status,
    Failure failure,
  }) {
    if ((username == null || identical(username, this.username)) &&
        (email == null || identical(email, this.email)) &&
        (password == null || identical(password, this.password)) &&
        (status == null || identical(status, this.status)) &&
        (failure == null || identical(failure, this.failure))) {
      return this;
    }

    return new SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
  const SignupState({
    @required this.username,
    @required this.email,
    @required this.password,
    @required this.status,
    @required this.failure,
  });

  factory SignupState.initial() {
    return SignupState(
      username: '',
      email: '',
      password: '',
      status: SignupStatus.initial,
      failure: const Failure(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, email, password, status, failure];
}

