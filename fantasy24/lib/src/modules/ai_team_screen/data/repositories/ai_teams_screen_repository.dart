import 'package:next_match/src/modules/ai_team_screen/data/data_source/ai_teams_screen_remote_data_source.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';

abstract class AITeamsScreenRepositoryInterface {
  Future<AiTeamsModel?> aiTeamsFormation({String? eventId});
}

class AITeamsScreenRepository extends AITeamsScreenRepositoryInterface {
  final AITeamsScreenRemoteDataSource _aiTeamsScreenRemoteDataSource;

  AITeamsScreenRepository({
    required AITeamsScreenRemoteDataSource aiTeamsScreenRemoteDataSource,
  }) : _aiTeamsScreenRemoteDataSource = aiTeamsScreenRemoteDataSource;

  @override
  Future<AiTeamsModel?> aiTeamsFormation({String? eventId}) {
    return _aiTeamsScreenRemoteDataSource.aiTeamsFormation(eventId: eventId);
  }
}
