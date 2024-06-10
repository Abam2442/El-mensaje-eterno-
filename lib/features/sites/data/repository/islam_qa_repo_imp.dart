import 'package:dartz/dartz.dart';
// import 'package:elresala/features/sites/data/data_source/islam_qa_local_datasorce.dart';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/get_failure_from_exception.dart';
import '../../domain/repository/islam_qa_repository.dart';
import '../data_source/islam_qa_local_datasorce.dart';
import '../models/islam_qa.dart';

class IslamQARepositoryImp extends IslamQARepository {
  final IslamqaLocalDataSource islamQALocalDataSource;
  IslamQARepositoryImp({
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
