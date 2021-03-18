import 'package:advanced_error_handling/user/domain/model/user_request.dart';

class UserRequestValidationException implements Exception {
  final UserRequest userRequest;
  final String message;

  const UserRequestValidationException({
    required this.userRequest,
    required this.message,
  });
}
