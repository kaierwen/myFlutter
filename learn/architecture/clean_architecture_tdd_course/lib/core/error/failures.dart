import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // const Failure();
  // const Failure([List properties = const <dynamic>[]]);

  final List<Object> properties;

  const Failure({required this.properties});

  @override
  List<Object> get props => properties;
}

class ServerFailure extends Failure {
  ServerFailure({required super.properties});
  // final String message;
  // const ServerFailure({required this.message});
  // @override
  // List<Object> get props => [];
}
