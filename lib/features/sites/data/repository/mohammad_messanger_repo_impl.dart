// import 'package:dartz/dartz.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/helpers/get_failure_from_exception.dart';
// import '../../domain/entities/fixed_entities.dart';
// import '../../domain/repository/fixed_repository.dart';
// import '../data_source/mohammad_messanger_local_data_source.dart';

// class MohammadMessangerRepositoryImp extends FixedRepository {
//   final MohammadMessangerLocalDataSource messangerLocalDataSource;
//   MohammadMessangerRepositoryImp({
//     required this.messangerLocalDataSource,
//   });
//   @override
//   Future<Either<Failure, List<FixedEntities>>> getArtical() async {
//     await messangerLocalDataSource.getArtical();
//     try {
//       var artical = await messangerLocalDataSource.getArtical();

//       return Right(artical);
//     } catch (e) {
//       return Left(getFailureFromException(e));
//     }
//   }
// }
