import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/constants.dart';

Future customButtomSheet({context, required Widget child}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12.0.r),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
          color: AppColors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.3.w,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.paragraph,
                    borderRadius: BorderRadius.circular(64.0.r),
                  ),
                ),
              ),
              Constatnts.height30,
              child,
            ],
          ),
        ),
      );
    },
  );
}
