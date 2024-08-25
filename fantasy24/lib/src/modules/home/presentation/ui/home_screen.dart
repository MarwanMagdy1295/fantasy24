import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/ai_team_screen/presentation/ui/ai_team_screen.dart';
import 'package:next_match/src/modules/ai_transfer_screen/presentation/ui/ai_transfer.dart';
import 'package:next_match/src/modules/home/presentation/controller/cubit/home_screen_cubit.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/ui/my_team_screen.dart';
import 'package:next_match/src/modules/predicted_points/presentation/ui/points_prediction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => HomeScreenCubit(),
          lazy: true,
          child: Builder(builder: (context) {
            final cubit = context.watch<HomeScreenCubit>();
            return
                //  NestedScrollView(
                //   physics: const NeverScrollableScrollPhysics(),
                //   headerSliverBuilder:
                //       (BuildContext context, bool innerBoxIsScrolled) {
                //     return <Widget>[
                //       SliverToBoxAdapter(
                //         child: ListTile(
                //           contentPadding: EdgeInsets.only(
                //             left: 16.0.w,
                //             right: 16.0.w,
                //             top: 16.0.h,
                //           ),
                //           // leading: const Icon(
                //           //   Icons.arrow_back,
                //           //   color: AppColors.appBlack,
                //           // ),
                //           title: Text(
                //             cubit.screenTitle,
                //             style: AppTheme.textTheme.headlineMedium?.copyWith(
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //           trailing: const Icon(
                //             Icons.notifications_none_outlined,
                //             color: AppColors.appBlack,
                //           ),
                //         ),
                //       ),
                //     ];
                //   },
                //   body:
                Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 16.0.w,
                    right: 16.0.w,
                    top: 16.0.h,
                  ),
                  // leading: const Icon(
                  //   Icons.arrow_back,
                  //   color: AppColors.appBlack,
                  // ),
                  title: Text(
                    cubit.screenTitle,
                    style: AppTheme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.appBlack,
                  ),
                ),
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: AppColors.transparent,
                  dividerColor: AppColors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0.r),
                    color: AppColors.appBlack,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  indicatorPadding: EdgeInsets.symmetric(vertical: 4.0.h),
                  overlayColor:
                      const MaterialStatePropertyAll(AppColors.transparent),
                  unselectedLabelColor: AppColors.appBlack,
                  labelStyle: AppTheme.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(
                      icon: Text(
                        'My Team',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Points predictions',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'AI Team',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'AI Transfare',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      MyTeamScreen(),
                      PointsPredection(),
                      AiTeamScreen(),
                      AiTransfer(),
                    ],
                  ),
                ),
              ],
              // ),
            );
          }),
        ),
      ),
    );
  }
}
