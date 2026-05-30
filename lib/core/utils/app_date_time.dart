import 'package:intl/intl.dart';

class AppDateTime {
  static String _safeFormat(
    DateTime dateTime, {
    required String pattern,
    String locale = 'en',
  }) {
    final String normalizedLocale = locale == 'en' ? 'en_US' : locale;

    try {
      return DateFormat(pattern, normalizedLocale).format(dateTime);
    } on Exception {
      // Fall back to default locale formatting to avoid runtime crashes.
      return DateFormat(pattern).format(dateTime);
    }
  }

  static String formatDateTime(
    DateTime dateTime, {
    String pattern = "yyyy-MM-dd HH:mm a",
    String locale = "en",
  }) {
    return _safeFormat(dateTime, pattern: pattern, locale: locale);
  }

  static String utcToLocalTime(String timestamp) {
    final dateTime = DateTime.parse(timestamp);

    final localTime = dateTime.toUtc().toLocal();

    return _safeFormat(localTime, pattern: "yyyy-MM-dd HH:mm a", locale: 'en');
  }

  static String utcToLocalDateOnly(String timestamp) {
    final dateTime = DateTime.parse(timestamp);

    final localTime = dateTime.toUtc().toLocal();

    return _safeFormat(localTime, pattern: "yyyy-MM-dd", locale: 'en');
  }

  static String timestampToFormatted(String timestamp) {
    return _safeFormat(
      DateTime.parse(timestamp),
      pattern: "yyyy-MM-dd HH:mm a",
      locale: 'en',
    );
  }

  static String formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigitMinutes = '${duration.inMinutes.remainder(60)}'.padLeft(
      2,
      '0',
    );
    String twoDigitSeconds = '${duration.inSeconds.remainder(60)}'.padLeft(
      2,
      '0',
    );
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}