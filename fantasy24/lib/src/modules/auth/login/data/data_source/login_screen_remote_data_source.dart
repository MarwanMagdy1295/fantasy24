import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/auth/login/data/model/login_model.dart';

abstract class LoginScreenRemoteDataSourceInterface {
  Future<LoginModel?> login({required String email, required String password});
}

class LoginScreenRemoteDataSource extends LoginScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  LoginScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      final res = await _networkService.postData(
          url: 'auth/login',
          token: false,
          data: {"email": email, "password": password});
      return LoginModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
