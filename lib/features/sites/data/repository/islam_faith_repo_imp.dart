// import 'package:dartz/dartz.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/islam_faith_local_data_source.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/islam_faith_repository.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/helpers/get_failure_from_exception.dart';
// import '../../domain/entities/fixed_entities.dart';

// class IslamFaithRepositoryImp extends IslamFaithRepository {
//   final IslamFaithLocalDataSource islamFaithLocalDataSource;
//   IslamFaithRepositoryImp({
//     required this.islamFaithLocalDataSource,
//   });
//   @override
//   Future<Either<Failure, List<FixedEntities>>> getArtical() async {
//     await islamFaithLocalDataSource.getArtical();
//     try {
//       var artical = await islamFaithLocalDataSource.getArtical();

//       return Right(artical);
//     } catch (e) {
//       return Left(getFailureFromException(e));
//     }
//   }
// }
