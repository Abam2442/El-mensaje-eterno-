import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/doaa_entity.dart';

class DoaaModel extends Doaa {
  DoaaModel({required super.ar, required super.es});

  factory DoaaModel.fromJson(Map<String, dynamic> json) {
    return DoaaModel(
      ar: DoaaLangModel.fromJson(json['ar']),
      es: DoaaLangModel.fromJson(json['es']),
    );
  }
}

class DoaaLangModel extends DoaaLang {
  DoaaLangModel({
    required super.etiquetteOfSupplication,
    required super.eveningRemembranceSupplications,
    required super.incantationsSupplications,
    required super.morningRemembranceSupplications,
    required super.praisesAllahAlmighty,
    required super.prayingSupplications,
    required super.propheticSupplications,
    required super.quranicSupplications,
    required super.thingsThatProphetSoughtRefugeWithAllah,
  });

  factory DoaaLangModel.fromJson(Map<String, dynamic> json) {
    return DoaaLangModel(
      etiquetteOfSupplication:
          (json['Etiquette of Supplication.json'] as List<dynamic>)
              .map((item) => EtiquetteOfSupplicationModel.fromJson(item))
              .toList(),
      eveningRemembranceSupplications:
          (json['Evening remembrance supplications.json'] as List<dynamic>)
              .map(
                  (item) => EveningRemembranceSupplicationsModel.fromJson(item))
              .toList(),
      incantationsSupplications:
          (json['Incantations supplications.json'] as List<dynamic>)
              .map((item) => IncantationsSupplicationsModel.fromJson(item))
              .toList(),
      morningRemembranceSupplications:
          (json['Morning remembrance supplications.json'] as List<dynamic>)
              .map(
                  (item) => MorningRemembranceSupplicationsModel.fromJson(item))
              .toList(),
      praisesAllahAlmighty:
          (json['Praises Allah Almighty.json'] as List<dynamic>)
              .map((item) => PraisesAllahAlmightyModel.fromJson(item))
              .toList(),
      prayingSupplications:
          (json['Praying Supplications.json'] as List<dynamic>)
              .map((item) => PrayingSupplicationsModel.fromJson(item))
              .toList(),
      propheticSupplications:
          (json['Prophetic supplications.json'] as List<dynamic>)
              .map((item) => PropheticSupplicationsModel.fromJson(item))
              .toList(),
      quranicSupplications:
          (json['Quranic Supplications.json'] as List<dynamic>)
              .map((item) => QuranicSupplicationsModel.fromJson(item))
              .toList(),
      thingsThatProphetSoughtRefugeWithAllah:
          (json['Things that Prophet sought refuge [with Allah] from.json']
                  as List<dynamic>)
              .map((item) =>
                  ThingsThatProphetSoughtRefugeWithAllahModel.fromJson(item))
              .toList(),
    );
  }
}

class EtiquetteOfSupplicationModel extends EtiquetteOfSupplication {
  EtiquetteOfSupplicationModel({
    required super.pageNumber,
    required super.content,
  });

  factory EtiquetteOfSupplicationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return EtiquetteOfSupplicationModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class EveningRemembranceSupplicationsModel
    extends EveningRemembranceSupplications {
  EveningRemembranceSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory EveningRemembranceSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return EveningRemembranceSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class IncantationsSupplicationsModel extends IncantationsSupplications {
  IncantationsSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory IncantationsSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return IncantationsSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class MorningRemembranceSupplicationsModel
    extends MorningRemembranceSupplications {
  MorningRemembranceSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory MorningRemembranceSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MorningRemembranceSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class PraisesAllahAlmightyModel extends PraisesAllahAlmighty {
  PraisesAllahAlmightyModel({
    required super.pageNumber,
    required super.content,
  });

  factory PraisesAllahAlmightyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PraisesAllahAlmightyModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class PrayingSupplicationsModel extends PrayingSupplications {
  PrayingSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory PrayingSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PrayingSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class PropheticSupplicationsModel extends PropheticSupplications {
  PropheticSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory PropheticSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PropheticSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class QuranicSupplicationsModel extends QuranicSupplications {
  QuranicSupplicationsModel({
    required super.pageNumber,
    required super.content,
  });

  factory QuranicSupplicationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuranicSupplicationsModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}

class ThingsThatProphetSoughtRefugeWithAllahModel extends ThingsThatProphetSoughtRefugeWithAllah {
  ThingsThatProphetSoughtRefugeWithAllahModel({
    required super.pageNumber,
    required super.content,
  });

  factory ThingsThatProphetSoughtRefugeWithAllahModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ThingsThatProphetSoughtRefugeWithAllahModel(
      pageNumber: json['page_number'],
      content: (json['content'] as List<dynamic>).cast<String>(),
    );
  }
}
