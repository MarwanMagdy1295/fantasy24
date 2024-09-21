import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/predicted_points/presentation/components/custom_bottom_sheet_filter.dart';
import 'package:next_match/src/modules/predicted_points/presentation/components/plsyer_predicted_points_card.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';
import 'package:next_match/widget/loading_widget.dart';

class PointsPredection extends StatefulWidget {
  const PointsPredection({super.key});

  @override
  State<PointsPredection> createState() => _PointsPredectionState();
}

class _PointsPredectionState extends State<PointsPredection> {
  @override
  Widget build(BuildContext context) {
    // String? text = '';

    // bool isRTL(String text) {
    //   return intl.Bidi.detectRtlDirectionality(text);
    // }

    // List<String> data = [
    //   'Points predictions',
    //   'AI  transfers',
    //   'AI teams',
    //   'My team',
    // ];

    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) =>
            PointPredictionCubit(pointPredictionScreenRepository: di())
              ..getPointPredictionList(
                pageNumber: 1,
              ),
        lazy: true,
        child: Builder(
          builder: (context) {
            final cubit = context.watch<PointPredictionCubit>();
            return Scaffold(
              backgroundColor: AppColors.background,
              floatingActionButton: GestureDetector(
                onTap: () {
                  filterCustomBottomSheet(context, cubit);
                },
                child: Container(
                  padding: EdgeInsets.all(16.0.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4.0.r),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: AppColors.white,
                    size: 26.0,
                  ),
                ),
              ),
              body: Container(
                color: AppColors.background,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await cubit.getPointPredictionList(pageNumber: 1);
                    return;
                  },
                  child: SingleChildScrollView(
                    controller: cubit.verticalController,
                    child: cubit.isLoading
                        ? const Center(child: LoadingWidget())
                        : cubit.pointPredictionModel == null
                            ? SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * .5.h,
                                child: Center(
                                  child: Text('No Data',
                                      style: AppTheme.textTheme.headlineMedium),
                                ),
                              )
                            : Column(
                                children: [
                                  Constatnts.height16,
                                  ...cubit.predictionPointsList!.map(
                                    (predictionPoint) =>
                                        PlayerPredictedPointCard(
                                      predictionPoint: predictionPoint,
                                      predictionCubit: cubit,
                                    ),
                                  ),
                                  if (cubit.isScrollLoading)
                                    const Center(child: LoadingWidget())
                                  // Constatnts.height10,
                                  // ListTile(
                                  //   contentPadding: EdgeInsets.zero,
                                  //   leading: const Icon(
                                  //     Icons.arrow_back,
                                  //     color: AppColors.appBlack,
                                  //   ),
                                  //   title: Text(
                                  //     'Points predictions',
                                  //     style: AppTheme.textTheme.headlineMedium?.copyWith(
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  //   trailing: const Icon(
                                  //     Icons.notifications_none_outlined,
                                  //     color: AppColors.appBlack,
                                  //   ),
                                  // ),
                                  // Constatnts.height30,
                                  // SizedBox(
                                  //   height: MediaQuery.sizeOf(context).height * .06.h,
                                  //   child: TextFormField(
                                  //     cursorColor: AppColors.appBlack,
                                  //     keyboardType: TextInputType.multiline,
                                  //     textDirection: isRTL(text!)
                                  //         ? TextDirection.rtl
                                  //         : TextDirection.ltr,
                                  //     onChanged: (value) {
                                  //       setState(() {
                                  //         text = value;
                                  //       });
                                  //     },
                                  //     decoration: InputDecoration(
                                  //       prefixIcon: const Icon(
                                  //         Icons.search,
                                  //         color: AppColors.appBlack,
                                  //         size: 20.0,
                                  //       ),
                                  //       enabledBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(8.0),
                                  //         borderSide: const BorderSide(
                                  //           color: Colors.grey,
                                  //         ),
                                  //       ),
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(8.0),
                                  //         borderSide: const BorderSide(
                                  //           color: Colors.grey,
                                  //         ),
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius: BorderRadius.circular(8.0),
                                  //         borderSide: const BorderSide(
                                  //           color: Colors.grey,
                                  //         ),
                                  //       ),
                                  //       hintText: 'Search by player name or team',
                                  //       contentPadding: const EdgeInsets.symmetric(
                                  //           vertical: 10.0, horizontal: 10.0),
                                  //       hintStyle:
                                  //           AppTheme.textTheme.headlineSmall?.copyWith(
                                  //         color: AppColors.paragraph,
                                  //         fontWeight: FontWeight.w500,
                                  //         fontStyle: FontStyle.italic,
                                  //       ),
                                  //       fillColor: AppColors.white,
                                  //       filled: true,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Constatnts.height20,
                                  // SingleChildScrollView(
                                  //   scrollDirection: Axis.horizontal,
                                  //   child: Row(
                                  //     children: [
                                  //       ...data.map(
                                  //         (d) => Container(
                                  //           padding: EdgeInsets.symmetric(
                                  //               horizontal: 12.0.w, vertical: 4.0.h),
                                  //           margin: EdgeInsetsDirectional.only(end: 8.0.w),
                                  //           decoration: BoxDecoration(
                                  //             color: AppColors.white,
                                  //             borderRadius: BorderRadius.circular(30.0.r),
                                  //             border: Border.all(color: AppColors.grey),
                                  //           ),
                                  //           child: Text(d),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
