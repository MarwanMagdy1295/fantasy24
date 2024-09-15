import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/account_screen/presentation/ui/account_screen.dart';
import 'package:next_match/src/modules/home/presentation/ui/home_screen.dart';
import 'package:next_match/src/modules/my_team_screen/data/model/my_team_model.dart';
import 'package:next_match/src/core/utils/assets/translations/keys.dart';

class MainScreen extends StatefulWidget {
  final MyTeamModel? myTeamModel;
  const MainScreen({
    super.key,
    this.myTeamModel,
  });
  // static List<NavigationDestination> navigation = <NavigationDestination>[
  //   NavigationDestination(
  //     selectedIcon: const Icon(
  //       Icons.cottage_outlined,
  //       color: AppColors.paragraph,
  //     ),
  //     icon: const Icon(
  //       Icons.cottage_outlined,
  //       color: AppColors.paragraph,
  //     ),
  //     label: home_screen.home_screen_title_nav_bar.tr(),
  //   ),
  //   // NavigationDestination(
  //   //   selectedIcon: Icon(
  //   //     Icons.art_track_outlined,
  //   //     color: AppColors.paragraph,
  //   //   ),
  //   //   icon: Icon(
  //   //     Icons.art_track_outlined,
  //   //     color: AppColors.paragraph,
  //   //   ),
  //   //   label: 'Resources',
  //   // ),
  //   // NavigationDestination(
  //   //   selectedIcon: Icon(
  //   //     Icons.home_repair_service_outlined,
  //   //     color: AppColors.paragraph,
  //   //   ),
  //   //   icon: Icon(
  //   //     Icons.home_repair_service_outlined,
  //   //     color: AppColors.paragraph,
  //   //   ),
  //   //   label: 'Toolbox',
  //   // ),
  //   NavigationDestination(
  //     selectedIcon: const Icon(
  //       Icons.account_circle_outlined,
  //       color: AppColors.paragraph,
  //     ),
  //     icon: const Icon(
  //       Icons.account_circle_outlined,
  //       color: AppColors.paragraph,
  //     ),
  //     label: account_screen.account_screen_title.tr(),
  //   ),
  // ];
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final page = [
      HomeScreen(
        myTeamModel: widget.myTeamModel,
      ),
      const AccountScreen(),
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      body: page[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.selected)
                      ? AppTheme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.schemeBlack,
                        )
                      : AppTheme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.paragraph,
                        )),
        ),
        child: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: currentIndex,
          height: 60.0.h,
          elevation: 0,
          backgroundColor: AppColors.background,
          indicatorColor: AppColors.schemeSecondary,
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.cottage_outlined,
                color: AppColors.paragraph,
              ),
              icon: const Icon(
                Icons.cottage_outlined,
                color: AppColors.paragraph,
              ),
              label: home_screen.home_screen_title_nav_bar.tr(),
            ),
            // NavigationDestination(
            //   selectedIcon: Icon(
            //     Icons.art_track_outlined,
            //     color: AppColors.paragraph,
            //   ),
            //   icon: Icon(
            //     Icons.art_track_outlined,
            //     color: AppColors.paragraph,
            //   ),
            //   label: 'Resources',
            // ),
            // NavigationDestination(
            //   selectedIcon: Icon(
            //     Icons.home_repair_service_outlined,
            //     color: AppColors.paragraph,
            //   ),
            //   icon: Icon(
            //     Icons.home_repair_service_outlined,
            //     color: AppColors.paragraph,
            //   ),
            //   label: 'Toolbox',
            // ),
            NavigationDestination(
              selectedIcon: const Icon(
                Icons.account_circle_outlined,
                color: AppColors.paragraph,
              ),
              icon: const Icon(
                Icons.account_circle_outlined,
                color: AppColors.paragraph,
              ),
              label: account_screen.account_screen_title.tr(),
            ),
          ],
          //MainScreen.navigation,
        ),
      ),
    );
  }
}
