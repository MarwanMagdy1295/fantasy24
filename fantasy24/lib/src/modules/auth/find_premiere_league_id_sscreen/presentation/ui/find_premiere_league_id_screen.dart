import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class FindPremiereLeagueIdScreen extends StatelessWidget {
  const FindPremiereLeagueIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          color: AppColors.background,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constatnts.height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    Constatnts.width16,
                    Text(
                      find_premiere_league_id_screen.your_premiere_league_iD
                          .tr(),
                      style: AppTheme.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Constatnts.height52,
                Wrap(
                  children: [
                    Text(
                      find_premiere_league_id_screen.unlock_ai_features.tr(),
                      style: AppTheme.textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Constatnts.height40,
                GestureDetector(
                  onTap: () async {
                    try {
                      await launchUrl(
                          Uri.parse('https://fantasy.premierleague.com'));
                    } catch (e) {}
                  },
                  child: Text.rich(
                    TextSpan(
                      text:
                          '1. ${find_premiere_league_id_screen.step_one.tr()}',
                      style: AppTheme.textTheme.titleLarge!.copyWith(),
                      children: [
                        TextSpan(
                          text: find_premiere_league_id_screen.step_one2.tr(),
                          style: AppTheme.textTheme.titleLarge!.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text(
                //   '1. ${find_premiere_league_id_screen.step_one.tr()}',
                //   style: AppTheme.textTheme.titleLarge!.copyWith(),
                // ),
                // GestureDetector(
                //   onTap: () async {
                //     try {
                //       await launchUrl(
                //           Uri.parse('https://fantasy.premierleague.com'));
                //     } catch (e) {}
                //   },
                //   child: Text(
                //     find_premiere_league_id_screen.step_one2.tr(),
                //     style: AppTheme.textTheme.titleLarge!.copyWith(
                //       color: AppColors.primary,
                //     ),
                //   ),
                // ),
                Constatnts.height24,
                Wrap(
                  children: [
                    Text(
                      '2. ${find_premiere_league_id_screen.step_two.tr()}',
                      style: AppTheme.textTheme.titleLarge!.copyWith(),
                    ),
                  ],
                ),
                Constatnts.height24,
                Wrap(
                  children: [
                    Text(
                      '3. ${find_premiere_league_id_screen.step_three.tr()}',
                      style: AppTheme.textTheme.titleLarge!.copyWith(),
                    ),
                  ],
                ),
                Constatnts.height24,
                Wrap(
                  children: [
                    Text(
                      '4. ${find_premiere_league_id_screen.step_four.tr()}',
                      style: AppTheme.textTheme.titleLarge!.copyWith(),
                    ),
                  ],
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       '1. ',
                //       style: AppTheme.textTheme.titleLarge!.copyWith(),
                //     ),
                //     Constatnts.width4,
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Log in to your FPL account at the official',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //         GestureDetector(
                //           onTap: () async {
                //             try {
                //               await launchUrl(Uri.parse(
                //                   'https://fantasy.premierleague.com'));
                //               // ignore: empty_catches
                //             } catch (e) {}
                //           },
                //           child: Text(
                //             ' Fantasy Premier League website.',
                //             style: AppTheme.textTheme.titleLarge!.copyWith(
                //               color: AppColors.primary,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                Constatnts.height24,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       '2. ',
                //       style: AppTheme.textTheme.titleLarge!.copyWith(),
                //     ),
                //     Constatnts.width4,
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Navigate to the "Pick Team" tab.',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Constatnts.height24,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       '3. ',
                //       style: AppTheme.textTheme.titleLarge!.copyWith(),
                //     ),
                //     Constatnts.width4,
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Click on the "Gameweek History"',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //         Text(
                //           'link located on the right side.',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Constatnts.height24,
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       '4. ',
                //       style: AppTheme.textTheme.titleLarge!.copyWith(),
                //     ),
                //     Constatnts.width4,
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'The URL in your browser\'s address bar',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //         Text(
                //           'will contain your FPL ID.',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //         Text(
                //           '  It is the number in the URL after /entry/.',
                //           style: AppTheme.textTheme.titleLarge!.copyWith(),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                Constatnts.height20,
                Assets.images.fplId.image(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
