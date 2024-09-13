import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/auth/forget_password/data/model/forget_password_model.dart';

abstract class ForgetPasswordScreenRemoteDataSourceInterface {
  Future<ForgetPasswordModel?> forgetPasswordSendEmail({required String email});
}

class ForgetPasswordScreenRemoteDataSource
    extends ForgetPasswordScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  ForgetPasswordScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<ForgetPasswordModel?> forgetPasswordSendEmail(
      {required String email}) async {
    try {
      final res = await _networkService.postData(
          url: 'users/password/sendemail',
          token: false,
          data: {"email": email});
      return ForgetPasswordModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
