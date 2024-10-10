Map<String, String> convertMap(Map<String, dynamic> originalMap) {
  Map<String, String> convertedMap = {};

  originalMap.forEach((key, value) {
    convertedMap[key] = value == null ? '' : value.toString();
  });

  return convertedMap;
}
