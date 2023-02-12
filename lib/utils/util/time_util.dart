import 'package:intl/intl.dart';

const String DATE_FORMAT_1 = "yyyy-MM-dd";
const String DATE_FORMAT_2 = "yyyy-MM-dd HH:mm";
const String DATE_FORMAT_3 = "yyyy-MM-dd HH:mm:ss";
const String DATE_FORMAT_4 = "dd/MM/yyyy";
const String DATE_FORMAT_5 = "HH:mm dd/MM/yyyy";
const String DATE_FORMAT_6 = "HH:mm";
const String DATE_FORMAT_7 = "MM/dd";
const String DATE_FORMAT_8 = "dd-MM-yyyy";
const String DATE_FORMAT_9 = "MM/yyyy";
const String DATE_FORMAT_10 = "HH:mm:ss";

const String DATE_FORMAT_20 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
const String DATE_FORMAT_21 = "E, dd MMM yyyy HH:mm:ss z";
const String DATE_FORMAT_22 = "yyyy.MM.dd G 'at' HH:mm:ss z";
const String DATE_FORMAT_23 = "yyyyy.MMMMM.dd GGG hh:mm aaa";
const String DATE_FORMAT_24 = "EEE, d MMM yyyy HH:mm:ss Z";
const String DATE_FORMAT_25 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

// DateFormat(DATE_FORMAT_1).format(DateTime.parse(birthTed.text))
// DateFormat(DATE_FORMAT_1).format(DateFormat(DATE_FORMAT_4).parse(birthTed.text))

String getHourDayFromSecond(int sec) {
  final hour = (sec / 60);
  if (hour >= 24) {
    return '${hour / 24} Ngày';
  }
  return '${hour} Giờ';
}

String formatServerDate(String? serverDate, [dateFormat]) {
  var time = 'Không có ngày';

  if (serverDate == null || serverDate.isEmpty == true) return time;
  try {
    time = DateFormat(dateFormat ?? DATE_FORMAT_4).format(DateTime.parse(serverDate));
  } on Exception catch (e) {}

  return time;
}

// String getCurrentTime({String dateFormat}) {
//   var now = DateTime.now();
//   return DateFormat(dateFormat).format(now);
// }
//
// String getDateStringFromDateString({String outputDateFormat, String inputDate}) {
//   var dateTime = DateTime.parse(inputDate);
//   return DateFormat(outputDateFormat).format(dateTime);
// }
//
// String getDateStringFromDateTime({String outputDateFormat, String inputDate}) {
//   var dateTime = DateTime.parse(inputDate);
//   return DateFormat(outputDateFormat).format(dateTime);
// }
