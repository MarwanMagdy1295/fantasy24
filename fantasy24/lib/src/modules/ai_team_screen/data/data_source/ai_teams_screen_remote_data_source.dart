import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/player_model.dart';

abstract class AITeamsScreenRemoteDataSourceInterface {
  Future<AiTeamsModel?> aiTeamsFormation({String? eventId});

  Future<PlayerModel?> playerInfo({String? playerId});
}

class AITeamsScreenRemoteDataSource
    extends AITeamsScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  AITeamsScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<AiTeamsModel?> aiTeamsFormation({
    String? eventId,
  }) async {
    try {
      final res = await _networkService.getData(
        url: 'squads/ai',
        token: true,
        query: {
          'eventId': 4,
        },
      );
      return AiTeamsModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }

  @override
  Future<PlayerModel?> playerInfo({
    String? playerId,
  }) async {
    try {
      final res = await _networkService.getData(
        url: 'players/$playerId',
        token: true,
      );
      return PlayerModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
