import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';

abstract class AccountScreenRemoteDataSourceInterface {
  Future<UserModel?> getUserData();
}

class AccountScreenRemoteDataSource
    extends AccountScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  AccountScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<UserModel?> getUserData() async {
    try {
      final res = await _networkService.getData(
        url: 'users/me',
        token: true,
      );
      return UserModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
