import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herd/models/failure_model.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  final AuthRepository _authRepository;
  ResetPassCubit({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetPassState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: ResetStatus.initial));
  }

  void resetPassword() async {
    if(!state.isFormValid || state.status == ResetStatus.submitting) return;
    emit(state.copyWith(status: ResetStatus.submitting));
    try{
      await _authRepository.resetPassword(
          email: state.email
      );
      emit(state.copyWith(status: ResetStatus.success));
    } on Failure catch (err) {
      emit(state.copyWith(failure: err, status: ResetStatus.error));
    }
  }
}
