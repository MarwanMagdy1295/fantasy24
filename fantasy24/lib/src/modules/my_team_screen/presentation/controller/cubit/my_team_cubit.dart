// ignore_for_file: unused_field

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/player_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';
import 'package:next_match/src/modules/my_team_screen/data/repositories/my_teams_screen_repository.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/controller/cubit/my_team_state.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';
import 'package:next_match/widget/custom_toast.dart';

class MyTeamCubit extends BaseCubit<MyTeamState>
    with
        AdaptiveCubit<MyTeamState>,
        ResetLazySingleton<MyTeamCubit, MyTeamState> {
  final MyTeamScreenRepository _myTeamScreenRepository;
  MyTeamCubit({required MyTeamScreenRepository myTeamScreenRepository})
      : _myTeamScreenRepository = myTeamScreenRepository,
        super(MyTeamInitial());

  MyTeamModel? myTeamModel;
  List<Pick>? playersList;
  List<Pick>? defenderPlayers = [];
  List<Pick>? midfielderPlayers = [];
  List<Pick>? strikerPlayers = [];
  List<Pick>? substitutionPlayers = [];
  Pick? goolKeeperPlayer;
  bool isLoading = false;
  bool isLoadingInfo = false;
  Player? playerInfo;

  void formation() {
    playersList = myTeamModel?.data?[0].picks?.sublist(0, 11);
    defenderPlayers?.clear();
    midfielderPlayers?.clear();
    strikerPlayers?.clear();
    substitutionPlayers?.clear();
    myTeamModel?.data?[0].picks?.forEach((element) {
      if (element.position == 12 ||
          element.position == 13 ||
          element.position == 14 ||
          element.position == 15) {
        substitutionPlayers?.add(element);
      }
    });
    playersList?.forEach((element) {
      if (element.player?.playerTypeId == 1) {
        goolKeeperPlayer = element;
      } else if (element.player?.playerTypeId == 2) {
        defenderPlayers?.add(element);
      } else if (element.player?.playerTypeId == 3) {
        midfielderPlayers?.add(element);
      } else if (element.player?.playerTypeId == 4) {
        strikerPlayers?.add(element);
      }
    });
  }
  // Future<void> getFormationData() async {
  //   MyTeamModel? res;
  //   isLoading = true;
  //   emit(MyTeamLoading());
  //   await _myTeamScreenRepository
  //       .myTeamFormation(
  //     teamId: teamId,
  //     fplEmail: fplEmail,
  //     fplPassword: fplPassword,
  //   )
  //       .then((value) {
  //     res = value;
  //     pickListData = res?.data;
  //     isLoading = false;
  //     isfailed = false;
  //     emit(MyTeamLoading());
  //   }).catchError((onError) {
  //     isLoading = false;
  //     isfailed = true;
  //     emit(MyTeamLoading());
  //     log('login error=>  $onError');
  //   });
  // }

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
    emit(MyTeamLoading());
    PlayerModel? res;
    await _myTeamScreenRepository.playerInfo(playerId: playerId).then((value) {
      res = value;
      playerInfo = res?.player;
      isLoadingInfo = false;
      emit(MyTeamLoading());
    }).catchError((onError) {
      isLoadingInfo = false;
      emit(MyTeamLoading());
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
