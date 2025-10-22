import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/core/core.dart';
import 'package:neutri_lens/app/modules/auth/data/models/profile_model/profile_model.dart';
import 'package:neutri_lens/app/modules/auth/domain/repository/user_repository.dart';
import '../../../../core/data/local_data/secure_storage/storage.dart';
import '../models/get_goals_diet_list/get_goals_diet_list.dart';
import '../models/user_model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final _dio = DioHelper();
  @override
  Future<Either<AppException, GetGoalsDietList>> getGoalsDietList() async {
    try {
      final response = await _dio.getApi(url: ApiKeys.getGoalsAndDietUrl);
      return Right(GetGoalsDietList.fromJson(response));
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }

  @override
  Future<Either<AppException, String>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _dio.postApi(
        url: ApiKeys.loginUserUrl,
        requestBody: {"username": username, "password": password},
      );
      return Right(response['result']['access_token']);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, bool>> signup(UserModel registerUserModel) async {
    try {
      await _dio.postApi(
        url: ApiKeys.registerUserUrl,
        requestBody: registerUserModel.toJson(),
      );
      return Right(true);
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, UserModel>> getUser() async {
    try {
      final response = await _dio.getApi(
        url: ApiKeys.getUserUrl,
        isAuthRequired: true,
        authToken: await storage.readValues(StorageKeys.token),
      );
      return Right(UserModel.fromJson(response));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<AppException, UserModel>> updateUser(
    ProfileModel profileModel,
  ) async {
    try {
      final response = await _dio.putApi(
        url: ApiKeys.getUserUrl,
        isAuthRequired: true,
        authToken: await storage.readValues(StorageKeys.token),
        requestBody: profileModel.toJson(),
      );
      return Right(UserModel.fromJson(response['profile']));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
}
