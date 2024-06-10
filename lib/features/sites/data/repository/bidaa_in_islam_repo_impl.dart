import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/bidaa_in_islam_local_data_source.dart';

class BidaaInIslamRepositoryImp extends FixedRepository {
  final BidaaInIslamLocalDataSource bidaaInIslamLocalDataSource;
  BidaaInIslamRepositoryImp({
    required this.bidaaInIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await bidaaInIslamLocalDataSource.getArtical();
    try {
      Get.find<Logger>().i("Start `getArtical` in |BidaaInIslamRepositoryImp|");
      var artical = await bidaaInIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
