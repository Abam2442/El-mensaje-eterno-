class ReaderModel {
  int id;
  String name;

  ReaderModel(this.id, this.name);

  updateData(ReaderModel reader) {
    id = reader.id;
    name = reader.name;
  }
}