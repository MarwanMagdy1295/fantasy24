import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/repositories/premiere_league_id_screen_repository.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/controller/premiere_league_id_screen_state.dart';
import 'package:next_match/src/modules/main_screen/presentation/ui/main_screen.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';
import 'package:next_match/widget/custom_toast.dart';

class PremiereLeagueIdScreenCubit extends BaseCubit<PremiereLeagueIdScreenState>
    with
        AdaptiveCubit<PremiereLeagueIdScreenState>,
        ResetLazySingleton<PremiereLeagueIdScreenCubit,
            PremiereLeagueIdScreenState> {
  final PremiereLeagueIdScreenRepository _premiereLeagueIdScreenRepository;
  PremiereLeagueIdScreenCubit(
      {required PremiereLeagueIdScreenRepository
          premiereLeagueIdScreenRepository})
      : _premiereLeagueIdScreenRepository = premiereLeagueIdScreenRepository,
        super(PremiereLeagueIdScreenInitial());

  TextEditingController fplIdController = TextEditingController();
  TextEditingController fplEmailController = TextEditingController();
  TextEditingController fplPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isHide = true;

  Future<void> importFplIdData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      MyTeamModel? res;
      isLoading = true;
      emit(PremiereLeagueIdScreenLoading());
      await _premiereLeagueIdScreenRepository
          .postFblId(
        id: fplIdController.text,
        email: fplEmailController.text,
        password: fplPasswordController.text,
      )
          .then((value) {
        res = value;
        // Data myTeam = res!.data!;
        isLoading = false;
        emit(PremiereLeagueIdScreenLoading());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                myTeamModel: res,
              ),
            ),
            (route) => false);
      }).catchError((onError) {
        isLoading = false;
        emit(PremiereLeagueIdScreenLoading());
        log('PremiereLeagueId error=>  $onError');
        if (onError is SingleMessageResponseErrorModel) {
          customToast(onError.message ?? '');
        }
      });
    }
  }

  hidePassword() {
    emit(PremiereLeagueIdScreenLoading());
    isHide = !isHide;
    emit(PremiereLeagueIdScreenLoading());
  }
}
