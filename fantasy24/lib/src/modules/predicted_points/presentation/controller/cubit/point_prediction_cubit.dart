import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';
import 'package:next_match/src/modules/predicted_points/data/repositories/prediction_point_screen_repository.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_state.dart';

class PointPredictionCubit extends BaseCubit<PointPredictionState>
    with
        AdaptiveCubit<PointPredictionState>,
        ResetLazySingleton<PointPredictionCubit, PointPredictionState> {
  final PointPredictionScreenRepository _pointPredictionScreenRepository;
  PointPredictionCubit(
      {required PointPredictionScreenRepository
          pointPredictionScreenRepository})
      : _pointPredictionScreenRepository = pointPredictionScreenRepository,
        super(PointPredictionInitial());

  bool isLoading = false;
  PointPredictionModel? pointPredictionModel;
  List<PredictionPointData>? predictionPointsList = [];
  ScrollController? verticalController;

  Future<void> getPointPredictionList(
      {required int pageNumber,
      int? pageSize,
      String? sort,
      String? sortOrder}) async {
    verticalController!.addListener(() async {
      if (verticalController!.position.maxScrollExtent ==
          verticalController!.position.pixels) {
        if (pageNumber < pointPredictionModel!.totalPages!) {
          pageNumber++;
          isLoading = true;
          emit(PointPredictionLoading());
          await _pointPredictionScreenRepository
              .predictionPointList(
                  pageNumber: pageNumber,
                  pageSize: pageSize,
                  sort: sort,
                  sortOrder: sortOrder)
              .then((value) {
            pointPredictionModel = value;
            predictionPointsList
                ?.addAll(pointPredictionModel!.predictionPointList!);
            isLoading = false;
            emit(PointPredictionLoading());
          }).catchError((onError) {
            isLoading = false;
            emit(PointPredictionLoading());
            log('point prediction error=>  $onError');
          });
        }
      } else {
        isLoading = true;
        emit(PointPredictionLoading());
        await _pointPredictionScreenRepository
            .predictionPointList(
                pageNumber: pageNumber,
                pageSize: pageSize,
                sort: sort,
                sortOrder: sortOrder)
            .then((value) {
          pointPredictionModel = value;
          predictionPointsList = pointPredictionModel?.predictionPointList;
          isLoading = false;
          emit(PointPredictionLoading());
        }).catchError((onError) {
          isLoading = false;
          emit(PointPredictionLoading());
          log('point prediction error=>  $onError');
        });
      }
    });
  }
}
