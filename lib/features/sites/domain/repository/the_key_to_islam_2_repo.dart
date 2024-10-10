import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/models/the_key_to_islam_2_model.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/the_key_to_islam_2_model.dart';

abstract class TheKeyToIslam2Repo {
  Future<Either<Failure, List<TheKeyToIslam2>>> getArtical();
}
