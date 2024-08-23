import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/islam_guide_1_model.dart';

abstract class IslamGuide1Repository {
  Future<Either<Failure, List<IslamGuide1>>> getArtical();
}
