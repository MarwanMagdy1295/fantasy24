import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/model/verify_model.dart';

abstract class VerifyScreenRemoteDataSourceInterface {
  Future<VerifyModel?> verify({
    required String code,
  });
}

class VerifyScreenRemoteDataSource
    extends VerifyScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  VerifyScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<VerifyModel?> verify({required String code}) async {
    try {
      final res = await _networkService.getData(
        url: 'auth/Verify?code=$code',
        token: false,
      );
      return VerifyModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
