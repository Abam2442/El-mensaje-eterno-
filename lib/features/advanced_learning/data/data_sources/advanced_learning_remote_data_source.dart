import 'package:hiwayda_oracion_islamica/features/main/data/model/pair_model.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/services/api_service.dart';

abstract class AdvancedLearningRemoteDataSource {
  // TODO This is example
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId});
}

class AdvancedLearningRemoteDataSourceImpl
    extends AdvancedLearningRemoteDataSource {
  final ApiService apiService;

  AdvancedLearningRemoteDataSourceImpl({required this.apiService});

  // TODO This is example
  @override
  Future<List<PairModel>> getCategoriesAsPair(
      {required int repositoryId}) async {
    try {
      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppApiRoutes.getCategoriesAsPair,
        parameters: {
          'repository_id': repositoryId.toString(),
        },
      );
      final List<PairModel> expenses = mapData['data']
          .map<PairModel>(
            (item) => PairModel.fromJson(item),
          )
          .toList();

      return Future.value(expenses);
    } catch (e) {
      rethrow;
    }
  }
}
