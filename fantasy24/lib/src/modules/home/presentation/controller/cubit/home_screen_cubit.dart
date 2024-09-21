import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/home/data/repositories/home_screen_repository.dart';
import 'package:next_match/src/modules/home/presentation/controller/cubit/home_screen_state.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/widget/fantasy_popup.dart';

class HomeScreenCubit extends BaseCubit<HomeScreenState>
    with
        AdaptiveCubit<HomeScreenState>,
        ResetLazySingleton<HomeScreenCubit, HomeScreenState> {
  final HomeScreenRepository _homeScreenRepository;
  HomeScreenCubit({required HomeScreenRepository homeScreenRepository})
      : _homeScreenRepository = homeScreenRepository,
        super(HomeScreenInitial());

  String screenTitle = home_screen.home_screen_title.tr();

  bool isLoadingUserInfo = false;

  Future<void> getUserData(BuildContext context) async {
    isLoadingUserInfo = true;
    UserData? user;
    emit(HomeScreenLoading());
    await _homeScreenRepository.getUserData().then((value) {
      UserModel res = value!;
      user = res.data;
      isLoadingUserInfo = false;
      emit(HomeScreenLoading());
      if (!user!.isVerified!) {
        fantasyPopup(context: context, massege: 'Please Verify Your Account');
      }
    }).catchError((onError) {
      isLoadingUserInfo = false;
      emit(HomeScreenLoading());
      log('user error=>  $onError');
    });
  }
}
