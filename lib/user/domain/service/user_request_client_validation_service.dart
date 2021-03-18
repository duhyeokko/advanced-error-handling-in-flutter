import 'package:advanced_error_handling/common/validation/validation_rule.dart';
import 'package:advanced_error_handling/common/validation/validation_service.dart';
import 'package:advanced_error_handling/user/domain/exception/user_request_validation_exception.dart';
import 'package:advanced_error_handling/user/domain/model/rule/user_request_validation_rule.dart';
import 'package:advanced_error_handling/user/domain/model/user_request.dart';

class UserRequestClientValidationService
    with ValidationService<UserRequestValidationException, UserRequest> {
  @override
  final List<ValidationRule<UserRequestValidationException, UserRequest>> rules;

  const UserRequestClientValidationService({
    required this.rules,
  });

  factory UserRequestClientValidationService.withDefaultRules() =>
      UserRequestClientValidationService(rules: [
        IdEmailRule(),
        PasswordMinimumLengthRule(minLength: 10),
        PasswordRestrictionUserNameRule(),
        PasswordRestrictionMostCommonRule(commonPasswords: [
          '12345678',
          '123456789',
          '1234567890',
          '0123456789',
          '987654321',
          '00000000',
          '1q2w3e4r5t',
          'qwer123456',
          'qwertyuiop',
          'a123456789',
          'password123',
        ])
      ]);
}
