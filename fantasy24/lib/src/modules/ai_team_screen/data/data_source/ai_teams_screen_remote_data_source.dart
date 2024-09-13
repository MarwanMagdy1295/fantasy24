import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';

abstract class AITeamsScreenRemoteDataSourceInterface {
  Future<AiTeamsModel?> aiTeamsFormation({String? eventId});
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
          'eventId': eventId,
        },
      );
      return AiTeamsModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
