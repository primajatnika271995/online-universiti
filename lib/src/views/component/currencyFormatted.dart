import 'package:intl/intl.dart';

String formattedCoursePrice(nominal) {
  var f = new NumberFormat.currency(locale: 'id_ID', name: 'IDR ', decimalDigits: 0);
  return f.format(nominal);
}
