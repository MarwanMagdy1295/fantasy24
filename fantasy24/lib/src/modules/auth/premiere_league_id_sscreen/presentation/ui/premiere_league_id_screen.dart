import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/find_premiere_league_id_sscreen/presentation/ui/find_premiere_league_id_screen.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/controller/premiere_league_id_screen_cubit.dart';
import 'package:next_match/src/modules/main_screen/presentation/ui/main_screen.dart';
import 'package:next_match/widget/custom_text_form_field.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/loading_widget.dart';

class PremiereLeagueIdScreen extends StatelessWidget {
  const PremiereLeagueIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocProvider(
          create: (BuildContext context) => PremiereLeagueIdScreenCubit(
              premiereLeagueIdScreenRepository: di()),
          lazy: true,
          child: Builder(builder: (context) {
            final cubit = context.watch<PremiereLeagueIdScreenCubit>();
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              color: AppColors.background,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constatnts.height20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back),
                            ),
                            Constatnts.width16,
                            Text(
                              premiere_league_id_screen.premiere_league_id.tr(),
                              style:
                                  AppTheme.textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height52,
                        Wrap(
                          children: [
                            Text(
                              premiere_league_id_screen
                                  .premiere_league_id_screen_title
                                  .tr(),
                              style: AppTheme.textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height14,
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              premiere_league_id_screen
                                  .premiere_league_id_screen_sub_title
                                  .tr(),
                              style: AppTheme.textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.paragraph),
                            ),
                          ],
                        ),
                        Constatnts.height40,
                        customTextFeild(
                          controller: cubit.fplEmailController,
                          title: premiere_league_id_screen.FPL_email.tr(),
                          isTitileAviable: true,
                          hint: 'example@ex.com',
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0.sp,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge?.copyWith(
                            fontSize: 12.5.sp,
                          ),
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0.sp,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return premiere_league_id_screen
                                  .please_enter_your_email
                                  .tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height14,
                        customTextFeild(
                          controller: cubit.fplPasswordController,
                          title: premiere_league_id_screen.FPL_password.tr(),
                          isTitileAviable: true,
                          hint: '•••••••••••',
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0.sp,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge?.copyWith(
                            fontSize: 12.5.sp,
                          ),
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0.sp,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: cubit.isHide,
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.hidePassword();
                            },
                            child: cubit.isHide
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.appBlack,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.appBlack,
                                  ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return premiere_league_id_screen
                                  .please_enter_your_password
                                  .tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height14,
                        customTextFeild(
                          controller: cubit.fplIdController,
                          title: premiere_league_id_screen.FPL_ID.tr(),
                          isTitileAviable: true,
                          hint: premiere_league_id_screen.Paste_or_input.tr(),
                          hintStyle: AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          titleStyle: AppTheme.textTheme.titleLarge,
                          contentStyle:
                              AppTheme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.paragraph,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return premiere_league_id_screen
                                  .please_enter_your_id
                                  .tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        cubit.isLoading
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LoadingWidget(),
                                ],
                              )
                            : customButton(
                                onTap: () {
                                  cubit.importFplIdData(context);
                                },
                                title: premiere_league_id_screen.my_id.tr(),
                                titleStyle:
                                    AppTheme.textTheme.titleLarge?.copyWith(
                                  fontSize: 12.5.sp,
                                  color: AppColors.white,
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
                        Constatnts.height16,
                        cubit.isLoading
                            ? Container()
                            : customButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ),
                                  );
                                },
                                title: premiere_league_id_screen.add_later.tr(),
                                titleStyle:
                                    AppTheme.textTheme.displayMedium?.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12.5.sp,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                  side: BorderSide(
                                      color: AppColors.primary, width: 2.0.h),
                                ),
                                backgroundColor: AppColors.white,
                                padding: const EdgeInsets.all(14.0),
                              ),
                        Constatnts.height60,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FindPremiereLeagueIdScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                premiere_league_id_screen.where_can_i_find_my_iD
                                    .tr(),
                                textAlign: TextAlign.center,
                                style:
                                    AppTheme.textTheme.headlineSmall?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
