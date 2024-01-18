import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repositiry.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  const GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>?> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
