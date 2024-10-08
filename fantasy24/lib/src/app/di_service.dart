import 'package:get_it/get_it.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/modules/account_screen/data/data_source/account_screen_remote_data_source.dart';
import 'package:next_match/src/modules/account_screen/data/repositories/account_screen_repository.dart';
import 'package:next_match/src/modules/account_screen/presentation/controller/cubit/account_screen_cubit.dart';
import 'package:next_match/src/modules/ai_team_screen/data/data_source/ai_teams_screen_remote_data_source.dart';
import 'package:next_match/src/modules/ai_team_screen/data/repositories/ai_teams_screen_repository.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/controller/cubit/ai_teams_cubit.dart';
import 'package:next_match/src/modules/auth/forget_password/data/data_source/forget_password_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/forget_password/data/repositories/forget_password_screen_repository.dart';
import 'package:next_match/src/modules/auth/forget_password/presentation/controller/forget_password_cubit.dart';
import 'package:next_match/src/modules/auth/login/data/data_source/login_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/login/data/repositories/login_screen_repository.dart';
import 'package:next_match/src/modules/auth/login/presentation/controller/cubit/login_screen_cubit.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/data_source/verify_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/otp_screen/data/repositories/verify_screen_repository.dart';
import 'package:next_match/src/modules/auth/otp_screen/presentation/controller/otp_screen_cubit.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/data_source/premiere_league_id_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/data/repositories/premiere_league_id_screen_repository.dart';
import 'package:next_match/src/modules/auth/premiere_league_id_sscreen/presentation/controller/premiere_league_id_screen_cubit.dart';
import 'package:next_match/src/modules/auth/reset_password/data/data_source/reset_password_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/reset_password/data/repositories/reset_password_screen_repository.dart';
import 'package:next_match/src/modules/auth/reset_password/presentation/controller/cubit/reset_password_screen_cubit.dart';
import 'package:next_match/src/modules/auth/signup/data/data_source/signup_screen_remote_data_source.dart';
import 'package:next_match/src/modules/auth/signup/data/repositories/signup_screen_repository.dart';
import 'package:next_match/src/modules/auth/signup/presentation/controller/cubit/signup_screen_cubit.dart';
import 'package:next_match/src/modules/choose_lang/presentation/controller/cubit/cubit.dart';
import 'package:next_match/src/modules/home/data/data_source/home_screen_remote_data_source.dart';
import 'package:next_match/src/modules/home/data/repositories/home_screen_repository.dart';
import 'package:next_match/src/modules/home/presentation/controller/cubit/home_screen_cubit.dart';
import 'package:next_match/src/modules/my_team_screen/data/data_source/my_team_screen_remote_data_source.dart';
import 'package:next_match/src/modules/my_team_screen/data/repositories/my_teams_screen_repository.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/controller/cubit/my_team_cubit.dart';
import 'package:next_match/src/modules/predicted_points/data/data_source/prediction_point_screen_remote_data_source.dart';
import 'package:next_match/src/modules/predicted_points/data/repositories/prediction_point_screen_repository.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    // PrefsService
    di.registerLazySingleton(() => PrefsService());
    await di<PrefsService>().init();

    // NetworkService
    di.registerLazySingleton(
      () => NetworkService(
        prefsService: di(),
      ),
    );

    // splashScreen
    // di.registerLazySingleton(
    //   () => AppVersionRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => AppVersionRepository(
    //     appVersionRemoteDataSource: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SplashCubitDartCubit(
    //     appVersionRepository: di(),
    //   ),
    // );

    // signupScreen
    di.registerLazySingleton(
      () => SignupScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => SignupScreenRepository(
        signupRepository: di(),
      ),
    );
    di.registerLazySingleton(
      () => SignupScreenCubit(
        signupScreenRepository: di(),
      ),
    );

    // verifyScreen
    di.registerLazySingleton(
      () => VerifyScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => VerifyScreenRepository(
        verifyScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => OtpScreenCubit(
        verifyScreenRepository: di(),
      ),
    );

    // premiereLeagueIdScreen
    di.registerLazySingleton(
      () => PremiereLeagueIdScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => PremiereLeagueIdScreenRepository(
        premiereLeagueIdScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => PremiereLeagueIdScreenCubit(
        premiereLeagueIdScreenRepository: di(),
      ),
    );

    // loginScreen
    di.registerLazySingleton(
      () => LoginScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => LoginScreenRepository(
        loginScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => LoginScreenCubit(
        loginRepository: di(),
      ),
    );

    // forgetPasswordScreen
    di.registerLazySingleton(
      () => ForgetPasswordScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => ForgetPasswordScreenRepository(
        forgetPasswordScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => ForgetPasswordCubit(
        forgetPasswordScreenRepository: di(),
      ),
    );

    // resetPasswordScreen
    di.registerLazySingleton(
      () => ResetPasswordScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => ResetPasswordScreenRepository(
        resetPasswordRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => ResetPasswordScreenCubit(
        resetPasswordScreenRepository: di(),
      ),
    );
    // HomeScreen
    di.registerLazySingleton(
      () => HomeScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => HomeScreenRepository(
        homeScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => HomeScreenCubit(
        homeScreenRepository: di(),
      ),
    );

    // pointPredictionScreen
    di.registerLazySingleton(
      () => PointPredictionScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => PointPredictionScreenRepository(
        pointPredictionScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => PointPredictionCubit(
        pointPredictionScreenRepository: di(),
      ),
    );

    // AiTeamsScreen
    di.registerLazySingleton(
      () => AITeamsScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => AITeamsScreenRepository(
        aiTeamsScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => AiTeamsCubit(
        aiTeamsScreenRepository: di(),
      ),
    );

    // MyTeamScreen
    di.registerLazySingleton(
      () => MyTeamScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => MyTeamScreenRepository(
        myTeamScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => MyTeamCubit(
        myTeamScreenRepository: di(),
      ),
    );

    // AccountScreen
    di.registerLazySingleton(
      () => AccountScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => AccountScreenRepository(
        accountScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => AccountScreenCubit(
        accountScreenRepository: di(),
      ),
    );

    // changeLanguageScreen
    di.registerLazySingleton(
      () => ChangeLangCubit(),
    );
  }
}
