List<List<String>> listLengthHandeler(
    List<List<dynamic>> listOfLists, int referenceLength, String fillValue) {
  return listOfLists
      .map((list) {
        if (list.length < referenceLength) {
          List<dynamic> newList = List<dynamic>.from(list);
          newList.length = referenceLength;
          newList.fillRange(list.length, referenceLength, fillValue);
          return newList;
        }
        return list;
      })
      .toList()
      .map((outList) => outList.map((inList) => inList.toString()).toList())
      .toList();
}
