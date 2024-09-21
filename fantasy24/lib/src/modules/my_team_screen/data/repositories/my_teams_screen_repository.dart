import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/player_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/data_source/my_team_screen_remote_data_source.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';

abstract class MyTeamScreenRepositoryInterface {
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  });

  Future<UserModel?> getUserData();

  Future<PlayerModel?> playerInfo({String? playerId});
}

class MyTeamScreenRepository extends MyTeamScreenRepositoryInterface {
  final MyTeamScreenRemoteDataSource _myTeamScreenRemoteDataSource;

  MyTeamScreenRepository({
    required MyTeamScreenRemoteDataSource myTeamScreenRemoteDataSource,
  }) : _myTeamScreenRemoteDataSource = myTeamScreenRemoteDataSource;

  @override
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  }) {
    return _myTeamScreenRemoteDataSource.myTeamFormation(
        teamId: teamId, fplEmail: fplEmail, fplPassword: fplPassword);
  }

  @override
  Future<UserModel?> getUserData() {
    return _myTeamScreenRemoteDataSource.getUserData();
  }

  @override
  Future<PlayerModel?> playerInfo({String? playerId}) {
    return _myTeamScreenRemoteDataSource.playerInfo(playerId: playerId);
  }
}
