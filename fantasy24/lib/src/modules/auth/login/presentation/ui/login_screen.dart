// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/auth/forget_password/presentation/ui/forget_password.dart';
import 'package:next_match/src/modules/auth/login/presentation/controller/cubit/login_screen_cubit.dart';
import 'package:next_match/src/modules/auth/signup/presentation/ui/signup_screen.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/widget/custom_text_form_field.dart';
import 'package:next_match/widget/loading_widget.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocProvider(
          create: (BuildContext context) =>
              LoginScreenCubit(loginRepository: di()),
          lazy: true,
          child: Builder(builder: (context) {
            final cubit = context.watch<LoginScreenCubit>();
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Constatnts.height20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              signin_screen.signin.tr(),
                              style:
                                  AppTheme.textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.appBlack,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height52,
                        Row(
                          children: [
                            Text(
                              signin_screen.signin_title.tr(),
                              style: AppTheme.textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height14,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              signin_screen.signin_sub_title.tr(),
                              style: AppTheme.textTheme.titleLarge!.copyWith(
                                color: AppColors.paragraph,
                              ),
                            ),
                          ],
                        ),
                        Constatnts.height40,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.paragraphLight),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.0.sp, vertical: 6.0.h),
                                margin: EdgeInsetsDirectional.only(
                                  top: 8.0.h,
                                  start: 8.0.h,
                                  end: 16.0.h,
                                  bottom: 8.0.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.appBlack,
                                  borderRadius: BorderRadius.circular(4.0.r),
                                ),
                                child: Center(
                                  child: Text(
                                    signin_screen.signin.tr(),
                                    textAlign: TextAlign.center,
                                    style:
                                        AppTheme.textTheme.titleLarge?.copyWith(
                                      color: AppColors.white,
                                      fontSize: 12.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      SecondPageRoute(), (_) => false);
                                  // Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (BuildContext context) =>
                                  //         const SignUpScreen(),
                                  //   ),
                                  //   (_) => false,
                                  // );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.0.sp, vertical: 6.0.h),
                                  margin: EdgeInsetsDirectional.only(
                                      top: 8.0.h, end: 16.0.h, bottom: 8.0.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.transparent,
                                    borderRadius: BorderRadius.circular(4.0.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      signin_screen.signup.tr(),
                                      textAlign: TextAlign.center,
                                      style: AppTheme.textTheme.titleLarge
                                          ?.copyWith(
                                        color: AppColors.appBlack,
                                        fontSize: 12.5.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          controller: cubit.emailController,
                          title: signin_screen.email.tr(),
                          isTitileAviable: true,
                          hint: 'example@example.com',
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.red,
                            ),
                          ),
                          isFill: true,
                          color: AppColors.white,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return signin_screen.please_enter_your_email.tr();
                            }
                            if (!EmailValidator.validate(value)) {
                              return signin_screen.email_validation.tr();
                            }
                            //  else if (RegExp(
                            //         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            //     .hasMatch(value)) {
                            //   print(value);
                            //   return 'Please Enter A Valid Email';
                            // }
                            return null;
                          },
                        ),
                        Constatnts.height24,
                        customTextFeild(
                          controller: cubit.passwordController,
                          title: signin_screen.password.tr(),
                          isTitileAviable: true,
                          isForgetAviable: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          hint: '•••••••••••',
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
                          textInputAction: TextInputAction.done,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.grey,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: AppColors.red,
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
                              return signin_screen.please_enter_your_password
                                  .tr();
                            }
                            return null;
                          },
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        cubit.isLoading
                            ? LoadingWidget()
                            : customButton(
                                onTap: () {
                                  cubit.postLoginData(context);
                                },
                                title: signup_screen.signin.tr(),
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
                        // Constatnts.height40,
                        // Constatnts.height8,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 18.0.w, vertical: 14.0.h),
                        //         decoration: BoxDecoration(
                        //           color: AppColors.white,
                        //           borderRadius: BorderRadius.circular(4.0.r),
                        //           border: Border.all(color: AppColors.grey),
                        //         ),
                        //         child: const FaIcon(FontAwesomeIcons.apple),
                        //       ),
                        //     ),
                        //     Constatnts.width20,
                        //     Constatnts.width4,
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 16.0.w, vertical: 14.0.h),
                        //         decoration: BoxDecoration(
                        //           color: AppColors.white,
                        //           borderRadius: BorderRadius.circular(4.0.r),
                        //           border: Border.all(color: AppColors.grey),
                        //         ),
                        //         child: const FaIcon(FontAwesomeIcons.google),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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

class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => const SignUpScreen());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Container(
      color: AppColors.background,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-4, 0),
          end: Offset.zero,
        ).animate(animation),
        child: const SignUpScreen(),
      ),
    );
    // FadeTransition(opacity: animation, child: const SignUpScreen());
  }
}
