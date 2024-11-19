// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class HelperMethods {
//   static Future<dynamic> getPrayerTimesFromAPI(
//       String city, String country) async {
//     //String placeAddress= '';
//     // var connectivityResult = await Connectivity().checkConnectivity();
//     // if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
//     //   return 'no internet';
//     // }
//     String url =
//         'https://api.aladhan.com/v1/timingsByCity?date=${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now())}&city=$city&country=$country&method=4';
//     var response = await getRequest(url);
//     if (response != 'failed') {
//       /*placeAddress = response['results'][0]['formatted_address'];

//       Address pickupAddress = Address(
//         placeName: placeAddress,
//         latitude: position.latitude,
//         longitude: position.longitude,
//       );*/
//       return response;
//     }
//   }

//   static Future<dynamic> getPrayerTimesFromAPIByLocaion(
//       double latitude, double longitude) async {
//     //String placeAddress= '';
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult != ConnectivityResult.mobile &&
//         connectivityResult != ConnectivityResult.wifi) {
//       return 'no internet';
//     }
//     String url =
//         'http://api.aladhan.com/v1/timings/${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now())}?latitude=$latitude&longitude=$longitude&method=4';
//     var response = await getRequest(url);
//     if (response != 'failed') {
//       /*placeAddress = response['results'][0]['formatted_address'];

//       Address pickupAddress = Address(
//         placeName: placeAddress,
//         latitude: position.latitude,
//         longitude: position.longitude,
//       );*/
//       return response;
//     }
//   }

//   static Future<dynamic> getRequest(String url) async {
//     http.Response response = await http.get(Uri.parse(url));
//     try {
//       if (response.statusCode == 200) {
//         String data = response.body;
//         var decodeData = jsonDecode(data);
//         return decodeData;
//       } else {
//         return 'failed';
//       }
//     } catch (e) {
//       print('catch response ${jsonDecode(response.body.substring(5))['data']} '
//           'code ${response.statusCode} '
//           'res ${response.reasonPhrase}');
//       return jsonDecode(response.body.substring(5))['data'];
//     }
//   }

//   static String getAMPMFormat(String time) {
//     var temp = int.parse(time.split(':')[0]);
//     String t;
//     if (temp >= 12 && temp < 24) {
//       t = ' PM';
//     } else {
//       t = ' AM';
//     }
//     if (temp > 12) {
//       temp = temp - 12;
//       if (temp < 10) {
//         time = time.replaceRange(0, 2, '0$temp');
//         time += t;
//       } else {
//         time = time.replaceRange(0, 2, '$temp');
//         time += t;
//       }
//     } else if (temp == 00) {
//       time = time.replaceRange(0, 2, '12');
//       time += t;
//     } else {
//       time += t;
//     }
//     return time;
//   }
// }
