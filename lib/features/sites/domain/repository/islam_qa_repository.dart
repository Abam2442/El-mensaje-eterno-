import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/islam_qa.dart';

abstract class IslamQARepository {
  Future<Either<Failure, List<Islamqa>>> getArtical();
}
