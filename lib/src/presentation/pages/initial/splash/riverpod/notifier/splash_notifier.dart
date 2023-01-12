import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../state/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsRepository _settingsRepository;
  final UserRepository _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

  Future<void> getActiveLanguages(
    BuildContext context, {
    VoidCallback? goMain,
    VoidCallback? goLogin,
    VoidCallback? goToAddAddress,
    VoidCallback? goToSelectLang,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      if (LocalStorage.instance.getToken().isNotEmpty) {
        String? token;
        try {
          token = await FirebaseMessaging.instance.getToken();
        } catch (e) {
          debugPrint('===> error with getting firebase token');
        }
        _userRepository.updateFirebaseToken(token);
      }
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          debugPrint('===> new firebase notification: ${message.data}');
          debugPrint(
              '===> new firebase notification: ${message.notification?.title}');
          debugPrint(
              '===> new firebase notification: ${message.notification?.body}');
          debugPrint('===> new firebase notification: ${message.toString()}');
          final RemoteNotification? notification = message.notification;
          final AndroidNotification? android = message.notification?.android;
          if (notification != null && android != null) {
            const AndroidNotificationChannel channel =
                AndroidNotificationChannel(
              'CHANNEL_ID',
              'CHANNEL_TITLE',
              description: 'CHANNEL_DESCRIPTION',
              importance: Importance.high,
              playSound: true,
            );
            final FlutterLocalNotificationsPlugin
                flutterLocalNotificationsPlugin =
                FlutterLocalNotificationsPlugin();
            flutterLocalNotificationsPlugin.initialize(
              const InitializationSettings(
                android: AndroidInitializationSettings('@mipmap/ic_launcher'),
              ),
            );
            flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  color: Colors.blue,
                  playSound: true,
                ),
              ),
            );
          }
        },
      );
      final response = await _settingsRepository.getGlobalSettings();
      response.when(
        success: (data) {
          LocalStorage.instance.setSettingsList(data.data ?? []);
          LocalStorage.instance.setSettingsFetched(true);
        },
        failure: (failure) {
          debugPrint('==> error with settings fetched');
        },
      );
      final storage = LocalStorage.instance;
      if (storage.getLangSelected()) {
        if (storage.getToken().isEmpty) {
          if (storage.getIsGuest()) {
            if (storage.getAddressSelected()) {
              goMain?.call();
            } else {
              goToAddAddress?.call();
            }
          } else {
            goLogin?.call();
          }
        } else {
          if (storage.getAddressSelected()) {
            goMain?.call();
          } else {
            goToAddAddress?.call();
          }
        }
      } else {
        goToSelectLang?.call();
      }
    } else {
      if (!mounted) return;
      context.replaceRoute(const NoConnectionRoute());
    }
  }

  Future<void> getTranslations(BuildContext context) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      final response = await _settingsRepository.getMobileTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
        },
        failure: (failure) {
          debugPrint('==> error with fetching translations $failure');
        },
      );
    } else {
      if (!mounted) return;
      context.replaceRoute(const NoConnectionRoute());
    }
  }
}
