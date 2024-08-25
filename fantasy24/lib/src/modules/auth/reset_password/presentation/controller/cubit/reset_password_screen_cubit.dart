import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:next_match/src/modules/auth/reset_password/data/repositories/reset_password_screen_repository.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/controller/cubit/reset_password_screen_state.dart';
import 'package:next_match/src/modules/auth/signup/data/model/sign_up_model.dart';

class ResetPasswordScreenCubit extends BaseCubit<ResetPasswordScreenState>
    with
        AdaptiveCubit<ResetPasswordScreenState>,
        ResetLazySingleton<ResetPasswordScreenCubit, ResetPasswordScreenState> {
  final ResetPasswordScreenRepository _resetPasswordScreenRepository;
  ResetPasswordScreenCubit(
      {required ResetPasswordScreenRepository resetPasswordScreenRepository})
      : _resetPasswordScreenRepository = resetPasswordScreenRepository,
        super(ResetPasswordScreenInitial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool isLoading = false;
  bool isHide = true;
  bool isHideReapetPassword = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(ResetPasswordScreenHidePassword());
    isHide = !isHide;
    emit(ResetPasswordScreenHidePassword());
  }

  hideReapetPassword() {
    emit(ResetPasswordScreenHidePassword());
    isHideReapetPassword = !isHideReapetPassword;
    emit(ResetPasswordScreenHidePassword());
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    if (formKey.currentState!.validate()) {
      SignupModel? res;
      isLoading = true;
      emit(ResetPasswordScreenLoading());
      await _resetPasswordScreenRepository
          .resetPassword(
        email: email,
        password: passwordController.text,
      )
          .then((value) {
        res = value;
        // di<PrefsService>().user.put(res!.data!.accessToken!);
        isLoading = false;
        emit(ResetPasswordScreenLoading());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }).catchError((onError) {
        isLoading = false;
        emit(ResetPasswordScreenLoading());
        log('signup error=>  $onError');
      });
    }
  }
}
