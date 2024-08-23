class IslamMessageArticalEntities {
  final String name;
  final List<SubArticalEntities> subCatigory;

  const IslamMessageArticalEntities({
    required this.name,
    required this.subCatigory,
  });
}

class SubArticalEntities {
  final String subArticalName;
  final String bodyArtical;

  const SubArticalEntities({
    required this.subArticalName,
    required this.bodyArtical,
  });
}

class IslamMessageBookEntities {
  final String name;
  final List<SubBookEntities> subCatigory;

  const IslamMessageBookEntities({
    required this.name,
    required this.subCatigory,
  });
}

class SubBookEntities {
  final String subBookName;
  final String bodyBook;

  const SubBookEntities({
    required this.subBookName,
    required this.bodyBook,
  });
}

class IslamMessageAudioEntities { 
  final String name;
  final String link;

  const IslamMessageAudioEntities({
    required this.name,
    required this.link,
  });
}
