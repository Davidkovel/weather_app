import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void initializeNotifications() {
  AwesomeNotifications().initialize(

    'resource://drawable/main',
    [
      NotificationChannel(
        channelKey: 'rain_channel',
        channelName: 'Rainy notification',
        channelDescription: 'In the next hour it will rain')
    ],
    debug: true
  );
}

void PickMoreTime() {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'rain_channel',
      title: 'Rainy Notification',
      body: 'Час менший за поточний. Виберіть більше часу!!'
      //icon: 'assets/images/30b11a92a85361de088b6d668785f0aa.jpg',
      )
  );
}

void RainyNotification() {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'rain_channel',
      title: 'Rainy Notification',
      body: 'Зараз йде дощ!!'
      //icon: 'assets/images/30b11a92a85361de088b6d668785f0aa.jpg',
      )
  );
}

void TimeIsEnd() {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'rain_channel',
      title: 'Rainy Notification',
      body: 'За цей час не було дощу. Виберiть iнший час'
      //icon: 'assets/images/30b11a92a85361de088b6d668785f0aa.jpg',
      )
  );
}



void checkNotificationPermission() {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
