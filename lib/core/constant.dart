import 'package:flutter/material.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();
const List<String> month = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
]; 

String dateFormatter(DateTime date) {
  return "${month[date.month - 1]}-${date.day}-${date.year}";
}
