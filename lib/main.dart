import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/routes/app_routes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_bloc.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_event.dart';
import 'package:genuin_task/data/repositories/feed_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('feed_cache');
  await Hive.openBox('community_cache');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? deviceId;

  @override
  void initState() {
    super.initState();
    getDeviceId();
  }

  Future<void> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    final device_id = prefs.getString('device_id');
    if(device_id != null){
      setState(() {
        deviceId = device_id;
      });
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? id;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      id = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      id = iosInfo.identifierForVendor;
    }

    setState(() {
      deviceId = id;
    });

    print("Device ID: $deviceId");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeedBloc(FeedRepository())
                    ..add(FetchFeedData(deviceId ?? "")),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Color.fromARGB(255, 55, 39, 200),
          ),
        ),
      ),
    );
  }
}
