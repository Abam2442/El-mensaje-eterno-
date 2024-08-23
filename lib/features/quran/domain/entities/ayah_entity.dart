//describes strucutre of Ayah and translators
class Ayah {
  final String arabic;
  final String arabic_search;
  final Map<String,dynamic> tafsirs;
  
  const Ayah({
    
    required this.arabic,
    required this.arabic_search,
    required this.tafsirs
  });
}
