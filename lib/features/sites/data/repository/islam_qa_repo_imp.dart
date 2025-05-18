import 'package:dartz/dartz.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/local_data_source/islam_qa_local_datasorce.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/islam_qa_repository.dart';
import '../models/islam_qa.dart';

class IslamQARepositoryImp extends IslamQARepository {
  final IslamqaLocalDataSource islamQALocalDataSource;
  IslamQARepositoryImp( {
    required this.islamQALocalDataSource,
  });
  @override
  Future<Either<Failure, List<Islamqa>>> getArtical() async {
    await islamQALocalDataSource.getArtical();
    try {
      var artical = await islamQALocalDataSource.getArtical();

      return Right(artical);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
