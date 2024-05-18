class CategorySpModel {
  String? name;
  List<Value>? value;

  CategorySpModel({this.name, this.value});

  CategorySpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }


}

class Value {
  String? name;
  String? value;
  String? video;

  Value({this.name, this.value, this.video});

  Value.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    video = json['Video'];
  }

  
}
