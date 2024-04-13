import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import '../../../../core/errors/failures.dart';

abstract class KnowingAllahRepository {
  Future<Either<Failure, KnowingAllahModel>> getArtical();
}
