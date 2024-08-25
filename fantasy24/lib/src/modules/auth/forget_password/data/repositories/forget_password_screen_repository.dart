import 'package:next_match/src/modules/auth/forget_password/data/data_source/forget_password_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/login/data/model/login_model.dart';

abstract class ForgetPasswordScreenRepositoryInterface {
  Future<LoginModel?> forgetPasswordSendEmail({required String email});
}

class ForgetPasswordScreenRepository
    extends ForgetPasswordScreenRepositoryInterface {
  final ForgetPasswordScreenRemoteDataSource _forgetPasswordRemoteDataSource;

  ForgetPasswordScreenRepository({
    required ForgetPasswordScreenRemoteDataSource
        forgetPasswordScreenRemoteDataSource,
  }) : _forgetPasswordRemoteDataSource = forgetPasswordScreenRemoteDataSource;

  @override
  Future<LoginModel?> forgetPasswordSendEmail({required String email}) {
    return _forgetPasswordRemoteDataSource.forgetPasswordSendEmail(
        email: email);
  }
}
