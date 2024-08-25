import 'package:next_match/src/modules/predicted_points/data/data_source/prediction_point_screen_remote_data_source.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

abstract class PointPredictionScreenRepositoryInterface {
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber = 1,
      int? pageSize = 10,
      String? sort = 'id',
      String? sortOrder = 'ASC'});
}

class PointPredictionScreenRepository
    extends PointPredictionScreenRepositoryInterface {
  final PointPredictionScreenRemoteDataSource
      _pointPredictionScreenRemoteDataSource;

  PointPredictionScreenRepository({
    required PointPredictionScreenRemoteDataSource
        pointPredictionScreenRemoteDataSource,
  }) : _pointPredictionScreenRemoteDataSource =
            pointPredictionScreenRemoteDataSource;

  @override
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber = 1,
      int? pageSize = 10,
      String? sort = 'id',
      String? sortOrder = 'ASC'}) {
    return _pointPredictionScreenRemoteDataSource.predictionPointList(
      pageNumber: pageNumber!,
      pageSize: pageSize!,
      sort: sort!,
      sortOrder: sortOrder!,
    );
  }
}
