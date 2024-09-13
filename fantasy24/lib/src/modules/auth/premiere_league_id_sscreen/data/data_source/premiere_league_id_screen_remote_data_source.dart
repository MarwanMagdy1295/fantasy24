import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';

abstract class PremiereLeagueIdScreenRemoteDataSourceInterface {
  Future<MyTeamModel?> postFblId({
    required String email,
    required String password,
    required String id,
  });
}

class PremiereLeagueIdScreenRemoteDataSource
    extends PremiereLeagueIdScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  PremiereLeagueIdScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<MyTeamModel?> postFblId({
    required String email,
    required String password,
    required String id,
  }) async {
    try {
      final res =
          await _networkService.postData(url: 'fpl/myteam', token: true, data: {
        "fpl_team_id": int.parse(id),
        "fpl_email": email,
        "fpl_password": password,
      });
      return MyTeamModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
