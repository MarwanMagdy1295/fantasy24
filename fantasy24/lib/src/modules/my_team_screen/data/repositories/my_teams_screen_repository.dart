import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/data_source/my_team_screen_remote_data_source.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';

abstract class MyTeamScreenRepositoryInterface {
  Future<MyTeamModel?> myTeamFormation({
    String? teamId,
    String? fplEmail,
    String? fplPassword,
  });

  Future<UserModel?> getUserData();
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
}
