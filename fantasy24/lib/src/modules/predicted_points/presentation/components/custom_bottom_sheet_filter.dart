import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/predicted_points/presentation/components/custom_slider.dart';
import 'package:next_match/src/modules/predicted_points/presentation/components/player_type_component.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';
import 'package:next_match/widget/bottom_sheet.dart';
import 'package:next_match/widget/custom_button.dart';

Future<dynamic> filterCustomBottomSheet(
    BuildContext context, PointPredictionCubit cubit) {
  return customButtomSheet(
    context: context,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'FILTERS',
            style: AppTheme.textTheme.displayLarge?.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          Constatnts.height40,
          Text(
            'Price range',
            style: AppTheme.textTheme.titleLarge,
          ),
          Constatnts.height10,
          CustomSliderWidget(
            cubit: cubit,
            sliderType: 'price',
          ),
          Constatnts.height30,
          Text(
            'Game-week range',
            style: AppTheme.textTheme.titleLarge,
          ),
          Constatnts.height10,
          CustomSliderWidget(
            cubit: cubit,
            sliderType: 'gameWeek',
          ),
          Constatnts.height30,
          Text(
            'Sort by',
            style: AppTheme.textTheme.titleLarge,
          ),
          Constatnts.height10,
          DropdownSearch<String>(
            clearButtonProps: const ClearButtonProps(isVisible: false),
            selectedItem: 'ASC',
            items: const [
              'ASC',
              'DESC',
            ],
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.appBlack,
              ),
            ),
            popupProps: PopupProps.menu(
              constraints: BoxConstraints(maxHeight: 100.0.h),
              itemBuilder: (context, item, isTrue) {
                return ListTile(
                  title: Text(item),
                  tileColor: AppColors.white,
                );
              },
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          ),
          Constatnts.height30,
          Text(
            'Player position',
            style: AppTheme.textTheme.titleLarge,
          ),
          PlayerTypeWidget(
            cubit: cubit,
          ),
          Constatnts.height16,
          customButton(
            onTap: () async {
              await cubit.getPointPredictionList(pageNumber: 1);
            },
            title: 'Done',
            titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
              color: AppColors.white,
              fontSize: 16.0.sp,
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
          Constatnts.height40,
        ],
      ),
    ),
  );
}
