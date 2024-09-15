import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_match/src/app/app_layout.dart';
import 'package:next_match/src/app/di_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await DiService.init();
  runApp(
    const AppLayout(),
  );
}
