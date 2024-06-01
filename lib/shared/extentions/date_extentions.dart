import 'package:njangi_hub/shared/extentions/number_extentions.dart';

List<String> daysOfTheWeek = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
List<String> monthsOfTheYear = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

extension FormatMonthDate on DateTime {

  String getMonthOfTheYear(){
    return monthsOfTheYear[month];

  }

  String toMMMMYYYYSting(){
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = monthsOfTheYear[this.month];
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$month/$day/$year";
  }

  String toMMDDYYYYString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = this.month.toNumberWithLeadingZeros(2);
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$month/$day/$year";
  }

  String toDDMMYYYYString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = this.month.toNumberWithLeadingZeros(2);
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$day/$month/$year";
  }

  String toDDMMMYYYYString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = monthsOfTheYear[this.month].substring(0, 3);
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$day-$month-$year";
  }

  String toYYYYMMDDString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = this.month.toNumberWithLeadingZeros(2);
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$year/$month/$day";
  }

  String toMonthDYrString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = monthsOfTheYear[this.month];
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$month $day, $year";
  }

  String toMonDYrString() {
    String year = this.year.toNumberWithLeadingZeros(4);
    String month = monthsOfTheYear[this.month].substring(0, 3);
    String day = this.day.toNumberWithLeadingZeros(2);
    return "$month $day, $year";
  }
}

extension FormatWeekDate on DateTime {
  String toWWWMMMDDString({includeYear = false}){
    String month = monthsOfTheYear[this.month].substring(0, 3);
    String weekDay = daysOfTheWeek[weekday].substring(0, 3);
    String day = this.day.toNumberWithLeadingZeros(2);
    String year = includeYear ? this.year.toNumberWithLeadingZeros(4) : '';
    return "$weekDay, $month $day $year";
  }

  String toWWWWMMMDDString({includeYear = false}){
    String month = monthsOfTheYear[this.month].substring(0, 3);
    String weekDay = daysOfTheWeek[weekday];
    String day = this.day.toNumberWithLeadingZeros(2);
    String year = includeYear ? this.year.toNumberWithLeadingZeros(4) : '';
    return "$weekDay, $month $day $year";
  }

  String toWWWMMMMDDString({includeYear = false}){
    String month = monthsOfTheYear[this.month];
    String weekDay = daysOfTheWeek[weekday].substring(0, 3);
    String day = this.day.toNumberWithLeadingZeros(2);
    String year = includeYear ? this.year.toNumberWithLeadingZeros(4) : '';
    return "$weekDay, $month $day $year";
  }

  String toWWWWMMMMDDString({includeYear = false}){
    String month = monthsOfTheYear[this.month];
    String weekDay = daysOfTheWeek[weekday];
    String day = this.day.toNumberWithLeadingZeros(2);
    String year = includeYear ? this.year.toNumberWithLeadingZeros(4) : '';
    return "$weekDay, $month $day $year";
  }
}

extension FormatOnDayTime on DateTime {
  String getDayOfTheWeek(){
    return daysOfTheWeek[weekday];
  }

  String toHHMMSSMMString({includeDayPeriod = false}){
    String hour = this.hour.toNumberWithLeadingZeros(2);
    String minute = this.minute.toNumberWithLeadingZeros(2);
    String second = this.second.toNumberWithLeadingZeros(2);
    String milli = millisecond.toNumberWithLeadingZeros(2);
    String period = amOrPM();
    return '$hour:$minute:$second:$milli $period';
  }

  String toHHMMSString({includeDayPeriod = false}){
    String hour = this.hour.toNumberWithLeadingZeros(2);
    String minute = this.minute.toNumberWithLeadingZeros(2);
    String second = this.second.toNumberWithLeadingZeros(2);
    String period = amOrPM();
    return '$hour:$minute:$second $period';
  }

  String toHHMMString({includeDayPeriod = false}){
    String hour = this.hour.toNumberWithLeadingZeros(2);
    String minute = this.minute.toNumberWithLeadingZeros(2);
    String period = amOrPM();
    return '$hour:$minute $period';
  }
}

extension OtherFunctions on DateTime {
  String amOrPM(){
    return hour < 12 ? 'AM' : 'PM';
  }
}