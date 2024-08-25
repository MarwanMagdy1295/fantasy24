import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/home/presentation/ui/home_screen.dart';
import 'package:next_match/src/modules/predicted_points/presentation/ui/points_prediction.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const navigation = <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(
        Icons.cottage_outlined,
        color: AppColors.paragraph,
      ),
      icon: Icon(
        Icons.cottage_outlined,
        color: AppColors.paragraph,
      ),
      label: 'Explore',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.art_track_outlined,
        color: AppColors.paragraph,
      ),
      icon: Icon(
        Icons.art_track_outlined,
        color: AppColors.paragraph,
      ),
      label: 'Resources',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.home_repair_service_outlined,
        color: AppColors.paragraph,
      ),
      icon: Icon(
        Icons.home_repair_service_outlined,
        color: AppColors.paragraph,
      ),
      label: 'Toolbox',
    ),
    NavigationDestination(
      selectedIcon: Icon(
        Icons.account_circle_outlined,
        color: AppColors.paragraph,
      ),
      icon: Icon(
        Icons.account_circle_outlined,
        color: AppColors.paragraph,
      ),
      label: 'Account',
    ),
  ];
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final page = [
    const HomeScreen(),
    const PointsPredection(),
    const PointsPredection(),
    const PointsPredection(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          destinations: MainScreen.navigation,
        ),
      ),
    );
  }
}
