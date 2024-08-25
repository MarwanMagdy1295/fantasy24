import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/model/fbl_id_model.dart';

abstract class PremiereLeagueIdScreenRemoteDataSourceInterface {
  Future<FblIdModel?> postFblId({
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
  Future<FblIdModel?> postFblId({required String id}) async {
    try {
      final res = await _networkService.postData(
          url: 'users/fpl/teamId', token: true, data: {"fpl_team_id": id});
      return FblIdModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
