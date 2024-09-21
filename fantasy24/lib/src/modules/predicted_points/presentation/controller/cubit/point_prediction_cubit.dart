import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';
import 'package:next_match/src/modules/predicted_points/data/repositories/prediction_point_screen_repository.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_state.dart';
import 'package:next_match/widget/custom_toast.dart';

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
  bool isScrollLoading = false;
  PointPredictionModel? pointPredictionModel;
  List<PredictionPointData>? predictionPointsList = [];
  // List<PlayerPrediction>? playerPredictionsList;
  ScrollController? verticalController;
  double? lowPice;
  double? highPric;
  double? startGameWeek;
  double? endGameWeek;
  int? playerTypeId;
  String? playerType;

  Future<void> getPointPredictionList(
      {required int pageNumber,
      int? pageSize = 10,
      int? playerTypeId,
      String? sort = 'id',
      String? sortOrder = 'ASC'}) async {
    verticalController = ScrollController();
    verticalController?.addListener(() async {
      if (verticalController!.position.maxScrollExtent ==
          verticalController!.position.pixels) {
        if (pageNumber < pointPredictionModel!.totalPages!) {
          pageNumber++;
          isScrollLoading = true;
          emit(PointPredictionLoading());
          await _pointPredictionScreenRepository
              .predictionPointList(
            pageNumber: pageNumber,
            pageSize: pageSize,
            sort: sort,
            sortOrder: sortOrder,
            playerTypeId: playerType,
            priceMax: highPric,
            priceMin: lowPice,
            gameweekStart: startGameWeek,
            gameweekEnd: endGameWeek,
          )
              .then((value) {
            pointPredictionModel = value;
            predictionPointsList
                ?.addAll(pointPredictionModel!.predictionPointList!);
            predictionPointsList?.forEach((element) {
              if (element.playerPredictions!.length > 3) {
                final data = element.playerPredictions!.reversed.toList();
                List<PlayerPrediction>? list = data.sublist(0, 3);
                element.selectedPlayerPredictions = list;
                // playerPredictionsList?.addAll(list);
              }
            });
            isScrollLoading = false;
            emit(PointPredictionLoading());
          }).catchError((onError) {
            isScrollLoading = false;
            emit(PointPredictionLoading());
            log('point prediction error=>  $onError');
            if (onError is SingleMessageResponseErrorModel) {
              customToast(onError.message ?? '');
            }
          });
        }
      }
    });
    if (pageNumber == 1) {
      isLoading = true;
      emit(PointPredictionLoading());
      await _pointPredictionScreenRepository
          .predictionPointList(
        pageNumber: pageNumber,
        pageSize: pageSize,
        sort: sort,
        sortOrder: sortOrder,
        playerTypeId: playerType,
        priceMax: highPric,
        priceMin: lowPice,
        gameweekStart: startGameWeek,
        gameweekEnd: endGameWeek,
      )
          .then((value) {
        pointPredictionModel = value;
        predictionPointsList = pointPredictionModel?.predictionPointList;
        pointPredictionModel?.predictionPointList?.forEach((element) {
          if (element.playerPredictions!.length > 3) {
            final data = element.playerPredictions!.reversed.toList();
            List<PlayerPrediction>? list = data.sublist(0, 3);
            element.selectedPlayerPredictions = list;
            // playerPredictionsList = list;
          }
        });
        isLoading = false;
        emit(PointPredictionLoading());
      }).catchError((onError) {
        isLoading = false;
        emit(PointPredictionLoading());
        log('point prediction error=>  $onError');
        if (onError is SingleMessageResponseErrorModel) {
          customToast(onError.message ?? '');
        }
      });
    }
  }

  String getVsTeam(
      PredictionPointData predictionPoint, PlayerPrediction playerPrediction) {
    String teamName = '';
    playerPrediction.event?.fixtures?.forEach((element) {
      if (element.homeTeamId == predictionPoint.teamId) {
        teamName = element.awayTeam!.shortName!;
      } else {
        teamName = element.homeTeam!.shortName!;
      }
    });
    return teamName;
  }
}
