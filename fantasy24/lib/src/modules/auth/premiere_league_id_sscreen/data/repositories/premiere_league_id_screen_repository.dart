import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/data_source/premiere_league_id_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/model/fbl_id_model.dart';

abstract class VerifyScreenRepositoryInterface {
  Future<FblIdModel?> postFblId({required String id});
}

class PremiereLeagueIdScreenRepository extends VerifyScreenRepositoryInterface {
  final PremiereLeagueIdScreenRemoteDataSource
      _premiereLeagueIdScreenRemoteDataSource;

  PremiereLeagueIdScreenRepository({
    required PremiereLeagueIdScreenRemoteDataSource
        premiereLeagueIdScreenRemoteDataSource,
  }) : _premiereLeagueIdScreenRemoteDataSource =
            premiereLeagueIdScreenRemoteDataSource;

  @override
  Future<FblIdModel?> postFblId({required String id}) {
    return _premiereLeagueIdScreenRemoteDataSource.postFblId(id: id);
  }
}
