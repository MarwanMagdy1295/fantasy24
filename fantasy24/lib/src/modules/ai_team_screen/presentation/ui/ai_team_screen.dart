import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/components/player_cart.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/controller/cubit/ai_teams_cubit.dart';
import 'package:next_match/widget/loading_widget.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class AiTeamScreen extends StatelessWidget {
  const AiTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (BuildContext context) =>
            AiTeamsCubit(aiTeamsScreenRepository: di())..getFormationData(),
        lazy: true,
        child: Builder(builder: (context) {
          final cubit = context.watch<AiTeamsCubit>();
          return SafeArea(
            child: SingleChildScrollView(
              child: cubit.isLoading
                  ? const Center(child: LoadingWidget())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 20.0.h),
                          child: Text(
                            ai_team_screen.best_line_up.tr(),
                            style: AppTheme.textTheme.displayLarge?.copyWith(
                              fontStyle: FontStyle.italic,
                              fontSize: 24.5.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 16.0.w, vertical: 16.0.h),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'Game Week',
                        //         style: AppTheme.textTheme.titleLarge,
                        //       ),
                        //       Constatnts.height10,
                        //       DropdownSearch<String>(
                        //         clearButtonProps:
                        //             const ClearButtonProps(isVisible: false),
                        //         selectedItem: cubit.eventId,
                        //         items: const [
                        //           '1',
                        //           '2',
                        //           '3',
                        //           '4',
                        //         ],
                        //         dropdownButtonProps: const DropdownButtonProps(
                        //           icon: Icon(
                        //             Icons.keyboard_arrow_down_rounded,
                        //             color: AppColors.appBlack,
                        //           ),
                        //         ),
                        //         popupProps: PopupProps.menu(
                        //           constraints:
                        //               BoxConstraints(maxHeight: 160.0.h),
                        //           itemBuilder: (context, item, isTrue) {
                        //             return ListTile(
                        //               title: Text(item),
                        //               tileColor: AppColors.white,
                        //             );
                        //           },
                        //         ),
                        //         onChanged: (value) {
                        //           cubit.eventId = value;
                        //           cubit.getFormationData();
                        //         },
                        //         dropdownDecoratorProps: DropDownDecoratorProps(
                        //           dropdownSearchDecoration: InputDecoration(
                        //             contentPadding: const EdgeInsets.symmetric(
                        //               horizontal: 10.0,
                        //             ),
                        //             filled: true,
                        //             fillColor: Colors.white,
                        //             enabledBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(8.0),
                        //               borderSide: const BorderSide(
                        //                 color: AppColors.grey,
                        //               ),
                        //             ),
                        //             focusedBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(8.0),
                        //               borderSide: const BorderSide(
                        //                 color: AppColors.grey,
                        //               ),
                        //             ),
                        //             disabledBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(8.0),
                        //               borderSide: const BorderSide(
                        //                 color: AppColors.grey,
                        //               ),
                        //             ),
                        //             border: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(8.0),
                        //               borderSide: const BorderSide(
                        //                 color: AppColors.grey,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Constatnts.height30,
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 12.0.w, vertical: 16.0.h),
                        //   constraints: BoxConstraints(
                        //     maxWidth: 200.0.w,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.white,
                        //     borderRadius: BorderRadius.circular(8.0.r),
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Overall points',
                        //             style:
                        //                 AppTheme.textTheme.bodyLarge?.copyWith(
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //           ),
                        //           Constatnts.width16,
                        //           Assets.icons.overallPoints
                        //               .svg(fit: BoxFit.fill),
                        //         ],
                        //       ),
                        //       Text(
                        //         '${cubit.res!.playersListData?[0].eventExpectedPoints?.toStringAsFixed(2)} pts',
                        //         style:
                        //             AppTheme.textTheme.displayLarge?.copyWith(
                        //           fontWeight: FontWeight.w700,
                        //           fontStyle: FontStyle.italic,
                        //           fontSize: 28.0.sp,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Constatnts.height20,
                        cubit.isfailed
                            ? SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * .5.h,
                                child: Center(
                                  child: Text('No Data',
                                      style: AppTheme.textTheme.headlineMedium),
                                ),
                              )
                            : SizedBox(
                                child: Stack(
                                  children: [
                                    Assets.images.playground.svg(
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .7.h,
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 94.0.w,
                                                  child: AiTeamPlayerCard(
                                                    playerData:
                                                        cubit.goolKeeperPlayer,
                                                    cubit: cubit,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Constatnts.height16,
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.0.w),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ...cubit.defenderPlayers!
                                                        .map(
                                                      (defenderPlayer) =>
                                                          AiTeamPlayerCard(
                                                        playerData:
                                                            defenderPlayer,
                                                        cubit: cubit,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    top:
                                                                        14.0.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Constatnts.height16,
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.0.w),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ...cubit.midfielderPlayers!
                                                        .map(
                                                      (midfielderPlayer) =>
                                                          AiTeamPlayerCard(
                                                        playerData:
                                                            midfielderPlayer,
                                                        cubit: cubit,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    top:
                                                                        14.0.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Constatnts.height16,
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.0.w),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ...cubit.strikerPlayers!
                                                        .map(
                                                      (strikerPlayer) =>
                                                          AiTeamPlayerCard(
                                                        playerData:
                                                            strikerPlayer,
                                                        cubit: cubit,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    top:
                                                                        14.0.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        cubit.isfailed
                            ? Container()
                            : Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0.w, vertical: 16.0.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          ai_team_screen.substitutes.tr(),
                                          style: AppTheme
                                              .textTheme.displayMedium
                                              ?.copyWith(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...cubit.subPlayers!.map(
                                          (subPlayer) => AiTeamPlayerCard(
                                            playerData: subPlayer,
                                            cubit: cubit,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0.w),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Constatnts.height24,
                                ],
                              ),

                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'Line-up summary',
                        //         style: AppTheme.textTheme.displayMedium?.copyWith(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Constatnts.height16,
                        // Container(
                        //   padding: const EdgeInsets.all(16.0),
                        //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.white,
                        //     borderRadius: BorderRadius.circular(16.0.r),
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'We’re replaced',
                        //         style: AppTheme.textTheme.headlineSmall?.copyWith(
                        //           color: AppColors.paragraph,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       Row(
                        //         children: [
                        //           Text(
                        //             'Player 1',
                        //             style: AppTheme.textTheme.headlineSmall?.copyWith(
                        //               fontWeight: FontWeight.w500,
                        //             ),
                        //           ),
                        //           Text(
                        //             ' with ',
                        //             style: AppTheme.textTheme.headlineSmall?.copyWith(
                        //               color: AppColors.paragraph,
                        //               fontWeight: FontWeight.w500,
                        //             ),
                        //           ),
                        //           Text(
                        //             'Player 2',
                        //             style: AppTheme.textTheme.headlineSmall?.copyWith(
                        //               fontWeight: FontWeight.w500,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Constatnts.height24,
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'Teams comparison',
                        //         style: AppTheme.textTheme.displayMedium?.copyWith(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Constatnts.height16,
                        // Container(
                        //   padding: const EdgeInsets.all(16.0),
                        //   margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.white,
                        //     borderRadius: BorderRadius.circular(16.0.r),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       SizedBox(
                        //         height: MediaQuery.sizeOf(context).height * .26.h,
                        //         width: MediaQuery.sizeOf(context).width * .8.w,
                        //         child: RadarChart(
                        //           RadarChartData(
                        //             radarBorderData: const BorderSide(
                        //               color: AppColors.transparent,
                        //             ),
                        //             gridBorderData: const BorderSide(
                        //               color: AppColors.transparent,
                        //             ),
                        //             titlePositionPercentageOffset: .0,
                        //             tickBorderData: const BorderSide(
                        //               color: AppColors.transparent,
                        //               // width: 60,
                        //               style: BorderStyle.none,
                        //               strokeAlign: 10.0,
                        //             ),
                        //             ticksTextStyle: AppTheme.textTheme.bodySmall
                        //                 ?.copyWith(fontSize: 4.0.sp),
                        //             radarShape: RadarShape.polygon,
                        //             getTitle: (index, angle) {
                        //               switch (index) {
                        //                 case 0:
                        //                   return RadarChartTitle(
                        //                       text: 'PTS', angle: angle);
                        //                 case 1:
                        //                   return RadarChartTitle(
                        //                       text: 'DEF', angle: angle);
                        //                 case 2:
                        //                   return RadarChartTitle(
                        //                       text: 'DEF', angle: angle);
                        //                 case 3:
                        //                   return RadarChartTitle(
                        //                       text: 'MID', angle: angle);
                        //                 case 4:
                        //                   return RadarChartTitle(
                        //                       text: 'FWD', angle: angle);
                        //                 default:
                        //                   return const RadarChartTitle(text: '');
                        //               }
                        //             },
                        //             dataSets: [
                        //               RadarDataSet(
                        //                 borderColor: AppColors.transparent,
                        //                 entryRadius: 0.r,
                        //                 fillColor: AppColors.warning,
                        //                 dataEntries: [
                        //                   const RadarEntry(value: 70.0),
                        //                   const RadarEntry(value: 60.0),
                        //                   const RadarEntry(value: 50.0),
                        //                   const RadarEntry(value: 20.0),
                        //                   const RadarEntry(value: 10.0),
                        //                 ],
                        //               ),
                        //               RadarDataSet(
                        //                 borderColor: AppColors.transparent,
                        //                 entryRadius: 0.r,
                        //                 fillColor: AppColors.primary,
                        //                 dataEntries: [
                        //                   const RadarEntry(value: 10.0),
                        //                   const RadarEntry(value: 20.0),
                        //                   const RadarEntry(value: 50.0),
                        //                   const RadarEntry(value: 60.0),
                        //                   const RadarEntry(value: 70.0),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           swapAnimationDuration:
                        //               const Duration(milliseconds: 150),
                        //           swapAnimationCurve: Curves.bounceIn,
                        //         ),
                        //       ),
                        //       Constatnts.height16,
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Container(
                        //                 height: 12.0.h,
                        //                 width: 12.0.w,
                        //                 decoration: BoxDecoration(
                        //                   color: AppColors.primary,
                        //                   borderRadius: BorderRadius.circular(2.0.r),
                        //                 ),
                        //               ),
                        //               Constatnts.width6,
                        //               Text(
                        //                 'Teams comparison',
                        //                 style:
                        //                     AppTheme.textTheme.titleLarge?.copyWith(),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Container(
                        //                 height: 12.0.h,
                        //                 width: 12.0.w,
                        //                 decoration: BoxDecoration(
                        //                   color: AppColors.warning,
                        //                   borderRadius: BorderRadius.circular(2.0.r),
                        //                 ),
                        //               ),
                        //               Constatnts.width6,
                        //               Text(
                        //                 'Suggested team',
                        //                 style:
                        //                     AppTheme.textTheme.titleLarge?.copyWith(),
                        //               ),
                        //             ],
                        //           ),
                        //           Constatnts.height16,
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Constatnts.height16,
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }
}
