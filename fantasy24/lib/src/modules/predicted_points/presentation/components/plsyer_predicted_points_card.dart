import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/predicted_points/data/model/point_prediction_model.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';

class PlayerPredictedPointCard extends StatelessWidget {
  final PredictionPointData predictionPoint;
  final PointPredictionCubit predictionCubit;
  const PlayerPredictedPointCard({
    super.key,
    required this.predictionPoint,
    required this.predictionCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
      margin: EdgeInsetsDirectional.only(
          bottom: 12.0.h, start: 16.0.w, end: 16.0.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(42.0),
                    child: CachedNetworkImage(
                      imageUrl: predictionPoint.photo!,
                      imageBuilder: (context, imageProvider) => Container(
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
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.48.w,
                        child: Text(
                          '${predictionPoint.firstName!} ${predictionPoint.secondName!}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        predictionPoint.playerTypeId == 1
                            ? 'GoolKeper'
                            : predictionPoint.playerTypeId == 2
                                ? 'Defender'
                                : predictionPoint.playerTypeId == 3
                                    ? 'Midfielder'
                                    : 'Striker',
                        style: AppTheme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.paragraph,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${predictionPoint.nowCost}m',
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
              ...predictionPoint.selectedPlayerPredictions!.map(
                (playerPrediction) => Column(
                  children: [
                    Text(
                      playerPrediction.event!.name!,
                      style: AppTheme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.paragraph,
                      ),
                    ),
                    Text(
                      playerPrediction.predictedPoints!.toStringAsFixed(1),
                      style: AppTheme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Vs ${predictionCubit.getVsTeam(predictionPoint, playerPrediction)}',
                      style: AppTheme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.paragraph,
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Icon(
                    Icons.arrow_outward,
                    color: AppColors.primary,
                    size: 30.0,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
