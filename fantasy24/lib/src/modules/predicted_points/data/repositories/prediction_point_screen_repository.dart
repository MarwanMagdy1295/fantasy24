import 'package:next_match/src/modules/predicted_points/data/data_source/prediction_point_screen_remote_data_source.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

abstract class PointPredictionScreenRepositoryInterface {
  Future<PointPredictionModel?> predictionPointList({
    int? pageNumber = 1,
    int? pageSize = 10,
    String? sort = 'id',
    String? sortOrder = 'ASC',
    String? playerTypeId,
    double? priceMin,
    double? priceMax,
    double? gameweekStart,
    double? gameweekEnd,
  });
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
  Future<PointPredictionModel?> predictionPointList({
    int? pageNumber = 1,
    int? pageSize = 10,
    String? sort,
    String? sortOrder,
    String? playerTypeId,
    double? priceMin,
    double? priceMax,
    double? gameweekStart,
    double? gameweekEnd,
  }) {
    return _pointPredictionScreenRemoteDataSource.predictionPointList(
      pageNumber: pageNumber,
      pageSize: pageSize,
      sort: sort,
      sortOrder: sortOrder,
      playerTypeId: playerTypeId,
      priceMax: priceMax,
      priceMin: priceMin,
      gameweekStart: gameweekStart,
      gameweekEnd: gameweekEnd,
    );
  }
}
