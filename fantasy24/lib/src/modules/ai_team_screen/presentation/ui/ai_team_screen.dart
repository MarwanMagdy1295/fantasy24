import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/components/player_cart.dart';

class AiTeamScreen extends StatelessWidget {
  const AiTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Constatnts.height16,
              Stack(
                children: [
                  Assets.images.playground.svg(fit: BoxFit.fill),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlayerCard(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                child: Row(
                  children: [
                    Text(
                      'Substitutes',
                      style: AppTheme.textTheme.displayMedium?.copyWith(),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 14.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                  ],
                ),
              ),
              Constatnts.height24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  children: [
                    Text(
                      'Line-up summary',
                      style: AppTheme.textTheme.displayMedium?.copyWith(),
                    ),
                  ],
                ),
              ),
              Constatnts.height16,
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We’re replaced',
                      style: AppTheme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.paragraph,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Player 1',
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' with ',
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Player 2',
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Constatnts.height24,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  children: [
                    Text(
                      'Teams comparison',
                      style: AppTheme.textTheme.displayMedium?.copyWith(),
                    ),
                  ],
                ),
              ),
              Constatnts.height16,
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .26.h,
                      width: MediaQuery.sizeOf(context).width * .8.w,
                      child: RadarChart(
                        RadarChartData(
                          radarBorderData: const BorderSide(
                            color: AppColors.transparent,
                          ),
                          gridBorderData: const BorderSide(
                            color: AppColors.transparent,
                          ),
                          titlePositionPercentageOffset: .0,
                          tickBorderData: const BorderSide(
                            color: AppColors.transparent,
                            // width: 60,
                            style: BorderStyle.none,
                            strokeAlign: 10.0,
                          ),
                          ticksTextStyle: AppTheme.textTheme.bodySmall
                              ?.copyWith(fontSize: 4.0.sp),
                          radarShape: RadarShape.polygon,
                          getTitle: (index, angle) {
                            switch (index) {
                              case 0:
                                return RadarChartTitle(
                                    text: 'PTS', angle: angle);
                              case 1:
                                return RadarChartTitle(
                                    text: 'DEF', angle: angle);
                              case 2:
                                return RadarChartTitle(
                                    text: 'DEF', angle: angle);
                              case 3:
                                return RadarChartTitle(
                                    text: 'MID', angle: angle);
                              case 4:
                                return RadarChartTitle(
                                    text: 'FWD', angle: angle);
                              default:
                                return const RadarChartTitle(text: '');
                            }
                          },
                          dataSets: [
                            RadarDataSet(
                              borderColor: AppColors.transparent,
                              entryRadius: 0.r,
                              fillColor: AppColors.warning,
                              dataEntries: [
                                const RadarEntry(value: 70.0),
                                const RadarEntry(value: 60.0),
                                const RadarEntry(value: 50.0),
                                const RadarEntry(value: 20.0),
                                const RadarEntry(value: 10.0),
                              ],
                            ),
                            RadarDataSet(
                              borderColor: AppColors.transparent,
                              entryRadius: 0.r,
                              fillColor: AppColors.primary,
                              dataEntries: [
                                const RadarEntry(value: 10.0),
                                const RadarEntry(value: 20.0),
                                const RadarEntry(value: 50.0),
                                const RadarEntry(value: 60.0),
                                const RadarEntry(value: 70.0),
                              ],
                            ),
                          ],
                        ),
                        swapAnimationDuration:
                            const Duration(milliseconds: 150),
                        swapAnimationCurve: Curves.bounceIn,
                      ),
                    ),
                    Constatnts.height16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 12.0.h,
                              width: 12.0.w,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(2.0.r),
                              ),
                            ),
                            Constatnts.width6,
                            Text(
                              'Teams comparison',
                              style: AppTheme.textTheme.titleLarge?.copyWith(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 12.0.h,
                              width: 12.0.w,
                              decoration: BoxDecoration(
                                color: AppColors.warning,
                                borderRadius: BorderRadius.circular(2.0.r),
                              ),
                            ),
                            Constatnts.width6,
                            Text(
                              'Suggested team',
                              style: AppTheme.textTheme.titleLarge?.copyWith(),
                            ),
                          ],
                        ),
                        Constatnts.height16,
                      ],
                    ),
                  ],
                ),
              ),
              Constatnts.height16,
            ],
          ),
        ),
      ),
    );
  }
}
