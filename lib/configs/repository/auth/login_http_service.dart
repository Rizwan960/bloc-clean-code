import 'package:bloc_template/configs/extention/app_urls.dart';
import 'package:bloc_template/configs/repository/auth/login_repository.dart';

import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_services.dart';
import '../../model/user/user_model.dart';

/// Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  /// Sends a login request to the authentication API with the provided [data].
  ///
  /// Returns a [UserModel] representing the user data if the login is successful.
  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response);
  }
}
