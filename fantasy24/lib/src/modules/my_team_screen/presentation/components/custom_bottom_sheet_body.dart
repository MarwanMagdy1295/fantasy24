import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/widget/bottom_sheet.dart';

Future<dynamic> customBottomSheetBody(BuildContext context) {
  return customButtomSheet(
    context: context,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
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
                'GW',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.paragraph,
                ),
              ),
              Text(
                'Next game & diff',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.paragraph,
                ),
              ),
              Text(
                'Points',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.paragraph,
                ),
              ),
            ],
          ),
          Constatnts.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.paragraph,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.w),
                decoration: BoxDecoration(
                  color: AppColors.secondryLighter,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Text(
                  'Bournemouth (H)',
                  style: AppTheme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryDark,
                  ),
                ),
              ),
              Text(
                '4.3 Pts',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Constatnts.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.paragraph,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.w),
                decoration: BoxDecoration(
                  color: AppColors.secondry200,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Text(
                  'Spurs (A)',
                  style: AppTheme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryDark,
                  ),
                ),
              ),
              Text(
                '8.7 Pts',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Constatnts.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.paragraph,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.w),
                decoration: BoxDecoration(
                  color: AppColors.warning50,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Text(
                  'Brighton (H)',
                  style: AppTheme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryDark,
                  ),
                ),
              ),
              Text(
                '4.3 Pts',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Constatnts.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.paragraph,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.w),
                decoration: BoxDecoration(
                  color: AppColors.warning100,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Text(
                  'Aston Villa (A)',
                  style: AppTheme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryDark,
                  ),
                ),
              ),
              Text(
                '4.3 Pts',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Constatnts.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5',
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.paragraph,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.w),
                decoration: BoxDecoration(
                  color: AppColors.warning200,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Text(
                  'Crystal Palace (H)',
                  style: AppTheme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondryDark,
                  ),
                ),
              ),
              Text(
                '4.3 Pts',
                style: AppTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Constatnts.height16,
        ],
      ),
    ),
  );
}
