import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/controller/otp_screen_cubit.dart';
import 'package:next_match/widget/loading_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/widget/custom_button.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class OtpScreen extends StatelessWidget {
  final bool fromSignup;
  const OtpScreen({super.key, required this.fromSignup});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocProvider(
          create: (BuildContext context) =>
              OtpScreenCubit(verifyScreenRepository: di()),
          child: Builder(builder: (context) {
            final cubit = context.read<OtpScreenCubit>();
            cubit.fromSignup = fromSignup;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              color: AppColors.background,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              otp_screen.verify.tr(),
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
                              otp_screen.otp_screen_title.tr(),
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
                              otp_screen.otp_screen_sub_title.tr(),
                              style: AppTheme.textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.paragraph),
                            ),
                          ],
                        ),
                        Constatnts.height24,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: PinCodeTextField(
                            controller: cubit.controller,
                            keyboardType: TextInputType.text,
                            enablePinAutofill: true,
                            cursorColor: AppColors.primary,
                            cursorHeight: 20.0.h,
                            autoFocus: true,
                            length: 5,
                            obscureText: false,
                            animationType: AnimationType.slide,
                            onCompleted: (v) {
                              cubit.isButtonDisabled(context);
                            },
                            onEditingComplete: () {
                              cubit.isButtonDisabled(context);
                            },
                            onSubmitted: (v) {
                              cubit.isButtonDisabled(context);
                            },
                            onSaved: (v) {
                              cubit.isButtonDisabled(context);
                            },
                            enableActiveFill: true,
                            textStyle: AppTheme.textTheme.displayLarge,
                            pinTheme: PinTheme(
                              fieldHeight: 56.0.h,
                              fieldWidth:
                                  MediaQuery.of(context).size.width.w / 7,
                              selectedFillColor: AppColors.white,
                              inactiveFillColor: AppColors.white,
                              activeFillColor: AppColors.white,
                              selectedColor: AppColors.primary,
                              inactiveColor: AppColors.grey,
                              activeColor: AppColors.primary,
                              errorBorderColor: AppColors.red,
                              disabledColor: AppColors.white,
                              borderRadius: BorderRadius.circular(8.0.r),
                              borderWidth: 1,
                              shape: PinCodeFieldShape.box,
                            ),
                            appContext: context,
                            onChanged: (String value) {
                              cubit.isButtonDisabled(context);
                            },
                          ),
                        ),
                        Constatnts.height40,
                        Constatnts.height8,
                        cubit.isLoading
                            ? const LoadingWidget()
                            : customButton(
                                onTap: cubit.isDisabled
                                    ? null
                                    : () {
                                        cubit.postFBLData(context);
                                      },
                                title: otp_screen.verify.tr(),
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
                                disabledBackgroundColor: AppColors.lightPrimary,
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
