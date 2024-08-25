import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';

class PlayerPredictedPointCard extends StatelessWidget {
  const PlayerPredictedPointCard({
    super.key,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(42.0),
                    child: CachedNetworkImage(
                      imageUrl: '',
                      imageBuilder: (context, imageProvider) => Container(
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
                        'Alisson Becker',
                        style: AppTheme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Goal Keeper',
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
                '\$2.3m',
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
                children: [
                  Text(
                    'GW1',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                  Text(
                    '8.7',
                    style: AppTheme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Vs WHU',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'GW1',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                  Text(
                    '8.7',
                    style: AppTheme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Vs WHU',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'GW1',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                  Text(
                    '8.7',
                    style: AppTheme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Vs WHU',
                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.paragraph,
                    ),
                  ),
                ],
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
