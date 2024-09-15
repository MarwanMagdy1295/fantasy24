// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:next_match/src/modules/home/presentation/controller/cubit/home_screen_cubit.dart';

// class BottomNavBar extends StatelessWidget {
//   BottomNavBar({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => HomeScreenCubit(),
//       child: Builder(
//         builder: (context) {
//           final cubit = context.watch<HomeScreenCubit>();
//           return Container(
//             height: 75.0,
//             width: double.infinity,
//             color: kSpecialHomeIcons,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () async {
//                       cubit.bottomNavBarChangeIndex(0);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 5.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(15),
//                           bottomLeft: Radius.circular(15),
//                         ),
//                         color: cubit.bottomNavBarIndex == 0
//                             ? kWhiteColor
//                             : kSpecialHomeIcons,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: 10,
//                             width: MediaQuery.sizeOf(context).width * .3,
//                             margin: EdgeInsets.only(bottom: 5.0),
//                             decoration: BoxDecoration(
//                               color: kBlueColor,
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8),
//                                 bottomRight: Radius.circular(8),
//                               ),
//                             ),
//                           ),
//                           customSvg(
//                             name: cubit.bottomNavBarIndex == 0
//                                 ? 'profile1'
//                                 : 'profile',
//                             color: cubit.bottomNavBarIndex == 0
//                                 ? kSpecialHomeIcons
//                                 : Colors.white,
//                           ),
//                           Text(
//                             'Profile'.tr(),
//                             style: TextStyle(
//                               color: cubit.bottomNavBarIndex == 0
//                                   ? kSpecialHomeIcons
//                                   : kWhiteColor,
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () async {
//                       await analytics.logEvent(
//                         name: 'pages_tracked',
//                         parameters: {
//                           'page_name': 'Home',
//                           'page_index': 1,
//                         },
//                       );
//                       cubit.bottomNavBarChangeIndex(1);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 5.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(15),
//                           bottomLeft: Radius.circular(15),
//                         ),
//                         color: cubit.bottomNavBarIndex == 1
//                             ? kWhiteColor
//                             : kSpecialHomeIcons,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: 10,
//                             width: MediaQuery.sizeOf(context).width * .3,
//                             margin: EdgeInsets.only(bottom: 5.0),
//                             decoration: BoxDecoration(
//                               color: kBlueColor,
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8),
//                                 bottomRight: Radius.circular(8),
//                               ),
//                             ),
//                           ),
//                           customSvg(
//                             name: cubit.bottomNavBarIndex == 1
//                                 ? 'home-2'
//                                 : 'home_2',
//                             color: cubit.bottomNavBarIndex == 1
//                                 ? kSpecialHomeIcons
//                                 : Colors.white,
//                           ),
//                           Text(
//                             'Home'.tr(),
//                             style: TextStyle(
//                               color: cubit.bottomNavBarIndex == 1
//                                   ? kSpecialHomeIcons
//                                   : kWhiteColor,
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () async {
//                       await analytics.logEvent(
//                         name: 'pages_tracked',
//                         parameters: {
//                           'page_name': 'My Appointments',
//                           'page_index': 2,
//                         },
//                       );
//                       cubit.bottomNavBarChangeIndex(2);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 5.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(15),
//                           bottomLeft: Radius.circular(15),
//                         ),
//                         color: cubit.bottomNavBarIndex == 2
//                             ? kWhiteColor
//                             : kSpecialHomeIcons,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             height: 10,
//                             width: MediaQuery.sizeOf(context).width * .3,
//                             margin: EdgeInsets.only(bottom: 5.0),
//                             decoration: BoxDecoration(
//                               color: kBlueColor,
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8),
//                                 bottomRight: Radius.circular(8),
//                               ),
//                             ),
//                           ),
//                           customSvg(
//                             name: cubit.bottomNavBarIndex == 2
//                                 ? 'calendar-tick'
//                                 : 'calendarTick',
//                             color: cubit.bottomNavBarIndex == 2
//                                 ? kSpecialHomeIcons
//                                 : Colors.white,
//                           ),
//                           Text(
//                             'My Appointments'.tr(),
//                             style: TextStyle(
//                               color: cubit.bottomNavBarIndex == 2
//                                   ? kSpecialHomeIcons
//                                   : kWhiteColor,
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
