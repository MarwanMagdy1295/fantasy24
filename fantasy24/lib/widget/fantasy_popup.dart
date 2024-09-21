import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/ui/premiere_league_id_screen.dart';
import 'package:next_match/widget/custom_button.dart';

Future<void> fantasyPopup(
    {required BuildContext context, required String massege}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r)),
          content: SizedBox(
            height: MediaQuery.sizeOf(context).height * .34.h,
            width: MediaQuery.sizeOf(context).width * .9.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.primary,
                  size: 80.0,
                ),
                Constatnts.height20,
                Text(
                  massege,
                  textAlign: TextAlign.center,
                  style: AppTheme.textTheme.displayMedium
                      ?.copyWith(fontSize: 20.0.sp),
                ),
                Constatnts.height40,
                customButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiereLeagueIdScreen(),
                        ));
                  },
                  title: 'Verify',
                  titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.0.sp,
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
                Constatnts.height20,
              ],
            ),
          ),
        ),
      );
    },
  );
}
