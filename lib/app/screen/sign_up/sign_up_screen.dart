import 'package:advanced_error_handling/app/screen/home/home_screen.dart';
import 'package:advanced_error_handling/user/application/bloc/sign_up/sign_up_bloc.dart';
import 'package:advanced_error_handling/user/application/bloc/sign_up/sign_up_bloc_state.dart';
import 'package:advanced_error_handling/user/domain/model/user_request.dart';
import 'package:advanced_error_handling/user/domain/service/user_request_client_validation_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final idTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final signUpBloc = SignUpBloc(
      userRequestClientValidationService:
          UserRequestClientValidationService.withDefaultRules());

  @override
  void initState() {
    super.initState();
    idTextEditingController.addListener(_updateUserRequest);
    passwordTextEditingController.addListener(_updateUserRequest);
  }

  void _updateUserRequest() {
    signUpBloc.updateUserRequest(UserRequest(
      id: idTextEditingController.text,
      password: passwordTextEditingController.text,
    ));
  }

  @override
  void dispose() {
    signUpBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildFormItems(theme),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return StreamBuilder<SignUpBlocState>(
      initialData: signUpBloc.initialState,
      stream: signUpBloc.stream,
      builder: (_, snapshot) {
        final state = snapshot.data!;
        return FloatingActionButton(
          backgroundColor: _buildBackgroundColor(state),
          onPressed: () async {
            await _showAlertDialog(state);
          },
          child: _buildIcon(state),
        );
      },
    );
  }

  MaterialColor _buildBackgroundColor(SignUpBlocState state) {
    return state.when(
      empty: () => Colors.grey,
      error: (exceptions) => Colors.red,
      valid: (_) => Colors.blue,
    );
  }

  Icon _buildIcon(SignUpBlocState state) {
    return state.when(
      empty: () => const Icon(Icons.arrow_forward),
      error: (exceptions) => const Icon(Icons.close),
      valid: (_) => const Icon(Icons.arrow_forward),
    );
  }

  Future<void> _showAlertDialog(SignUpBlocState state) async {
    await state.when(
      empty: () async {
        await showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('값을 채워 주세요!'),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('값 채우기'),
                  )
                ],
              );
            });
      },
      error: (_) async {},
      valid: (_) async {
        await showDialog<void>(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: const Text('회원 가입이 완료되었습니다.'),
              actions: [
                TextButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).popUntil(
                      (route) => route.settings.name == HomeScreen.routeName,
                    );
                  },
                  child: const Text('처음 화면으로 돌아가기'),
                )
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> _buildFormItems(ThemeData theme) {
    return [
      TextField(
        controller: idTextEditingController,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: '아이디를 이메일로 입력해 주세요.',
        ),
        style: theme.textTheme.headline5?.copyWith(letterSpacing: -1),
      ),
      const SizedBox(height: 24),
      TextField(
        controller: passwordTextEditingController,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: '비밀번호를 입력해 주세요.',
        ),
        style: theme.textTheme.headline5?.copyWith(letterSpacing: -1),
      ),
      const SizedBox(height: 8),
      _buildInfoMessageWrapper(theme),
    ];
  }

  Widget _buildInfoMessageWrapper(ThemeData theme) {
    return StreamBuilder<SignUpBlocState>(
      initialData: signUpBloc.initialState,
      stream: signUpBloc.stream,
      builder: (context, snapshot) {
        final state = snapshot.data!;
        return state.when(
          empty: () => const SizedBox(width: 0, height: 0),
          error: (exceptions) => _buildErrorMessage(
            theme,
            exceptions.map((e) => e.message),
          ),
          valid: (_) => const SizedBox(width: 0, height: 0),
        );
      },
    );
  }

  Widget _buildErrorMessage(ThemeData theme, Iterable<String> messages) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: messages
          .map(
            (message) => Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                message,
                style: theme.textTheme.bodyText2?.copyWith(
                  letterSpacing: -0.4,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
