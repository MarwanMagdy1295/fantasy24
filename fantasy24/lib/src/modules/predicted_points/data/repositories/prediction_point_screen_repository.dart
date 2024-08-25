import 'package:next_match/src/modules/predicted_points/data/data_source/prediction_point_screen_remote_data_source.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

abstract class PointPredictionScreenRepositoryInterface {
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber, int? pageSize, String? sort, String? sortOrder});
}

class PointPredictionScreenRepository
    extends PointPredictionScreenRepositoryInterface {
  final PointPredictionScreenRemoteDataSource _loginRemoteDataSource;

  PointPredictionScreenRepository({
    required PointPredictionScreenRemoteDataSource loginScreenRemoteDataSource,
  }) : _loginRemoteDataSource = loginScreenRemoteDataSource;

  @override
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber, int? pageSize, String? sort, String? sortOrder}) {
    return _loginRemoteDataSource.predictionPointList(
      pageNumber: pageNumber,
      pageSize: pageSize,
      sort: sort,
      sortOrder: sortOrder,
    );
  }
}
