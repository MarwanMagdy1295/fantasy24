// import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/app/di_service.dart';
import 'package:next_match/src/core/services/prefs_service.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
// import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/account_screen/presentation/controller/cubit/account_screen_cubit.dart';
import 'package:next_match/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:next_match/src/modules/choose_lang/presentation/ui/view.dart';
import 'package:next_match/widget/loading_widget.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AccountScreenCubit(accountScreenRepository: di())..getUserData(),
      lazy: true,
      child: Builder(
        builder: (context) {
          final cubit = context.watch<AccountScreenCubit>();
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              title: Text(
                account_screen.account_screen_title.tr(),
                style: AppTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.background,
            ),
            body: Container(
              margin: EdgeInsets.all(16.0.w),
              child: cubit.isLoading
                  ? const Center(child: LoadingWidget())
                  : Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          // leading: ClipRRect(
                          //   borderRadius: BorderRadius.circular(42.0),
                          //   child: CachedNetworkImage(
                          //     imageUrl: cubit.user!.profileImageUrl ?? '',
                          //     imageBuilder: (context, imageProvider) => Container(
                          //       decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //           image: imageProvider,
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //     ),
                          //     placeholder: (context, url) => const SizedBox(
                          //       height: 46.0,
                          //       width: 46.0,
                          //       child: Center(
                          //         child: CircularProgressIndicator(
                          //           color: AppColors.primary,
                          //         ),
                          //       ),
                          //     ),
                          //     errorWidget: (context, url, error) =>
                          //         Assets.images.avatarImage.image(
                          //       height: 46.0,
                          //       width: 46.0,
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                          title: Text(
                            cubit.user?.email ?? '',
                            style: AppTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.paragraph,
                            ),
                          ),
                          // trailing: const Icon(Icons.border_color),
                        ),
                        Constatnts.height60,
                        ListTile(
                          onTap: () async {
                            final value = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChooseLanguage(),
                              ),
                            );
                            cubit.refresh();
                          },
                          leading: Text(
                            account_screen.language.tr(),
                            style: AppTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            di<PrefsService>().locale.get() == 'en'
                                ? 'English'
                                : 'العربية',
                            style: AppTheme.textTheme.titleLarge?.copyWith(
                              color: AppColors.paragraph,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            account_screen.delete_account.tr(),
                            style: AppTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        ListTile(
                          onTap: () {
                            di<PrefsService>().user.delete();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                (route) => false);
                          },
                          leading: const Icon(Icons.logout_sharp),
                          title: Text(
                            account_screen.signout.tr(),
                            style: AppTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Constatnts.height30,
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
