import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/ui/otp_screen.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';
import 'package:next_match/src/modules/auth/signup/data/repositories/signup_screen_repository.dart';
import 'package:next_match/src/modules/auth/signup/presentation/controller/cubit/signup_screen_state.dart';
import 'package:next_match/widget/custom_toast.dart';

class SignupScreenCubit extends BaseCubit<SignupScreenState>
    with
        AdaptiveCubit<SignupScreenState>,
        ResetLazySingleton<SignupScreenCubit, SignupScreenState> {
  final SignupScreenRepository _signupScreenRepository;
  SignupScreenCubit({required SignupScreenRepository signupScreenRepository})
      : _signupScreenRepository = signupScreenRepository,
        super(SignupScreenInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool isLoading = false;
  bool isHide = true;
  bool isHideReapetPassword = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(SignupScreenHidePasswordState());
    isHide = !isHide;
    emit(SignupScreenHidePasswordState());
  }

  hideReapetPassword() {
    emit(SignupScreenHidePasswordState());
    isHideReapetPassword = !isHideReapetPassword;
    emit(SignupScreenHidePasswordState());
  }

  Future<void> postSignupData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      SignupModel? res;
      isLoading = true;
      emit(SignupScreenLoading());
      await _signupScreenRepository
          .signup(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        res = value;
        di<PrefsService>().user.put(res!.data!.accessToken!);
        isLoading = false;
        emit(SignupScreenLoading());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpScreen(
              fromSignup: true,
            ),
          ),
        );
      }).catchError((onError) {
        isLoading = false;
        emit(SignupScreenLoading());
        log('signup error=>  $onError');
        if (onError is SingleMessageResponseErrorModel) {
          customToast(onError.message ?? '');
        }
      });
    }
  }
}
