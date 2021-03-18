import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:advanced_error_handling/user/domain/exception/user_request_validation_exception.dart';
import 'package:advanced_error_handling/user/domain/model/user_request.dart';

part 'sign_up_bloc_state.freezed.dart';

@freezed
class SignUpBlocState with _$SignUpBlocState {
  const factory SignUpBlocState.empty() = Empty;
  const factory SignUpBlocState.error(
      Iterable<UserRequestValidationException> exceptions) = Error;
  const factory SignUpBlocState.valid(UserRequest userRequest) = Valid;
}
