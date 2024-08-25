import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/model/fbl_id_model.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/repositories/premiere_league_id_screen_repository.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/controller/premiere_league_id_screen_state.dart';
import 'package:next_match/src/modules/main_screen/presentation/ui/main_screen.dart';

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

  TextEditingController fblIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> postLoginData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      FblIdModel? res;
      isLoading = true;
      emit(PremiereLeagueIdScreenLoading());
      await _premiereLeagueIdScreenRepository
          .postFblId(id: fblIdController.text)
          .then((value) {
        res = value;
        UserModel user = res!.data!;
        log('user=>  ${user.email}');
        isLoading = false;
        emit(PremiereLeagueIdScreenLoading());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }).catchError((onError) {
        isLoading = false;
        emit(PremiereLeagueIdScreenLoading());
        log('login error=>  $onError');
      });
    }
  }
}
