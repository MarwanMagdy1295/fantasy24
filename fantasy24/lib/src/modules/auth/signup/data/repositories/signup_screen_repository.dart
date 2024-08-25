import 'package:next_match/src/modules/auth/signup/data/data_source/signup_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';

abstract class SignupScreenRepositoryInterface {
  Future<SignupModel?> signup(
      {required String email, required String password});
}

class SignupScreenRepository extends SignupScreenRepositoryInterface {
  final SignupScreenRemoteDataSource _signupRemoteDataSource;

  SignupScreenRepository({
    required SignupScreenRemoteDataSource signupRepository,
  }) : _signupRemoteDataSource = signupRepository;

  @override
  Future<SignupModel?> signup(
      {required String email, required String password}) {
    return _signupRemoteDataSource.signup(email: email, password: password);
  }
}
