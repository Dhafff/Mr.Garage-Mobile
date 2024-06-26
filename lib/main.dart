import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mr_garage/utils/theme/theme.dart';
import 'package:mr_garage/view/auth/auth_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'features/model/cart.dart';
import 'firebase_options.dart';
import 'utils/global.colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'mr-garage_channel_group',
        channelKey: 'mr-garage_channel',
        channelName: 'Notifikasi Mr.Garage',
        channelDescription: 'Notifikasi untuk Mr.Garage',
        channelShowBadge: true,
        ledColor: Colors.blue,
        importance: NotificationImportance.Max,
        criticalAlerts: true,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'mr-garage_channel_group', channelGroupName: 'Mr.Garage group')
    ],
  );
  bool isAllowedToSendNotification = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
              ),
            ),
          );
        }

        if (snapshot.hasData) {
          final user = snapshot.data!;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => CartProvider(user.uid)),
            ],
            child: MaterialApp(
              themeMode: ThemeMode.system,
              theme: AppTheme.systemTheme,
              debugShowCheckedModeBanner: false,
              home: const AuthPage(),
            ),
          );
        } else {
          return MaterialApp(
            themeMode: ThemeMode.system,
            theme: AppTheme.systemTheme,
            debugShowCheckedModeBanner: false,
            home: const AuthPage(),
          );
        }
      },
    );
  }
}
