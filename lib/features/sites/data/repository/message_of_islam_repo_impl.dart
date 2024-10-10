import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/repository/fixed_repository.dart';
import '../data_source/message_of_islam_local_data_source.dart';

class MessageOfIslamRepositoryImp extends FixedRepository {
  final MessageOfIslamLocalDataSource messageOfIslamLocalDataSource;
  MessageOfIslamRepositoryImp({
    required this.messageOfIslamLocalDataSource,
  });
  @override
  Future<Either<Failure, List<FixedEntities>>> getArtical() async {
    await messageOfIslamLocalDataSource.getArtical();
    try {
      var artical = await messageOfIslamLocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
