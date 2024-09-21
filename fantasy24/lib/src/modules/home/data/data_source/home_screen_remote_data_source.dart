// ignore_for_file: unused_field

import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/account_screen/data/data_source/account_screen_remote_data_source.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';

abstract class HomeScreenRemoteDataSourceInterface {
  Future<UserModel?> getUserData();
}

class HomeScreenRemoteDataSource extends HomeScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  HomeScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<UserModel?> getUserData() async {
    try {
      final res = await AccountScreenRemoteDataSource(networkService: di())
          .getUserData();
      return res;
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
