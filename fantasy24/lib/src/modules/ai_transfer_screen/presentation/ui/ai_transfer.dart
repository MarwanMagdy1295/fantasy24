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
import 'package:next_match/src/modules/auth/login/presentation/controller/cubit/login_screen_cubit.dart';
import 'package:next_match/widget/custom_button.dart';

class AiTransfer extends StatelessWidget {
  const AiTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: Container(
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
        body: BlocProvider(
          create: (BuildContext context) =>
              LoginScreenCubit(loginRepository: di()),
          child: Builder(
            builder: (context) {
              // final cubit = context.watch<LoginScreenCubit>();
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                color: AppColors.background,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'BEST TRANSFER THIS GAMEWEEK',
                        style: AppTheme.textTheme.displayLarge?.copyWith(
                          fontSize: 28.0.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Constatnts.height30,
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.0.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(42.0),
                                      child: CachedNetworkImage(
                                        imageUrl: '',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const SizedBox(
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
                                    Text(
                                      'Alisson Becker',
                                      style: AppTheme.textTheme.headlineSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(42.0),
                                          child: CachedNetworkImage(
                                            imageUrl: '',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const SizedBox(
                                              height: 16.0,
                                              width: 16.0,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Assets.images.avatarImage.image(
                                              height: 16.0,
                                              width: 16.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Constatnts.width4,
                                        Text(
                                          'Goal Keeper',
                                          style: AppTheme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.paragraph,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Constatnts.height20,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 4.0.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.warning,
                                        borderRadius:
                                            BorderRadius.circular(60.0.r),
                                      ),
                                      child: Text(
                                        '14 pts',
                                        style: AppTheme.textTheme.titleLarge
                                            ?.copyWith(
                                          color: AppColors.warning50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.compare_arrows,
                                  size: 30.0,
                                ),
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(42.0),
                                      child: CachedNetworkImage(
                                        imageUrl: '',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const SizedBox(
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
                                    Text(
                                      'Alisson Becker',
                                      style: AppTheme.textTheme.headlineSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(42.0),
                                          child: CachedNetworkImage(
                                            imageUrl: '',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const SizedBox(
                                              height: 16.0,
                                              width: 16.0,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Assets.images.avatarImage.image(
                                              height: 16.0,
                                              width: 16.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Constatnts.width4,
                                        Text(
                                          'Goal Keeper',
                                          style: AppTheme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.paragraph,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Constatnts.height20,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0.w, vertical: 4.0.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondry,
                                        borderRadius:
                                            BorderRadius.circular(60.0.r),
                                      ),
                                      child: Text(
                                        '14 pts',
                                        style: AppTheme.textTheme.titleLarge
                                            ?.copyWith(
                                          color: AppColors.secondryDark,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Constatnts.height24,
                            customButton(
                              onTap: () {},
                              title: ai_transfer_screen.make_transfer.tr(),
                              titleStyle:
                                  AppTheme.textTheme.displayMedium?.copyWith(
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
                            Constatnts.height14,
                            customButton(
                              onTap: () {},
                              title: ai_transfer_screen.reject_transfer.tr(),
                              titleStyle:
                                  AppTheme.textTheme.displayMedium?.copyWith(
                                color: AppColors.primary,
                                fontSize: 16.0.sp,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0.r),
                                side: BorderSide(
                                    color: AppColors.primary, width: 2.0.h),
                              ),
                              backgroundColor: AppColors.white,
                              padding: const EdgeInsets.all(14.0),
                            ),
                          ],
                        ),
                      ),
                      Constatnts.height30,
                      customButton(
                        onTap: () {},
                        title: ai_transfer_screen.more_transfers.tr(),
                        titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                          color: AppColors.primary,
                          fontSize: 16.0.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                          side: BorderSide(
                              color: AppColors.primary, width: 2.0.h),
                        ),
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.all(14.0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
