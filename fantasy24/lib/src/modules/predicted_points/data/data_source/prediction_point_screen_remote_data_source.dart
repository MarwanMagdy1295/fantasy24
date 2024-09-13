import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

abstract class PointPredictionScreenRemoteDataSourceInterface {
  Future<PointPredictionModel?> predictionPointList({
    int? pageNumber,
    int? pageSize,
    String? sort,
    String? sortOrder,
    String? playerTypeId,
    double? priceMin,
    double? priceMax,
    double? gameweekStart,
    double? gameweekEnd,
  });
}

class PointPredictionScreenRemoteDataSource
    extends PointPredictionScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  PointPredictionScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

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
  }) async {
    String url = '';
    if (playerTypeId == null) {
      url = 'players';
    } else {
      url = 'players/filters';
    }
    try {
      final res = await _networkService.getData(
        url: url,
        token: true,
        query: {
          'pageNumber': pageNumber,
          'pageSize': pageSize,
          'sort': sort,
          'sortOrder': sortOrder,
          'playerTypeId': playerTypeId,
          'gameweekStart': gameweekStart,
          'gameweekEnd': gameweekEnd,
          'priceMin': priceMin,
          'priceMax': priceMax,
        },
      );
      return PointPredictionModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
