import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/components/custom_bottom_sheet_body.dart';

class PlayerCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const PlayerCard({
    super.key,
    this.margin = const EdgeInsets.only(top: 18.0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customBottomSheetBody(context);
      },
      child: Container(
        margin: margin,
        height: 98.0.h,
        width: 72.0.w,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child:
                  // CachedNetworkImage(
                  //   fit: BoxFit.fill,
                  //   imageUrl:
                  //       'https://img.freepik.com/free-photo/man-playing-football_1368-3029.jpg?w=826&t=st=1723573101~exp=1723573701~hmac=f885c359ea424262b03df2720112330dc3d8fa746f724250f77f78abd89c01af',
                  //   placeholder: (context, url) => const Center(
                  //     child: CircularProgressIndicator(
                  //       valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  //     ),
                  //   ),
                  //   errorWidget: (context, url, error) => Container(
                  //     height: 200,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Assets.images.playerImage.image(fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 54.0.h,
                width: 72.0.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(2.0.r),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 72.0.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 6.0.w),
                      decoration: BoxDecoration(
                        color: AppColors.appBlack,
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(2.0.r),
                          topStart: Radius.circular(2.0.r),
                        ),
                      ),
                      child: Text(
                        'Alisson Baker',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: AppTheme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 7.0.h,
                            color: AppColors.secondry,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 7.0.h,
                            color: AppColors.warning,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 7.0.h,
                            color: AppColors.secondryLighter,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'EVE (H)',
                            style: AppTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
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
