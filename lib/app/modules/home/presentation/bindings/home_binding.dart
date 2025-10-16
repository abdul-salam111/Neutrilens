import 'package:get/get.dart';
import 'package:neutri_lens/app/modules/home/domain/abstract_repositories/home_repository.dart';
import 'package:neutri_lens/app/modules/home/data/repository_impl/home_repository_impl.dart';

import '../../../../core/data/network_manager/dio_helper.dart';
import '../../data/datasources/remote_datasource/home_remote_data_source_impl.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioHelper());

    Get.lazyPut(() => HomeRemoteDataSourceImpl(Get.find<DioHelper>()));

    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(Get.find<HomeRemoteDataSourceImpl>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(homeRepository: Get.find()),
    );
  }
}
