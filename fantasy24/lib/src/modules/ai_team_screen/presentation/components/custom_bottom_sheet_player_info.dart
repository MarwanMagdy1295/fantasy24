import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/controller/cubit/ai_teams_cubit.dart';
import 'package:next_match/widget/bottom_sheet.dart';
import 'package:next_match/widget/loading_widget.dart';

Future<dynamic> customBottomSheetPlayerInfo(
    BuildContext context, String? playerId) {
  return customButtomSheet(
    context: context,
    child: Container(
      width: MediaQuery.sizeOf(context).width.w,
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: BlocProvider(
        create: (BuildContext context) =>
            AiTeamsCubit(aiTeamsScreenRepository: di())
              ..getPlayerInfo(playerId: playerId),
        lazy: true,
        child: Builder(builder: (context) {
          final cubit = context.watch<AiTeamsCubit>();
          return cubit.isLoadingInfo
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).height * .4.h,
                  child: const LoadingWidget())
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(42.0),
                              child: CachedNetworkImage(
                                imageUrl: cubit.playerInfo?.photo ?? '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const SizedBox(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Assets.images.avatarImage.image(
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Constatnts.width10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cubit.playerInfo?.firstName} ${cubit.playerInfo?.secondName}',
                                  style: AppTheme.textTheme.headlineSmall
                                      ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  cubit.playerInfo?.playerTypeId == 1
                                      ? 'Goal Keeper'
                                      : cubit.playerInfo?.playerTypeId == 2
                                          ? 'Defender'
                                          : cubit.playerInfo?.playerTypeId == 3
                                              ? 'Midfielder'
                                              : 'Striker',
                                  style:
                                      AppTheme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.paragraph,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '\$${cubit.playerInfo?.nowCost}m',
                          style: AppTheme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Constatnts.height16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Points',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '153',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Constatnts.height20,
                            Text(
                              'Goals',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '2',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ownership',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '18.5%',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Constatnts.height20,
                            Text(
                              'Assists',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '5',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clean sheets',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '15',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Constatnts.height20,
                            Text(
                              'Form',
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.paragraph,
                              ),
                            ),
                            Text(
                              '10',
                              style: AppTheme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Constatnts.height30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bottom_sheet.gw.tr(),
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.paragraph,
                          ),
                        ),
                        Text(
                          bottom_sheet.next_game_diff.tr(),
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.paragraph,
                          ),
                        ),
                        Text(
                          bottom_sheet.points.tr(),
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.paragraph,
                          ),
                        ),
                      ],
                    ),
                    Constatnts.height16,
                    ...cubit.playerInfo!.playerPredictions!.map(
                      (prediction) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 40.0.w,
                        leading: Text(
                          prediction.event!.id!,
                          style: AppTheme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.paragraph,
                          ),
                        ),
                        title: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w, vertical: 10.0.w),
                          decoration: BoxDecoration(
                            color: cubit.difColor(prediction),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Text(
                            prediction.event?.fixtures?[0].homeTeam?.id ==
                                    cubit.playerInfo?.teamId
                                ? prediction.event!.fixtures![0].awayTeam!.name!
                                : prediction
                                    .event!.fixtures![0].homeTeam!.name!,
                            textAlign: TextAlign.center,
                            style: AppTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondryDark,
                            ),
                          ),
                        ),
                        trailing: Text(
                          '${prediction.predictedPoints?.toStringAsFixed(2)} Pts',
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Constatnts.height16,
                  ],
                );
        }),
      ),
    ),
  );
}
