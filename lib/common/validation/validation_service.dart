import 'package:dartz/dartz.dart';

import 'package:advanced_error_handling/common/validation/validation_rule.dart';

mixin ValidationService<E extends Exception, T> {
  Iterable<ValidationRule<E, T>> get rules;
  Either<Iterable<E>, T> validate(T target) {
    final results = rules.map((rule) => rule.validate(target));

    if (results.every((result) => result.isRight())) {
      return right(target);
    }

    final it = results.where((result) => result.isLeft()).iterator;
    final exceptionList = <E>[];

    while (it.moveNext()) {
      it.current.fold((l) {
        exceptionList.add(l);
      }, (r) {});
    }

    return left(exceptionList);
  }
}
