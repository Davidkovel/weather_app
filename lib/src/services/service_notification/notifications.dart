import 'package:awesome_notifications/awesome_notifications.dart';

void initializeNotifications() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'rain_channel',
        channelName: 'Rainy notification',
        channelDescription: 'In the next hour it will rain')
    ],
    debug: true
  );
}

void RainyNotification() {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'rain_channel',
      title: 'Rainy Notification')
  );
}

void checkNotificationPermission() {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
