// لما أستخدم المودل دا ببيظهرلي List<dynamic> is not subtype of Map<String,dynamic> لذلك إستغنيت عنه
// class TelegramChannelsModel {
//   TelegramChannels telegramChannels;
//   IslamHousePhotos islamHousePhotos;
 
//   TelegramChannelsModel(
//       {required this.telegramChannels, required this.islamHousePhotos});

//   factory TelegramChannelsModel.fromJson(Map<String, dynamic> json) {
//     return TelegramChannelsModel(
//       telegramChannels: TelegramChannels.fromJson(json['telegram-channels']),
//       islamHousePhotos: IslamHousePhotos.fromJson(json['sp-islamhouse-photos']),
//     );
//   }
// }

class TelegramChannels {
  Map<String, TelegramChannel> telegramChannels;
  TelegramChannels({required this.telegramChannels});
  factory TelegramChannels.fromJson(dynamic json) {
    if (json is List) {
      // Handle list structure
      Map<String, TelegramChannel> channels = {};
      for (var item in json) {
        // Create TelegramChannel from list item
        channels[item['channelName']] = TelegramChannel.fromJson(item);
      }
      return TelegramChannels(telegramChannels: channels);
    } else {
      // Handle existing map structure
      Map<String, TelegramChannel> channels = {};
      json.forEach((key, value) {
        channels[key] = TelegramChannel.fromJson(value);
      });
      return TelegramChannels(telegramChannels: channels);
    }
  }
}

class TelegramChannel {
  Map<String, String> messages;
  TelegramChannel({required this.messages});
  factory TelegramChannel.fromJson(Map<String, dynamic> json) {
    return TelegramChannel(messages: json.cast<String, String>());
  }
}

class IslamHousePhotos {
  Map<String, String> photos;
  IslamHousePhotos({required this.photos});
  factory IslamHousePhotos.fromJson(Map<String, dynamic> json) {
    return IslamHousePhotos(photos: json.cast<String, String>());
  }
}
