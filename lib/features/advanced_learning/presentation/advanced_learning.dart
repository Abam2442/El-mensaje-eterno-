// // ignore_for_file: camel_case_types

// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
// import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_local_data_source.dart';
// import 'package:hiwayda_oracion_islamica/features/non_muslim/data/data_sources/non_muslim_remote_data_source.dart';
// import 'package:hiwayda_oracion_islamica/features/non_muslim/data/repository/non_muslim_repo_impl.dart';
// import 'package:hiwayda_oracion_islamica/features/non_muslim/domain/repository/non_muslim_repo.dart';
// import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';

// class Advanced_LearningBindings extends Bindings {
//   @override
//   dependencies() async {
//     Get.put<NonMuslimRemoteDataSource>(
//       NonMuslimRemoteDataSourceImpl(apiService: Get.find()),
//     );
//     Get.put<NonMuslimLocalDataSource>(
//       NonMuslimLocalDataSourceImpl(
//         sharedPreferencesService: Get.find(),
//         archiveService: Get.find(),
//       ),
//     );
//     Get.put<NonMuslimRepo>(
//       NonMuslimRepoImpl(
//         nonMuslimLocalDataSource: Get.find(),
//         nonMuslimRemoteDataSource: Get.find(),
//       ),
//     );

//     Get.put(NonMuslimController());

//     Get.put(Advanced_LearningController());
//   }
// }
