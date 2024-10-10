// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sonan {
  List<DayAndNightSonan> dayAndNightSonan;
  List<TimedSonan> timedSonan;
  List<NotTimedSonan> notTimedSonan;
  Sonan({
    required this.dayAndNightSonan,
    required this.timedSonan,
    required this.notTimedSonan,
  });
}

class DayAndNightSonan {
  String title;
  String desc;
  String link;
  List<DayAndNightSonanSubCat> azkar;
  DayAndNightSonan({
    required this.title,
    required this.desc,
    required this.link,
    required this.azkar,
  });
}

class DayAndNightSonanSubCat {
  String zikr;
  int noOfTimes;
  DayAndNightSonanSubCat({
    required this.zikr,
    required this.noOfTimes,
  });
}

class TimedSonan {
  String title;
  String link;
  List<TimedAndUntimedSub> azkar;
  TimedSonan({
    required this.title,
    required this.link,
    required this.azkar,
  });
}

class NotTimedSonan {
  String title;
  String link;
  List<TimedAndUntimedSub> azkar;
  NotTimedSonan({
    required this.title,
    required this.link,
    required this.azkar,
  });
}

class TimedAndUntimedSub {
  String title;
  String zikr;
  TimedAndUntimedSub({
    required this.title,
    required this.zikr,
  });
}
