import 'package:flutter/foundation.dart';

/// A wrapper to return a value or a [Failure]
typedef Attempt<T> = (T?, Failure?);

/// Return a [Attempt] with value set to null and the Failure set to `Failure`
Attempt<T> failed<T>(Failure failure) => (null, failure);

/// Return a [Attempt] with value set to `value` and the Failure set to null
Attempt<T> success<T>(T value) => (value, null);

/// An universal type to represent Failures. the [code] property can be used
///
/// to pass language agnostic Failure codes that can be then used
///
///  to map Failure messages on the presentation side
@immutable
class Failure<C extends Object> {
  const Failure({this.title, this.description, this.code});
  final String? title;
  final String? description;
  final C? code;
}

class NetworkFailure extends Failure{
   const NetworkFailure():super(title: "",description: "");
}

