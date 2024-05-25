import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatToHuman {
    return DateFormat('d MMMM yyyy', 'fr').format(this);
  }
}
