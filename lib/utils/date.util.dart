import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

const months = [
  'None',
  'Jan',
  'Feb',
  'March',
  'April',
  'May',
  'June',
  'July',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

String convertDateToString(DateTime date) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(date);
}

DateTime convertStringToDate(String dateString) {
  return DateFormat('dd-MM-yyyy').parse(dateString);
}

Tuple2<String, String> convertDateTimeToString(DateTime inputDate) {
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy#Hm');
  String dateTime = dateFormatter.format(inputDate);
  List<String> temp = dateTime.split('#');

  return Tuple2(temp[0], temp[1]);
}
