class UserRequest {
  final String id;
  final String password;

  const UserRequest({
    required this.id,
    required this.password,
  });

  bool get isEmpty => id.isEmpty && password.isEmpty;
}
