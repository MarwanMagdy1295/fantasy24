import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/ai_team_screen/data/model/ai_teams_model.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/components/custom_bottom_sheet_player_info.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/controller/cubit/ai_teams_cubit.dart';

class AiTeamPlayerCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final PlayerData? playerData;
  final AiTeamsCubit cubit;
  const AiTeamPlayerCard({
    super.key,
    this.margin = const EdgeInsets.only(top: 14.0),
    this.playerData,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customBottomSheetPlayerInfo(context, playerData?.playerId);
      },
      child: Container(
        margin: margin,
        height: 120.0.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width * .24.w,
                imageUrl: playerData!.player!.photo!,
                placeholder: (context, url) => SizedBox(
                  width: 100.0.w,
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width * .24.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(2.0.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.0.w),
                      decoration: BoxDecoration(
                        color: AppColors.appBlack,
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(2.0.r),
                          topStart: Radius.circular(2.0.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                            // width: MediaQuery.sizeOf(context).width * .15.w,
                            child: Text(
                              playerData!.player!.webName!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: AppTheme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: Text(
                                  '${playerData!.player!.team!.shortName!} (H)',
                                  style: AppTheme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.paragraphLighter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: Text(
                                  '${playerData!.player!.nowCost}m',
                                  style: AppTheme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.paragraphLighter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.0.w,
                            vertical: 2.0.h,
                          ),
                          child: Text(
                            '${playerData!.player!.playerPredictions!.first.predictedPoints!.toStringAsFixed(0)} pts',
                            style: AppTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.appBlack,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: Text(
                            'Vs ${cubit.getVsTeam(playerData!.player!, playerData!.player!.playerPredictions!.first)}',
                            style: AppTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.paragraph,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         height: 7.0.h,
                    //         color: AppColors.secondry,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         height: 7.0.h,
                    //         color: AppColors.warning,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         height: 7.0.h,
                    //         color: AppColors.secondryLighter,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
