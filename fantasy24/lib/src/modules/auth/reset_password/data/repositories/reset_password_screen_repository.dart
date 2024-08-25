import 'package:next_match/src/modules/auth/reset_password/data/data_source/reset_password_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';

abstract class ResetPasswordScreenRepositoryInterface {
  Future<SignupModel?> resetPassword(
      {required String email, required String password});
}

class ResetPasswordScreenRepository
    extends ResetPasswordScreenRepositoryInterface {
  final ResetPasswordScreenRemoteDataSource _resetPasswordRemoteDataSource;

  ResetPasswordScreenRepository({
    required ResetPasswordScreenRemoteDataSource resetPasswordRemoteDataSource,
  }) : _resetPasswordRemoteDataSource = resetPasswordRemoteDataSource;

  @override
  Future<SignupModel?> resetPassword(
      {required String email, required String password}) {
    return _resetPasswordRemoteDataSource.resetPassword(
        email: email, password: password);
  }
}
