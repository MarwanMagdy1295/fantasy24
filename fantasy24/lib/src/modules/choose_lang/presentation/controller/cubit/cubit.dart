// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/modules/choose_lang/presentation/controller/cubit/states.dart';

class ChangeLangCubit extends BaseCubit<ChangeLangStates>
    with
        AdaptiveCubit<ChangeLangStates>,
        ResetLazySingleton<ChangeLangCubit, ChangeLangStates> {
  ChangeLangCubit() : super(ChooseLangInitail());

  int chooseLangVal = di<PrefsService>().locale.get() == 'en' ? 1 : 2;
  void chooseLang(val) {
    chooseLangVal = val;
    emit(ChooseLangState());
  }

  Future<void> changeLang(BuildContext context) async {
    if (chooseLangVal == 1) {
      await context.setLocale(Locale('en'));
      di<PrefsService>().locale.put('en');
    } else {
      await context.setLocale(Locale('ar'));
      di<PrefsService>().locale.put('ar');
    }
    if (context.mounted) {
      // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (context) => MainScreen()), (_) => false);
      Navigator.pop(context, true);
    }
  }
}
