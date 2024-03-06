abstract class TimeUtils {
  static DateTime fromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static int? toTimestamp(DateTime? time) {
    if (time != null) {
      return time.millisecondsSinceEpoch ~/ 1000;
    }

    return null;
  }
}
