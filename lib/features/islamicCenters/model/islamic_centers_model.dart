/// countries : [{"countryName":"St. Kitts & Nevis","centers":[{"Title":"Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis","Description":"English: Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis\nSt. Kitts & Nevis","Address":""},{"Title":"Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands","Description":"English: Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands\nSt. Kitts & Nevis","Address":""}]},{"countryName":"Afghanistan","centers":[{"Title":"Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis","Description":"English: Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis\nSt. Kitts & Nevis","Address":""},{"Title":"Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands","Description":"English: Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands\nSt. Kitts & Nevis","Address":""}]}]

class IslamicCenterModel {
  IslamicCenterModel({
      List<Countries>? countries,}){
    _countries = countries;
}

  IslamicCenterModel.fromJson(dynamic json) {
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? _countries;
IslamicCenterModel copyWith({  List<Countries>? countries,
}) => IslamicCenterModel(  countries: countries ?? _countries,
);
  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// countryName : "St. Kitts & Nevis"
/// centers : [{"Title":"Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis","Description":"English: Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis\nSt. Kitts & Nevis","Address":""},{"Title":"Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands","Description":"English: Sint Eustatius Islamic Foundation  4 HM Kon. Beatrixweg, Oranjestad, Caribbean Netherlands\nSt. Kitts & Nevis","Address":""}]

class Countries {
  Countries({
      String? countryName, 
      List<Centers>? centers,}){
    _countryName = countryName;
    _centers = centers;
}

  Countries.fromJson(dynamic json) {
    _countryName = json['countryName'];
    if (json['centers'] != null) {
      _centers = [];
      json['centers'].forEach((v) {
        _centers?.add(Centers.fromJson(v));
      });
    }
  }
  String? _countryName;
  List<Centers>? _centers;
Countries copyWith({  String? countryName,
  List<Centers>? centers,
}) => Countries(  countryName: countryName ?? _countryName,
  centers: centers ?? _centers,
);
  String? get countryName => _countryName;
  List<Centers>? get centers => _centers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryName'] = _countryName;
    if (_centers != null) {
      map['centers'] = _centers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Title : "Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis"
/// Description : "English: Mussala 78V7+MF5, Frigate Bay, St. Kitts & Nevis\nSt. Kitts & Nevis"
/// Address : ""

class Centers {
  Centers({
      String? title, 
      String? description, 
      String? address,}){
    _title = title;
    _description = description;
    _address = address;
}

  Centers.fromJson(dynamic json) {
    _title = json['Title'];
    _description = json['Description'];
    _address = json['Address'];
  }
  String? _title;
  String? _description;
  String? _address;
Centers copyWith({  String? title,
  String? description,
  String? address,
}) => Centers(  title: title ?? _title,
  description: description ?? _description,
  address: address ?? _address,
);
  String? get title => _title;
  String? get description => _description;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = _title;
    map['Description'] = _description;
    map['Address'] = _address;
    return map;
  }

}