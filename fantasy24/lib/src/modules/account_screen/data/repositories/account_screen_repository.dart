import 'package:next_match/src/modules/account_screen/data/data_source/account_screen_remote_data_source.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';

abstract class AccountScreenRepositoryInterface {
  Future<UserModel?> getUserData();
}

class AccountScreenRepository extends AccountScreenRepositoryInterface {
  final AccountScreenRemoteDataSource _accountScreenRemoteDataSource;

  AccountScreenRepository({
    required AccountScreenRemoteDataSource accountScreenRemoteDataSource,
  }) : _accountScreenRemoteDataSource = accountScreenRemoteDataSource;

  @override
  Future<UserModel?> getUserData() {
    return _accountScreenRemoteDataSource.getUserData();
  }
}
