import 'package:fpdart/fpdart.dart';
import 'package:neutri_lens/app/core/data/exceptions/app_exceptions.dart';
import 'package:neutri_lens/app/modules/auth/data/models/get_goals_diet_list/get_goals_diet_list.dart';
import 'package:neutri_lens/app/modules/auth/data/models/user_model/user_model.dart';



abstract interface class AuthRepository {

  Future<Either<AppException,GetGoalsDietList>> getGoalsDietList();
  Future<Either<AppException,String>> login(String email, String password);
  Future<Either<AppException,bool>> signup(UserModel registerUserModel);
  Future<Either<AppException,UserModel>> getUser();
}