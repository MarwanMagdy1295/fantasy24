import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/account_screen/data/data_source/account_screen_remote_data_source.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/data_source/ai_teams_screen_remote_data_source.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/player_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';

abstract class MyTeamScreenRemoteDataSourceInterface {
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  });

  Future<UserModel?> getUserData();

  Future<PlayerModel?> playerInfo({String? playerId});
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

  @override
  Future<PlayerModel?> playerInfo({
    String? playerId,
  }) async {
    try {
      final res = await AITeamsScreenRemoteDataSource(networkService: di())
          .playerInfo(playerId: playerId);
      return res;
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
