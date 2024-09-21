import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/home/data/data_source/home_screen_remote_data_source.dart';

abstract class HomeScreenRepositoryInterface {
  Future<UserModel?> getUserData();
}

class HomeScreenRepository extends HomeScreenRepositoryInterface {
  final HomeScreenRemoteDataSource _homeScreenRemoteDataSource;

  HomeScreenRepository({
    required HomeScreenRemoteDataSource homeScreenRemoteDataSource,
  }) : _homeScreenRemoteDataSource = homeScreenRemoteDataSource;

  @override
  Future<UserModel?> getUserData() {
    return _homeScreenRemoteDataSource.getUserData();
  }
}
