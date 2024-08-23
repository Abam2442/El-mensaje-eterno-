import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/saber_el_islam_model.dart';

abstract class SaberElIslamRepository {
  Future<Either<Failure, List<SaberElIslamModel>>> getArtical();
}
