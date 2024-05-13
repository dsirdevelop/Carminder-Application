import 'package:flutter/material.dart';

class Reminder {
  final String serviceType;
  final DateTime date;
  final TimeOfDay time;
  final String vehicleMake;
  final String vehicleModel;
  final String vehicleYear;

  Reminder({
    required this.serviceType,
    required this.date,
    required this.time,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.vehicleYear,
  });

  String get formattedDateTime {
    // Format date
    String formattedDate =
        '${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}';

    // Format time
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    String formattedTime = '${_twoDigits(hour)}:${_twoDigits(time.minute)} $period';

    return '$formattedDate, $formattedTime';
  }

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
