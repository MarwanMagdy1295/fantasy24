import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/player_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/repositories/ai_teams_screen_repository.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/controller/cubit/ai_teams_state.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';
import 'package:next_match/widget/custom_toast.dart';

class AiTeamsCubit extends BaseCubit<AiTeamsState>
    with
        AdaptiveCubit<AiTeamsState>,
        ResetLazySingleton<AiTeamsCubit, AiTeamsState> {
  final AITeamsScreenRepository _aiTeamsScreenRepository;
  AiTeamsCubit({required AITeamsScreenRepository aiTeamsScreenRepository})
      : _aiTeamsScreenRepository = aiTeamsScreenRepository,
        super(AiTeamsInitial());

  bool isLoading = false;
  bool isLoadingInfo = false;
  bool isfailed = false;
  List<PlayerData>? playersListData = [];
  List<PlayerData>? defenderPlayers = [];
  List<PlayerData>? midfielderPlayers = [];
  List<PlayerData>? strikerPlayers = [];
  List<PlayerData>? subPlayers = [];
  PlayerData? goolKeeperPlayer;
  String? eventId = '';
  AiTeamsModel? res;
  Player? playerInfo;

  Future<void> getFormationData() async {
    isLoading = true;
    defenderPlayers?.clear();
    midfielderPlayers?.clear();
    strikerPlayers?.clear();
    subPlayers?.clear();
    emit(AiTeamsLoading());
    await _aiTeamsScreenRepository
        .aiTeamsFormation(eventId: eventId)
        .then((value) {
      res = value;
      playersListData = res?.playersListData;
      playersListData?.forEach((e) {
        if (e.player?.playerTypeId == 1 && e.isSubs == false) {
          goolKeeperPlayer = e;
        } else if (e.player?.playerTypeId == 2 && e.isSubs == false) {
          defenderPlayers?.add(e);
        } else if (e.player?.playerTypeId == 3 && e.isSubs == false) {
          midfielderPlayers?.add(e);
        } else if (e.player?.playerTypeId == 4 && e.isSubs == false) {
          strikerPlayers?.add(e);
        } else {
          subPlayers?.add(e);
        }
      });
      isLoading = false;
      emit(AiTeamsLoading());
    }).catchError((onError) {
      isLoading = false;
      isfailed = true;
      emit(AiTeamsLoading());
      log('login error=>  $onError');
      if (onError is SingleMessageResponseErrorModel) {
        customToast(onError.message ?? '');
      }
    });
  }

  String getVsTeam(Player player, PlayerPrediction playerPrediction) {
    String teamName = '';
    playerPrediction.event?.fixtures?.forEach((element) {
      if (element.homeTeamId == player.teamId) {
        teamName = element.awayTeam!.shortName!;
      } else {
        teamName = element.homeTeam!.shortName!;
      }
    });
    return teamName;
  }

  Future<void> getPlayerInfo({String? playerId}) async {
    isLoadingInfo = true;
    emit(AiTeamsLoading());
    PlayerModel? res;
    await _aiTeamsScreenRepository.playerInfo(playerId: playerId).then((value) {
      res = value;
      playerInfo = res?.player;
      isLoadingInfo = false;
      emit(AiTeamsLoading());
    }).catchError((onError) {
      isLoadingInfo = false;
      emit(AiTeamsLoading());
      log('login error=>  $onError');
      if (onError is SingleMessageResponseErrorModel) {
        customToast(onError.message ?? '');
      }
    });
  }

  Color difColor(PlayerPrediction prediction) {
    Color difColor = AppColors.secondryLighter;

    switch (prediction.event?.fixtures?[0].homeTeam?.id == playerInfo?.teamId
        ? prediction.event?.fixtures![0].awayTeamDifficulty
        : prediction.event?.fixtures?[0].homeTeamDifficulty) {
      case 1:
        difColor = AppColors.secondryLighter;
      case 2:
        difColor = AppColors.secondry200;
      case 3:
        difColor = AppColors.warning50;
      case 4:
        difColor = AppColors.warning100;
      case 5:
        difColor = AppColors.warning200;
        break;
      default:
        difColor = AppColors.secondryLighter;
    }
    return difColor;
  }
}
