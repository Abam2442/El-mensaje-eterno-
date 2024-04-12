// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoaaModel {
  final String ar;
  final String es;
  final int noOfPages;
  List<SingleDoaa> listOfDoaa;
  DoaaModel(
      {required this.ar,
      required this.es,
      required this.noOfPages,
      required this.listOfDoaa});
}

class SingleDoaa {
  String arabic;
  String espanule;
  SingleDoaa({
    required this.arabic,
    required this.espanule,
  });
}
