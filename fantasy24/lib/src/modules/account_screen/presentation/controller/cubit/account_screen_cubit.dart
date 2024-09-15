import 'dart:developer';

import 'package:next_match/src/core/api/error_handler.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/account_screen/data/model/user_model.dart';
import 'package:next_match/src/modules/account_screen/data/repositories/account_screen_repository.dart';
import 'package:next_match/src/modules/account_screen/presentation/controller/cubit/account_screen_state.dart';
import 'package:next_match/widget/custom_toast.dart';

class AccountScreenCubit extends BaseCubit<AccountScreenState>
    with
        AdaptiveCubit<AccountScreenState>,
        ResetLazySingleton<AccountScreenCubit, AccountScreenState> {
  final AccountScreenRepository _accountScreenRepository;
  AccountScreenCubit({required AccountScreenRepository accountScreenRepository})
      : _accountScreenRepository = accountScreenRepository,
        super(AccountScreenInitial());

  bool isLoading = false;
  UserData? user;

  Future<void> getUserData() async {
    isLoading = true;
    emit(AccountScreenLoading());
    await _accountScreenRepository.getUserData().then((value) {
      UserModel res = value!;
      user = res.data;
      isLoading = false;
      emit(AccountScreenLoading());
    }).catchError((onError) {
      isLoading = false;
      emit(AccountScreenLoading());
      log('login error=>  $onError');
      if (onError is SingleMessageResponseErrorModel) {
        customToast(onError.message ?? '');
      }
    });
  }

  void refresh() {
    emit(AccountScreenLoading());
  }
}
