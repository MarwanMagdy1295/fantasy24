import 'package:next_match/src/modules/auth/forget_password/data/data_source/forget_password_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/forget_password/data/model/forget_password_model.dart';

abstract class ForgetPasswordScreenRepositoryInterface {
  Future<ForgetPasswordModel?> forgetPasswordSendEmail({required String email});
}

class ForgetPasswordScreenRepository
    extends ForgetPasswordScreenRepositoryInterface {
  final ForgetPasswordScreenRemoteDataSource _forgetPasswordRemoteDataSource;

  ForgetPasswordScreenRepository({
    required ForgetPasswordScreenRemoteDataSource
        forgetPasswordScreenRemoteDataSource,
  }) : _forgetPasswordRemoteDataSource = forgetPasswordScreenRemoteDataSource;

  @override
  Future<ForgetPasswordModel?> forgetPasswordSendEmail(
      {required String email}) {
    return _forgetPasswordRemoteDataSource.forgetPasswordSendEmail(
        email: email);
  }
}
