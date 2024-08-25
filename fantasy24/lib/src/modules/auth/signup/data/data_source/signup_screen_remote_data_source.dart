import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';

abstract class SignupScreenRemoteDataSourceInterface {
  Future<SignupModel?> signup(
      {required String email, required String password});
}

class SignupScreenRemoteDataSource
    extends SignupScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  SignupScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<SignupModel?> signup(
      {required String email, required String password}) async {
    try {
      final res = await _networkService
          .postData(url: 'auth/signup', token: false, data: {
        "email": email,
        "password": password,
        "role": "user",
      });
      return SignupModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
