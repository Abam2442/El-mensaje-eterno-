String readError(e) {
  if (e is Map<String, dynamic>) {
    if (e['error'] == 1 && e['message'] != null) {
      return '${e['message']}';
    }
    if (e.values.first is List) {
      return '${e.values.first.first}';
    }
    return '${e.values.first}';
  }
  // IDK what the wrong is this. so something weird happened;
  return 'something_wrong';
}
