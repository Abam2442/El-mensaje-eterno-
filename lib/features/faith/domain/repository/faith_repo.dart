import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/core/errors/failures.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';

abstract class FaithRepo {
  Future<Either<Failure, FaithModel>> getOfflineData();
  Future<Either<Failure, FaithModel>> getOnlineData();
}
