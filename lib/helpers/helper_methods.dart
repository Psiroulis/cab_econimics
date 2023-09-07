class HelperMethods {
  static String currentMonthAsString(DateTime dateTime) {
    final int currentMonth = dateTime.month;

    switch (currentMonth) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  static String currentDayOfWeekAsString(DateTime dateTime) {
    final int dayOfWeek = dateTime.weekday;

    switch(dayOfWeek) {
      case 1 :
        return 'Monday';
      case 2 :
        return 'Tuesday';
      case 3 :
        return 'Wednesday';
      case 4 :
        return 'Thursday';
      case 5 :
        return 'Friday';
      case 6 :
        return 'Saturday';
      case 7 :
        return 'Sunday';
      default:
        return '';
    }
  }
}