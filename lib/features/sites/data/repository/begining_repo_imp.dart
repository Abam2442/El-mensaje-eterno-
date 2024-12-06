// import 'package:dartz/dartz.dart';
// import '../../../../core/errors/failures.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import '../../../../core/helpers/get_failure_from_exception.dart';
// import '../../domain/entities/fixed_entities.dart';
// import '../../domain/repository/fixed_repository.dart';

// class BeginingRepositoryImp extends FixedRepository {
//   final BeginingLocalDataSource beginingLocalDataSource;
//   BeginingRepositoryImp({
//     required this.beginingLocalDataSource,
//   });
//   @override
//   Future<Either<Failure, List<FixedEntities>>> getArtical() async {
//     await beginingLocalDataSource.getArtical();
//     try {
//       Get.find<Logger>().i("Start `getArtical` in |BeginingRepositoryImp|");
//       var artical = await beginingLocalDataSource.getArtical();
//       Get.find<Logger>()
//           .w("End `getArtical` in |BeginingRepositoryImp| ${artical.length}");
//       return Right(artical);
//     } catch (e) {
//       return Left(getFailureFromException(e));
//     }
//   }
// }
