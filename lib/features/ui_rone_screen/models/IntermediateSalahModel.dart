/// Rakaa : "Rakaa 1 de 2"
/// StepNumber : "🔵⚫⚫⚫⚫⚫⚫⚫"
/// StepName : "Encarar la qibla y Takbirat al ihram"
/// Images : {"Main":{"Mainimage1":"assets/images/2.png","Mainimage2":"assets/images/3.png"},"image":"assets/images/Takbir_ihram.jpg","image2":"assets/images/Tak2.jpg","image3":"assets/images/Tak3.jpg","image4":"assets/images/Tak4.jpg","Video":"assets/video/Takbir_ihram.mp4","Video2":"assets/video/MH-ihram.mp4","description":"🔖\tTakbirat Al Ihram\n\r\n✒️ Levante ambas manos hasta la altura de las orejas o los hombros y pronuncie el primer Takbir (takbiratul Ihram),  y diga : Al-lahu Akbar \n\n🔳➖Coloque la mano derecha sobre la mano izquierda, y ambas sobre el pecho.\n\r\n🔳➖\tFije su mirada en el lugar en que colocará la frente durante su postración."}
/// topics : [{"transliteration":"Al-lahu Akbar","audio":"assets/audio/Takbir.mp3","Video":"assets/video/Allahuakbar.mp4"}]

class IntermediateSalahModel {
  IntermediateSalahModel({
    String? rakaa,
    String? stepNumber,
    String? stepName,
    Images? images,
    List<Topics>? topics,
  }) {
    _rakaa = rakaa;
    _stepNumber = stepNumber;
    _stepName = stepName;
    _images = images;
    _topics = topics;
  }

  IntermediateSalahModel.fromJson(dynamic json) {
    _rakaa = json['Rakaa'];
    _stepNumber = json['StepNumber'];
    _stepName = json['StepName'];
    _images =
        json['topics'] != null ? Images.fromJson(json['topics'][0]) : null;
    if (json['topics'] != null) {
      _topics = [];
      json['topics'].forEach((v) {
        _topics?.add(Topics.fromJson(v));
      });
    }
  }
  String? _rakaa;
  String? _stepNumber;
  String? _stepName;
  Images? _images;
  List<Topics>? _topics;
  IntermediateSalahModel copyWith({
    String? rakaa,
    String? stepNumber,
    String? stepName,
    Images? images,
    List<Topics>? topics,
  }) =>
      IntermediateSalahModel(
        rakaa: rakaa ?? _rakaa,
        stepNumber: stepNumber ?? _stepNumber,
        stepName: stepName ?? _stepName,
        images: images ?? _images,
        topics: topics ?? _topics,
      );
  String? get rakaa => _rakaa;
  String? get stepNumber => _stepNumber;
  String? get stepName => _stepName;
  Images? get images => _images;
  List<Topics>? get topics => _topics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Rakaa'] = _rakaa;
    map['StepNumber'] = _stepNumber;
    map['StepName'] = _stepName;
    if (_images != null) {
      map['Images'] = _images?.toJson();
    }
    if (_topics != null) {
      map['topics'] = _topics?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// transliteration : "Al-lahu Akbar"
/// audio : "assets/audio/Takbir.mp3"
/// Video : "assets/video/Allahuakbar.mp4"

class Topics {
  Topics({
    String? transliteration,
    String? audio,
    String? video,
  }) {
    _transliteration = transliteration;
    _audio = audio;
    _video = video;
  }

  Topics.fromJson(dynamic json) {
    _transliteration = json['transliteration'];
    _audio = json['audio'];
    _video = json['Video'];
  }
  String? _transliteration;
  String? _audio;
  String? _video;
  Topics copyWith({
    String? transliteration,
    String? audio,
    String? video,
  }) =>
      Topics(
        transliteration: transliteration ?? _transliteration,
        audio: audio ?? _audio,
        video: video ?? _video,
      );
  String? get transliteration => _transliteration;
  String? get audio => _audio;
  String? get video => _video;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transliteration'] = _transliteration;
    map['audio'] = _audio;
    map['Video'] = _video;
    return map;
  }
}

/// Main : {"Mainimage1":"assets/images/2.png","Mainimage2":"assets/images/3.png"}
/// image : "assets/images/Takbir_ihram.jpg"
/// image2 : "assets/images/Tak2.jpg"
/// image3 : "assets/images/Tak3.jpg"
/// image4 : "assets/images/Tak4.jpg"
/// Video : "assets/video/Takbir_ihram.mp4"
/// Video2 : "assets/video/MH-ihram.mp4"
/// description : "🔖\tTakbirat Al Ihram\n\r\n✒️ Levante ambas manos hasta la altura de las orejas o los hombros y pronuncie el primer Takbir (takbiratul Ihram),  y diga : Al-lahu Akbar \n\n🔳➖Coloque la mano derecha sobre la mano izquierda, y ambas sobre el pecho.\n\r\n🔳➖\tFije su mirada en el lugar en que colocará la frente durante su postración."

class Images {
  Images({
    Main? main,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    String? image6,
    String? video,
    String? video2,
    String? description,
  }) {
    _main = main;
    _image = image;
    _image2 = image2;
    _image3 = image3;
    _image4 = image4;
    _image5 = image5;
    _image6 = image6;
    _video = video;
    _video2 = video2;
    _description = description;
  }

  Images.fromJson(dynamic json) {
    _main = json['Main'] != null ? Main.fromJson(json['Main']) : null;
    _image = json['image'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _image4 = json['image4'];
    _image5 = json['image5'];
    _image6 = json['image6'];
    _video = json['Video'];
    _video2 = json['Video2'];
    _description = json['description'];
  }
  Main? _main;
  String? _image;
  String? _image2;
  String? _image3;
  String? _image4;
  String? _image5;
  String? _image6;
  String? _video;
  String? _video2;
  String? _description;
  Images copyWith({
    Main? main,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? image5,
    String? image6,
    String? video,
    String? video2,
    String? description,
  }) =>
      Images(
        main: main ?? _main,
        image: image ?? _image,
        image2: image2 ?? _image2,
        image3: image3 ?? _image3,
        image4: image4 ?? _image4,
        image5: image4 ?? _image5,
        image6: image4 ?? _image6,
        video: video ?? _video,
        video2: video2 ?? _video2,
        description: description ?? _description,
      );
  Main? get main => _main;
  String? get image => _image;
  String? get image2 => _image2;
  String? get image3 => _image3;
  String? get image4 => _image4;
  String? get image5 => _image5;
  String? get image6 => _image6;
  String? get video => _video;
  String? get video2 => _video2;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_main != null) {
      map['Main'] = _main?.toJson();
    }
    map['image'] = _image;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['image4'] = _image4;
    map['image5'] = _image5;
    map['image6'] = _image6;
    map['Video'] = _video;
    map['Video2'] = _video2;
    map['description'] = _description;
    return map;
  }
}

/// Mainimage1 : "assets/images/2.png"
/// Mainimage2 : "assets/images/3.png"

class Main {
  Main({
    String? mainimage1,
    String? mainimage2,
  }) {
    _mainimage1 = mainimage1;
    _mainimage2 = mainimage2;
  }

  Main.fromJson(dynamic json) {
    _mainimage1 = json['Mainimage1'];
    _mainimage2 = json['Mainimage2'];
  }
  String? _mainimage1;
  String? _mainimage2;
  Main copyWith({
    String? mainimage1,
    String? mainimage2,
  }) =>
      Main(
        mainimage1: mainimage1 ?? _mainimage1,
        mainimage2: mainimage2 ?? _mainimage2,
      );
  String? get mainimage1 => _mainimage1;
  String? get mainimage2 => _mainimage2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Mainimage1'] = _mainimage1;
    map['Mainimage2'] = _mainimage2;
    return map;
  }
}
