// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/controller/cubit/reset_password_screen_cubit.dart';
import 'package:next_match/widget/custom_text_form_field.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/loading_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocProvider(
          create: (context) =>
              ResetPasswordScreenCubit(resetPasswordScreenRepository: di()),
          child: Builder(builder: (context) {
            final cubit = context.watch<ResetPasswordScreenCubit>();
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              reset_password_screen.reset_password.tr(),
                              style:
                                  AppTheme.textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height52,
                        Row(
                          children: [
                            Text(
                              reset_password_screen.reset_password_screen_title
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
                          runAlignment: WrapAlignment.start,
                          children: [
                            Text(
                              reset_password_screen
                                  .reset_password_screen_sub_title
                                  .tr(),
                              style: AppTheme.textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.paragraph),
                            ),
                          ],
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          controller: cubit.passwordController,
                          title: signup_screen.password.tr(),
                          isTitileAviable: true,
                          hint: '********',
                          obscureText: cubit.isHide,
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
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.appBlack,
                                  ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return signin_screen.please_enter_your_password;
                            } else if (value.length < 8) {
                              return signup_screen.password_validation.tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          controller: cubit.repeatPasswordController,
                          title: signup_screen.Repeat_password.tr(),
                          isTitileAviable: true,
                          hint: '********',
                          obscureText: cubit.isHideReapetPassword,
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
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.hideReapetPassword();
                            },
                            child: cubit.isHideReapetPassword
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.appBlack,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.appBlack,
                                  ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return signup_screen.please_enter_your_password
                                  .tr();
                            } else if (value != cubit.passwordController.text) {
                              return signup_screen.password_not_match.tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        cubit.isLoading
                            ? const LoadingWidget()
                            : customButton(
                                onTap: () {
                                  cubit.resetPassword(context, email);
                                },
                                title:
                                    reset_password_screen.change_password.tr(),
                                titleStyle:
                                    AppTheme.textTheme.displayMedium?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
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
