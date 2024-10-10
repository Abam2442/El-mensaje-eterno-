import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/the_key_to_islam_model.dart';

abstract class TheKeyToIslamRepo {
  Future<Either<Failure, List<TheKeyToIslamfirst>>> getArtical();
}
