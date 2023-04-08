import 'package:flutter/foundation.dart' show immutable;

enum Status { loading, failure, success, none }

@immutable
class GenericCubitState<T> {
  T? data;
  final String? error;
  Status status;

  GenericCubitState({this.data, this.error, required this.status});

  factory GenericCubitState.none() => GenericCubitState(status: Status.none);

  factory GenericCubitState.loading() =>
      GenericCubitState(status: Status.loading);

  factory GenericCubitState.failure(String error) =>
      GenericCubitState(error: error, status: Status.failure);

  factory GenericCubitState.success(T? data) =>
      GenericCubitState(data: data, status: Status.success);
}
