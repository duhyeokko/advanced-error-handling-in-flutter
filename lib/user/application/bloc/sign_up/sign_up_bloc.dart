import 'package:rxdart/rxdart.dart';

import 'package:advanced_error_handling/user/application/bloc/sign_up/sign_up_bloc_state.dart';
import 'package:advanced_error_handling/user/domain/model/user_request.dart';
import 'package:advanced_error_handling/user/domain/service/user_request_client_validation_service.dart';

class SignUpBloc {
  final SignUpBlocState initialState = const SignUpBlocState.empty();
  final UserRequestClientValidationService userRequestClientValidationService;
  late final BehaviorSubject<SignUpBlocState> _stateSubject;

  SignUpBloc({
    required this.userRequestClientValidationService,
  }) {
    _stateSubject = BehaviorSubject.seeded(initialState);
  }

  ValueStream<SignUpBlocState> get stream => _stateSubject.stream;
  SignUpBlocState get currentState =>
      _stateSubject.value ?? const SignUpBlocState.empty();

  void dispose() {
    _stateSubject.close();
  }

  void updateUserRequest(UserRequest userRequest) {
    userRequest.isEmpty
        ? _stateSubject.sink.add(const SignUpBlocState.empty())
        : userRequestClientValidationService.validate(userRequest).fold(
            (l) => _stateSubject.sink.add(SignUpBlocState.error(l)),
            (r) => _stateSubject.sink.add(SignUpBlocState.valid(r)));
  }
}
