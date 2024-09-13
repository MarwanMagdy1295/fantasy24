import 'package:easy_localization/easy_localization.dart';
import 'package:next_match/src/core/base_cubit/base_cubit.dart';
import 'package:next_match/src/modules/home/presentation/controller/cubit/home_screen_state.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class HomeScreenCubit extends BaseCubit<HomeScreenState>
    with
        AdaptiveCubit<HomeScreenState>,
        ResetLazySingleton<HomeScreenCubit, HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  String screenTitle = home_screen.home_screen_title.tr();
}
