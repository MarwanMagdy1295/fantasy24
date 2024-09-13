import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/modules/auth/login/data/model/login_model.dart';
import 'package:next_match/src/modules/auth/login/data/repositories/login_screen_repository.dart';
import 'package:next_match/src/modules/auth/login/presentation/controller/cubit/login_screen_state.dart';
import 'package:next_match/src/modules/main_screen/presentation/ui/main_screen.dart';
import 'package:next_match/widget/custom_toast.dart';

class LoginScreenCubit extends BaseCubit<LoginScreenState>
    with
        AdaptiveCubit<LoginScreenState>,
        ResetLazySingleton<LoginScreenCubit, LoginScreenState> {
  final LoginScreenRepository _loginScreenRepository;
  LoginScreenCubit({required LoginScreenRepository loginRepository})
      : _loginScreenRepository = loginRepository,
        super(LoginScreenInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isHide = true;
  final formKey = GlobalKey<FormState>();

  hidePassword() {
    emit(LoginScreenHidePasswordState());
    isHide = !isHide;
    emit(LoginScreenHidePasswordState());
  }

  Future<void> postLoginData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoginModel? res;
      isLoading = true;
      emit(LoginScreenLoadingState());
      await _loginScreenRepository
          .login(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        res = value;
        di<PrefsService>().user.put(res!.data!.accessToken!);
        isLoading = false;
        emit(LoginScreenLoadingState());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }).catchError((onError) {
        isLoading = false;
        emit(LoginScreenLoadingState());
        log('login error=>  $onError');
        if (onError is SingleMessageResponseErrorModel) {
          customToast(onError.message ?? '');
        }
      });
    }
  }
}
