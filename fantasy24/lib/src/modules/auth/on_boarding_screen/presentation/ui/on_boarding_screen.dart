import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:next_match/src/modules/auth/signup/presentation/ui/signup_screen.dart';
import 'package:next_match/widget/custom_button.dart';
import 'dart:ui' as ui;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isArabic = di<PrefsService>().locale.get() == 'en' ? false : true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            child: Assets.images.ball.svg(),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: Assets.images.magicWand.svg(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80.h, bottom: 80.h),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Assets.images.clippingContent.image(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                      ),
                    ),
                  ),
                  Text(
                    on_boarding_screens.on_boarding_screens_title.tr(),
                    style: AppTheme.textTheme.displayLarge?.copyWith(
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Constatnts.height10,
                  Text(
                    on_boarding_screens.on_boarding_screens_sub_title.tr(),
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.headlineMedium?.copyWith(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  Constatnts.height20,
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'English',
                          textAlign: TextAlign.center,
                          style: AppTheme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 40.h,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: CupertinoSwitch(
                              value: isArabic,
                              onChanged: (value) async {
                                setState(() {
                                  isArabic = value;
                                });
                                if (value) {
                                  await context.setLocale(const Locale('ar'));
                                  di<PrefsService>().locale.put('ar');
                                } else {
                                  await context.setLocale(const Locale('en'));
                                  di<PrefsService>().locale.put('en');
                                }
                              },
                              activeColor: AppColors.white,
                              thumbColor: AppColors.primary,
                              trackColor: AppColors.white,
                              // activeTrackColor: AppColors.white,
                              // inactiveTrackColor: AppColors.white,
                              // inactiveThumbColor: AppColors.primary,
                              // thumbColor:
                              //     MaterialStateProperty.all(AppColors.primary),
                              // trackOutlineColor:
                              //     MaterialStateProperty.all(AppColors.primary),
                              // materialTapTargetSize:
                              //     MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        Text(
                          'العربية',
                          textAlign: TextAlign.center,
                          style: AppTheme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Constatnts.height20,
                  Text(
                    on_boarding_screens.change_langyage.tr(),
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  Constatnts.height60,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: customButton(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                            (_) => false);
                      },
                      title: on_boarding_screens.create_a_free_account.tr(),
                      titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      boxShadow: [
                        const BoxShadow(
                          color: AppColors.black,
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      backgroundColor: AppColors.white,
                      padding: const EdgeInsets.all(14.0),
                    ),
                  ),
                  Constatnts.height16,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: customButton(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (_) => false);
                      },
                      title: on_boarding_screens.signin.tr(),
                      titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                        side: const BorderSide(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(14.0),
                    ),
                  ),
                  Constatnts.height24,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
