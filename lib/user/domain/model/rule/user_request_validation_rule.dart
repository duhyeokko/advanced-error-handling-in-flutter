import 'package:dartz/dartz.dart';

import 'package:advanced_error_handling/common/validation/validation_rule.dart';
import 'package:advanced_error_handling/user/domain/exception/user_request_validation_exception.dart';
import 'package:advanced_error_handling/user/domain/model/user_request.dart';

abstract class UserRequestValidationRule
    implements ValidationRule<UserRequestValidationException, UserRequest> {}

class IdEmailRule extends UserRequestValidationRule {
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final errorMessage = '아이디는 이메일 형식으로 입력하셔야 해요!';

  @override
  Either<UserRequestValidationException, UserRequest> validate(
      UserRequest userRequest) {
    return emailRegex.hasMatch(userRequest.id)
        ? right(userRequest)
        : left(
            UserRequestValidationException(
              userRequest: userRequest,
              message: errorMessage,
            ),
          );
  }
}

class PasswordMinimumLengthRule extends UserRequestValidationRule {
  final int minLength;
  String errorMessage(int inputLength, int minLength) => (inputLength == 0)
      ? '비밀번호를 $minLength자리 이상 입력하셔야 해요!'
      : '비밀번호를 $inputLength자리 입력하셨어요. $minLength자리 이상 입력하셔야 해킹당할 가능성이 줄어들어요!';

  PasswordMinimumLengthRule({required this.minLength});

  @override
  Either<UserRequestValidationException, UserRequest> validate(
      UserRequest userRequest) {
    final inputLength = userRequest.password.length;

    return inputLength < minLength
        ? left(UserRequestValidationException(
            userRequest: userRequest,
            message: errorMessage(inputLength, minLength)))
        : right(userRequest);
  }
}

class PasswordRestrictionUserNameRule extends UserRequestValidationRule {
  final errorMessage =
      '사용자 이름을 비밀번호에 사용하셨어요. 비밀번호에서 사용자 이름을 제거하여 추측할 만한 단서를 제거하면 해킹당할 가능성이 줄어들어요!';

  @override
  Either<UserRequestValidationException, UserRequest> validate(
      UserRequest userRequest) {
    final userId = userRequest.id;
    final userName = userId.contains('@') ? userId.split('@')[0] : userId;

    return userId.isEmpty
        ? right(userRequest)
        : userRequest.password.contains(userName)
            ? left(UserRequestValidationException(
                userRequest: userRequest, message: errorMessage))
            : right(userRequest);
  }
}

class PasswordRestrictionMostCommonRule extends UserRequestValidationRule {
  final errorMessage =
      '전 세계에서 제일 많이 쓰이는 비밀번호를 사용하셨어요. 남이 안 쓸만한 비밀번호를 사용하신다면 해킹당할 가능성이 줄어들어요!';
  final List<String> commonPasswords;

  PasswordRestrictionMostCommonRule({
    required this.commonPasswords,
  });

  @override
  Either<UserRequestValidationException, UserRequest> validate(
      UserRequest userRequest) {
    final userPassword = userRequest.password;

    return userPassword.isEmpty
        ? right(userRequest)
        : commonPasswords.contains(userPassword)
            ? left(UserRequestValidationException(
                userRequest: userRequest, message: errorMessage))
            : right(userRequest);
  }
}
