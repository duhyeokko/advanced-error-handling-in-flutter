// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpBlocStateTearOff {
  const _$SignUpBlocStateTearOff();

  Empty empty() {
    return const Empty();
  }

  Error error(Iterable<UserRequestValidationException> exceptions) {
    return Error(
      exceptions,
    );
  }

  Valid valid(UserRequest userRequest) {
    return Valid(
      userRequest,
    );
  }
}

/// @nodoc
const $SignUpBlocState = _$SignUpBlocStateTearOff();

/// @nodoc
mixin _$SignUpBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            Iterable<UserRequestValidationException> exceptions)
        error,
    required TResult Function(UserRequest userRequest) valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<UserRequestValidationException> exceptions)?
        error,
    TResult Function(UserRequest userRequest)? valid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
    required TResult Function(Valid value) valid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    TResult Function(Valid value)? valid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpBlocStateCopyWith<$Res> {
  factory $SignUpBlocStateCopyWith(
          SignUpBlocState value, $Res Function(SignUpBlocState) then) =
      _$SignUpBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpBlocStateCopyWithImpl<$Res>
    implements $SignUpBlocStateCopyWith<$Res> {
  _$SignUpBlocStateCopyWithImpl(this._value, this._then);

  final SignUpBlocState _value;
  // ignore: unused_field
  final $Res Function(SignUpBlocState) _then;
}

/// @nodoc
abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> extends _$SignUpBlocStateCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

/// @nodoc
class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'SignUpBlocState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            Iterable<UserRequestValidationException> exceptions)
        error,
    required TResult Function(UserRequest userRequest) valid,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<UserRequestValidationException> exceptions)?
        error,
    TResult Function(UserRequest userRequest)? valid,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
    required TResult Function(Valid value) valid,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    TResult Function(Valid value)? valid,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements SignUpBlocState {
  const factory Empty() = _$Empty;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Iterable<UserRequestValidationException> exceptions});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$SignUpBlocStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? exceptions = freezed,
  }) {
    return _then(Error(
      exceptions == freezed
          ? _value.exceptions
          : exceptions // ignore: cast_nullable_to_non_nullable
              as Iterable<UserRequestValidationException>,
    ));
  }
}

/// @nodoc
class _$Error implements Error {
  const _$Error(this.exceptions);

  @override
  final Iterable<UserRequestValidationException> exceptions;

  @override
  String toString() {
    return 'SignUpBlocState.error(exceptions: $exceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.exceptions, exceptions) ||
                const DeepCollectionEquality()
                    .equals(other.exceptions, exceptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exceptions);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            Iterable<UserRequestValidationException> exceptions)
        error,
    required TResult Function(UserRequest userRequest) valid,
  }) {
    return error(exceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<UserRequestValidationException> exceptions)?
        error,
    TResult Function(UserRequest userRequest)? valid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
    required TResult Function(Valid value) valid,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    TResult Function(Valid value)? valid,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SignUpBlocState {
  const factory Error(Iterable<UserRequestValidationException> exceptions) =
      _$Error;

  Iterable<UserRequestValidationException> get exceptions =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidCopyWith<$Res> {
  factory $ValidCopyWith(Valid value, $Res Function(Valid) then) =
      _$ValidCopyWithImpl<$Res>;
  $Res call({UserRequest userRequest});
}

/// @nodoc
class _$ValidCopyWithImpl<$Res> extends _$SignUpBlocStateCopyWithImpl<$Res>
    implements $ValidCopyWith<$Res> {
  _$ValidCopyWithImpl(Valid _value, $Res Function(Valid) _then)
      : super(_value, (v) => _then(v as Valid));

  @override
  Valid get _value => super._value as Valid;

  @override
  $Res call({
    Object? userRequest = freezed,
  }) {
    return _then(Valid(
      userRequest == freezed
          ? _value.userRequest
          : userRequest // ignore: cast_nullable_to_non_nullable
              as UserRequest,
    ));
  }
}

/// @nodoc
class _$Valid implements Valid {
  const _$Valid(this.userRequest);

  @override
  final UserRequest userRequest;

  @override
  String toString() {
    return 'SignUpBlocState.valid(userRequest: $userRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Valid &&
            (identical(other.userRequest, userRequest) ||
                const DeepCollectionEquality()
                    .equals(other.userRequest, userRequest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userRequest);

  @JsonKey(ignore: true)
  @override
  $ValidCopyWith<Valid> get copyWith =>
      _$ValidCopyWithImpl<Valid>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            Iterable<UserRequestValidationException> exceptions)
        error,
    required TResult Function(UserRequest userRequest) valid,
  }) {
    return valid(userRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<UserRequestValidationException> exceptions)?
        error,
    TResult Function(UserRequest userRequest)? valid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(userRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Empty value) empty,
    required TResult Function(Error value) error,
    required TResult Function(Valid value) valid,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Empty value)? empty,
    TResult Function(Error value)? error,
    TResult Function(Valid value)? valid,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class Valid implements SignUpBlocState {
  const factory Valid(UserRequest userRequest) = _$Valid;

  UserRequest get userRequest => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidCopyWith<Valid> get copyWith => throw _privateConstructorUsedError;
}
