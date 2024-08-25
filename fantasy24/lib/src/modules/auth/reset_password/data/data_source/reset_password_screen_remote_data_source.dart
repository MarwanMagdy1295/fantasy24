import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';

abstract class ResetPasswordScreenRemoteDataSourceInterface {
  Future<SignupModel?> resetPassword(
      {required String email, required String password});
}

class ResetPasswordScreenRemoteDataSource
    extends ResetPasswordScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  ResetPasswordScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<SignupModel?> resetPassword(
      {required String email, required String password}) async {
    try {
      final res = await _networkService
          .postData(url: 'users/password/reset', token: false, data: {
        "email": email,
        "password": password,
        "token": di<PrefsService>().user.get(),
      });
      return SignupModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
