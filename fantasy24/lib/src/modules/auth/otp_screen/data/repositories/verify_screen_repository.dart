import 'package:next_match/src/modules/auth/otp_screen/data/data_source/verify_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/model/verify_model.dart';

abstract class VerifyScreenRepositoryInterface {
  Future<VerifyModel?> verify({required String code});
}

class VerifyScreenRepository extends VerifyScreenRepositoryInterface {
  final VerifyScreenRemoteDataSource _verifyRemoteDataSource;

  VerifyScreenRepository({
    required VerifyScreenRemoteDataSource verifyScreenRemoteDataSource,
  }) : _verifyRemoteDataSource = verifyScreenRemoteDataSource;

  @override
  Future<VerifyModel?> verify({required String code}) {
    return _verifyRemoteDataSource.verify(code: code);
  }
}
