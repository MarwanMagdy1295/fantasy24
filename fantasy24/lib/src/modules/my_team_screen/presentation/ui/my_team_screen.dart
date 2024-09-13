import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/ui/premiere_league_id_screen.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/components/player_cart.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/controller/cubit/my_team_cubit.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/loading_widget.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class MyTeamScreen extends StatelessWidget {
  final MyTeamModel? myTeamModel;
  const MyTeamScreen({
    super.key,
    this.myTeamModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MyTeamCubit(myTeamScreenRepository: di())..getUserData(context),
      lazy: true,
      child: Builder(
        builder: (context) {
          final cubit = context.watch<MyTeamCubit>();
          if (myTeamModel != null) {
            cubit.myTeamModel = myTeamModel;
            cubit.formation();
          }
          return cubit.isLoading
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).height * 01.h,
                  width: MediaQuery.sizeOf(context).width * .01.w,
                  child: const LoadingWidget())
              : Scaffold(
                  backgroundColor: AppColors.background,
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: myTeamModel == null
                      ? Container(
                          width: MediaQuery.sizeOf(context).width.w,
                          height: MediaQuery.sizeOf(context).height * .3.h,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0.r),
                              topRight: Radius.circular(12.0.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                my_team_screen.could_not_import_team.tr(),
                                style:
                                    AppTheme.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Constatnts.height14,
                              Text(
                                my_team_screen.not_available_functions.tr(),
                                style: AppTheme.textTheme.titleLarge?.copyWith(
                                  color: AppColors.paragraph,
                                ),
                              ),
                              Constatnts.height24,
                              customButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PremiereLeagueIdScreen(),
                                    ),
                                  );
                                },
                                title: my_team_screen.import_my_team.tr(),
                                titleStyle:
                                    AppTheme.textTheme.titleLarge?.copyWith(
                                  color: AppColors.white,
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
                        )
                      : null,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Constatnts.height16,
                          if (myTeamModel != null)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 16.0.h),
                                      constraints: BoxConstraints(
                                        maxWidth: 160.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                my_team_screen.overall_points
                                                    .tr(),
                                                style: AppTheme
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Assets.icons.overallPoints
                                                  .svg(fit: BoxFit.fill),
                                            ],
                                          ),
                                          Text(
                                            '${cubit.myTeamModel!.data![0].summaryOverallPoints!.toString()} pts',
                                            style: AppTheme
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 25.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Constatnts.width10,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 16.0.h),
                                      constraints: BoxConstraints(
                                        maxWidth: 160.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                my_team_screen.game_week_points
                                                    .tr(),
                                                style: AppTheme
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Assets.icons.gameWeekPoint
                                                  .svg(fit: BoxFit.fill),
                                            ],
                                          ),
                                          Text(
                                            '${cubit.myTeamModel!.data![0].summaryEventPoints!.toString()} pts',
                                            style: AppTheme
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 25.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Constatnts.width10,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 16.0.h),
                                      constraints: BoxConstraints(
                                        maxWidth: 220.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                my_team_screen.live_rank.tr(),
                                                style: AppTheme
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Assets.icons.liveRank
                                                  .svg(fit: BoxFit.fill),
                                            ],
                                          ),
                                          Text(
                                            '${cubit.myTeamModel!.data![0].summaryOverallRank!.toString()} pts',
                                            style: AppTheme
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 25.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Constatnts.width10,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 16.0.h),
                                      constraints: BoxConstraints(
                                        maxWidth: 220.0.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                my_team_screen.game_week_rank
                                                    .tr(),
                                                style: AppTheme
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Assets.icons.gameWeekRank
                                                  .svg(fit: BoxFit.fill),
                                            ],
                                          ),
                                          Text(
                                            '${cubit.myTeamModel!.data![0].summaryEventRank!.toString()} pts',
                                            style: AppTheme
                                                .textTheme.displayLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 25.5.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Constatnts.height16,
                          Stack(
                            children: [
                              Assets.images.playground.svg(
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.sizeOf(context).height * .76.h,
                              ),
                              myTeamModel == null
                                  ? SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .5.h,
                                      child: Center(
                                        child: Text(
                                          my_team_screen.have_not_import_team
                                              .tr(),
                                          style: AppTheme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontStyle: FontStyle.italic,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                PlayerCard(
                                                  cubit: cubit,
                                                  playerData:
                                                      cubit.goolKeeperPlayer,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0.w),
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
                                                      (pick) => PlayerCard(
                                                        cubit: cubit,
                                                        playerData: pick,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    end: 10.0.w,
                                                                    top:
                                                                        14.0.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0.w),
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
                                                      (pick) => PlayerCard(
                                                        cubit: cubit,
                                                        playerData: pick,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    end: 10.0.w,
                                                                    top:
                                                                        14.0.h),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0.w),
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
                                                      (pick) => PlayerCard(
                                                        cubit: cubit,
                                                        playerData: pick,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        10.0.w,
                                                                    end: 10.0.w,
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
                          myTeamModel == null
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0.w, vertical: 16.0.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        my_team_screen.substitutes.tr(),
                                        style: AppTheme.textTheme.displaySmall
                                            ?.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                          myTeamModel == null
                              ? Container()
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ...cubit.substitutionPlayers!.map(
                                        (pick) => PlayerCard(
                                          cubit: cubit,
                                          playerData: pick,
                                          margin: EdgeInsetsDirectional.only(
                                              start: 10.0.w,
                                              end: 10.0.w,
                                              top: 14.0.h),
                                        ),
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
        },
      ),
    );
  }
}
