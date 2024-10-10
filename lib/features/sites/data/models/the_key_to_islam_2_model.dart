class TheKeyToIslam2 {
  String pageText;
  // String description;
  List<Video> videos;

  TheKeyToIslam2({required this.videos, required this.pageText});

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
  String pageVideoUrl;
  String pageVideoTitle;
  String pageVideoDescription;

  Video(
      {required this.pageVideoUrl,
      required this.pageVideoTitle,
      required this.pageVideoDescription});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      pageVideoUrl: json['page_video_url'],
      pageVideoTitle: json['page_video_title'],
      pageVideoDescription: json['page_video_description'],
    );
  }
}
