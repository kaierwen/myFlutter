import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repositiry.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([
  NumberTriviaRepository
], customMocks: [
  MockSpec<NumberTriviaRepository>(
    as: #MockNumberTriviaRepository,
  )
])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late int tNumber;
  late NumberTrivia tNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
    tNumber = 1;
    tNumberTrivia = NumberTrivia(number: tNumber, text: 'text');
  });
  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase.execute(number: tNumber);
      // assert
      expect(result, tNumberTrivia);
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );

  // test(
  //   'should get trivia for the number from the repository',
  //   () async {
  //     // arrange
  //     when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
  //         .thenAnswer((_) async => Right(tNumberTrivia));
  //     when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
  //         .thenAnswer((_) async => Right(tNumberTrivia));
  //     // act
  //     final result = await usecase.execute(number: tNumber);
  //     // assert
  //     expect(result, tNumberTrivia);
  //     verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
  //     verifyNoMoreInteractions(mockNumberTriviaRepository);
  //   },
  // );
}
