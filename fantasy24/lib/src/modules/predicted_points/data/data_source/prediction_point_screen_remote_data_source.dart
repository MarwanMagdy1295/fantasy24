import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';

abstract class PointPredictionScreenRemoteDataSourceInterface {
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber, int? pageSize, String? sort, String? sortOrder});
}

class PointPredictionScreenRemoteDataSource
    extends PointPredictionScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  PointPredictionScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<PointPredictionModel?> predictionPointList(
      {int? pageNumber = 1,
      int? pageSize = 10,
      String? sort = 'id',
      String? sortOrder = 'ASC'}) async {
    try {
      final res = await _networkService.getData(
        url:
            'players?pageNumber=$pageNumber&pageSize=$pageSize&sort=$sort&sortOrder=$sortOrder',
        token: true,
      );
      return PointPredictionModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
