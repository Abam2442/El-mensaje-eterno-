class Doaa {
  final DoaaLang? ar;
  final DoaaLang? es;

  Doaa({required this.ar, required this.es});
}

class DoaaLang {
  final List<EtiquetteOfSupplication> etiquetteOfSupplication;
  final List<EveningRemembranceSupplications>
      eveningRemembranceSupplications;
  final List<IncantationsSupplications> incantationsSupplications;
  final List<MorningRemembranceSupplications>
      morningRemembranceSupplications;
  final List<PraisesAllahAlmighty> praisesAllahAlmighty;
  final List<PrayingSupplications> prayingSupplications;
  final List<PropheticSupplications> propheticSupplications;
  final List<QuranicSupplications> quranicSupplications;
  final List<ThingsThatProphetSoughtRefugeWithAllah>
      thingsThatProphetSoughtRefugeWithAllah;

  DoaaLang({
    required this.etiquetteOfSupplication,
    required this.eveningRemembranceSupplications,
    required this.incantationsSupplications,
    required this.morningRemembranceSupplications,
    required this.praisesAllahAlmighty,
    required this.prayingSupplications,
    required this.propheticSupplications,
    required this.quranicSupplications,
    required this.thingsThatProphetSoughtRefugeWithAllah,
  });
}

class EtiquetteOfSupplication {
  String pageNumber;
  List<String> content;

  EtiquetteOfSupplication({
    required this.pageNumber,
    required this.content,
  });
}

class EveningRemembranceSupplications {
  String pageNumber;
  List<String> content;

  EveningRemembranceSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class IncantationsSupplications {
  String pageNumber;
  List<String> content;

  IncantationsSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class MorningRemembranceSupplications {
  String pageNumber;
  List<String> content;

  MorningRemembranceSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class PraisesAllahAlmighty {
  String pageNumber;
  List<String> content;

  PraisesAllahAlmighty({
    required this.pageNumber,
    required this.content,
  });
}

class PrayingSupplications {
  String pageNumber;
  List<String> content;

  PrayingSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class PropheticSupplications {
  String pageNumber;
  List<String> content;

  PropheticSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class QuranicSupplications {
  String pageNumber;
  List<String> content;

  QuranicSupplications({
    required this.pageNumber,
    required this.content,
  });
}

class ThingsThatProphetSoughtRefugeWithAllah {
  String pageNumber;
  List<String> content;

  ThingsThatProphetSoughtRefugeWithAllah({
    required this.pageNumber,
    required this.content,
  });
}
