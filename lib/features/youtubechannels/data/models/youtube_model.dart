class YoutubeModel {
  String? namechannel;
  String? urlchannel;
  List<Videos>? videos;
  List<Playlists>? playlists;
  List<Shorts>? shorts;

  YoutubeModel(
      {this.namechannel,
      this.urlchannel,
      this.videos,
      this.playlists,
      this.shorts});

  YoutubeModel.fromJson(Map<String, dynamic> json) {
    namechannel = json['namechannel'];
    urlchannel = json['urlchannel'];
    if (json['Videos'] != null) {
      videos = <Videos>[];
      json['Videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
    if (json['Playlists'] != null) {
      playlists = <Playlists>[];
      json['Playlists'].forEach((v) {
        playlists!.add(Playlists.fromJson(v));
      });
    }
    if (json['Shorts'] != null) {
      shorts = <Shorts>[];
      json['Shorts'].forEach((v) {
        shorts!.add(Shorts.fromJson(v));
      });
    }
  }
}

class Videos {
  String? videoName;
  String? videoUrl;
  String? videoDescription;

  Videos({this.videoName, this.videoUrl, this.videoDescription});

  Videos.fromJson(Map<String, dynamic> json) {
    videoName = json['VideoName'];
    videoUrl = json['VideoUrl'];
    videoDescription = json['VideoDescription '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VideoName'] = videoName;
    data['VideoUrl'] = videoUrl;
    data['VideoDescription '] = videoDescription;
    return data;
  }
}

class Playlists {
  String? listname;
  String? listlink;
  List<Videos>? listclips;

  Playlists({this.listname, this.listlink, this.listclips});

  Playlists.fromJson(Map<String, dynamic> json) {
    listname = json['Listname'];
    listlink = json['Listlink'];
    if (json['Listclips '] != null) {
      listclips = <Videos>[];
      json['Listclips '].forEach((v) {
        listclips!.add(Videos.fromJson(v));
      });
    }
  }
}

class Shorts {
  String? videoName;
  String? videoUrl;

  Shorts({this.videoName, this.videoUrl});

  Shorts.fromJson(Map<String, dynamic> json) {
    videoName = json['VideoName'];
    videoUrl = json['VideoUrl'];
  }
}
