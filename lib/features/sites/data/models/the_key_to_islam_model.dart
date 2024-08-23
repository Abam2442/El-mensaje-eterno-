class TheKeyToIslamfirst {
  String name;
  String description;
  List<Video> videos;

  TheKeyToIslamfirst(
      {required this.description, required this.videos, required this.name});

  // factory TheKeyToIslamfirst.fromJson(Map<String, dynamic> json) {
  //   return TheKeyToIslamfirst(
  //     description: json[0][''],
  //     name: json[0][''],
  //     videos: json['¿Qué es el Corán?']['Videos']
  //         .map((video) => Video.fromJson(video))
  //         .toList(),
  //   );
  // }
}

class Video {
  String title;
  String url;

  Video({required this.title, required this.url});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'],
      url: json['url'],
    );
  }
}
