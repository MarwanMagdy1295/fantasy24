import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/assets/assets.gen.dart';
import 'package:next_match/src/core/utils/constants.dart';
import 'package:next_match/src/modules/my_team_screen/presentation/components/player_cart.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Constatnts.height16,
              Stack(
                children: [
                  Assets.images.playground.svg(fit: BoxFit.fill),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PlayerCard(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerCard(),
                            PlayerCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                child: Row(
                  children: [
                    Text(
                      'Substitutes',
                      style: AppTheme.textTheme.displayMedium?.copyWith(),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 14.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                    PlayerCard(
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                  ],
                ),
              ),
              Constatnts.height16,
            ],
          ),
        ),
      ),
    );
  }
}
