import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/choose_lang/presentation/controller/cubit/cubit.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/radio_button.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangeLangCubit(),
      lazy: true,
      child: Builder(
        builder: (context) {
          final cubit = context.watch<ChangeLangCubit>();
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.appBlack,
                ),
              ),
              title: Text(
                language_screen.title.tr(),
                style: AppTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: false,
              backgroundColor: AppColors.background,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    20,
                  ),
                  topLeft: Radius.circular(
                    20,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Constatnts.height40,
                  customChoosedRadio(
                    value: 1,
                    groupValue: cubit.chooseLangVal,
                    title: 'English',
                    onChanged: (v) {
                      cubit.chooseLang(v);
                    },
                  ),
                  Constatnts.height10,
                  customChoosedRadio(
                    value: 2,
                    groupValue: cubit.chooseLangVal,
                    title: 'العربية',
                    onChanged: (v) {
                      cubit.chooseLang(v);
                    },
                  ),
                  const Spacer(),
                  customButton(
                    onTap: cubit.chooseLangVal != 0
                        ? () {
                            cubit.changeLang(context);
                            // if (cubit.chooseLangVal == 1) {
                            //   await context
                            //       .setLocale(context.supportedLocales[0]);
                            //   await di<PrefsService>().locale.put('en');
                            // } else {
                            //   await context
                            //       .setLocale(context.supportedLocales[1]);
                            //   await di<PrefsService>().locale.put('ar');
                            // }
                            // Navigator.pop(context);
                          }
                        : null,
                    title: language_screen.change_language.tr(),
                    titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.all(14.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
