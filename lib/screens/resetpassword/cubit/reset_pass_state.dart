part of 'reset_pass_cubit.dart';

enum ResetStatus { initial, submitting, success, error}

class ResetPassState extends Equatable {
  final String email;
  final ResetStatus status;
  final Failure failure;

  bool get isFormValid => email.isNotEmpty;

  const ResetPassState({
    @required this.status,
    @required this.email,
    @required this.failure,
  });

  factory ResetPassState.initial(){
    return ResetPassState(
        email: '',
        status: ResetStatus.initial,
        failure: const Failure(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, status, failure];

  ResetPassState copyWith({
    String email,
    ResetStatus status,
    Failure failure,
}) {
    return ResetPassState(
        status: status ?? this.status,
        email: email ?? this.email,
        failure: failure ?? this.failure
    );
  }
}
