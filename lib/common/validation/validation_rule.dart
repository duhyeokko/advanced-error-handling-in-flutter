import 'package:dartz/dartz.dart';

abstract class ValidationRule<E extends Exception, T> {
  Either<E, T> validate(T target);
}
