import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/account_screen/data/data_source/account_screen_remote_data_source.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';

abstract class MyTeamScreenRemoteDataSourceInterface {
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  });

  Future<UserModel?> getUserData();
}

class MyTeamScreenRemoteDataSource
    extends MyTeamScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  MyTeamScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  }) async {
    try {
      final res = await _networkService.getData(
        url: 'squads/ai',
        token: true,
        query: {
          'fpl_team_id': teamId,
          'fpl_email': fplEmail,
          'fpl_password': fplPassword,
        },
      );
      return MyTeamModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }

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
