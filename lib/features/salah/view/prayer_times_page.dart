/*
import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_themes.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/string_to_from.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_prayer_times_api.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/show_snackbar.dart';
import 'package:hiwayda_oracion_islamica/data/local/local_data.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/main_textfield.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/show_wait_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:adhan_dart/adhan_dart.dart';

import '../../../core/helper/format.dart';

class PrayerTimesPage extends StatefulWidget {
  PrayerTimesPage({Key? key}) : super(key: key);

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  String? current;
  bool isLoading = true;
  TextEditingController? _textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  DateTime dateToCalc = DateTime.now();
  var data;
  CustomPrayerTimes? customPrayerTimes;

  @override
  void initState() {
    getLocalData();
    super.initState();
  }

  void getLocalData() async {
    String? m = await LocalData.getString('prayerTime');
    customPrayerTimes = CustomPrayerTimes();
    if (m != null) {
      data = jsonDecode(m);
      customPrayerTimes = CustomPrayerTimes(
          latitude: data['data']['meta']['latitude'].toString(),
          longitude: data['data']['meta']['longitude'].toString(),
          timezone: data['data']['meta']['timezone']);
    }
    setState(() {
      calculateLocally();
      isLoading = false;
    });
  }

  void calculateLocally() {
    tz.initializeTimeZones();
    print('customPrayerTimes?.timezone ${customPrayerTimes?.timezone}');
    final location = tz.getLocation(customPrayerTimes?.timezone ?? 'Asia/Damascus');
    //cairo  Africa/Cairo
    //30.079694 31.323437
    // Definitions
    DateTime date = tz.TZDateTime.from(dateToCalc, location);
    print('customPrayerTimes?.latitude ${customPrayerTimes?.latitude}');
    print('customPrayerTimes?.longitude ${customPrayerTimes?.longitude}');
    AppPublicVar.coordinates = Coordinates(
        double.parse(customPrayerTimes?.latitude ?? '33.52048'),
        double.parse(customPrayerTimes?.longitude ?? '36.286937'));

    // Parameters
    CalculationParameters params = CalculationMethod.UmmAlQura();
    params.madhab = Madhab.Shafi;
    PrayerTimes prayerTimes =
        PrayerTimes(AppPublicVar.coordinates, date, params, precision: true);

    // Prayer times
    DateTime fajrTime = tz.TZDateTime.from(prayerTimes.fajr!, location);
    DateTime sunriseTime = tz.TZDateTime.from(prayerTimes.sunrise!, location);
    DateTime dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr!, location);
    DateTime asrTime = tz.TZDateTime.from(prayerTimes.asr!, location);
    DateTime maghribTime = tz.TZDateTime.from(prayerTimes.maghrib!, location);
    DateTime ishaTime = tz.TZDateTime.from(prayerTimes.isha!, location);
    current = prayerTimes.currentPrayer(date: DateTime.now());
    DateTime? currentPrayerTime = prayerTimes.timeForPrayer(current!);
    print('\n***** Prayer Times');
    print('zone:\t${customPrayerTimes?.timezone ?? ''}');
    print('fajrTime:\t$fajrTime');
    print('dhuhrTime:\t$dhuhrTime');
    print('asrTime:\t$asrTime');
    print('maghribTime:\t$maghribTime');
    print('ishaTime:\t$ishaTime');
    print('current:\t$current\t$currentPrayerTime');
    print(Qibla.qibla(AppPublicVar.coordinates));
    setState(() {
      customPrayerTimes!.fajrTime = DateFormat(('hh:mm a')).format(fajrTime);
      customPrayerTimes!.sunriseTime =
          DateFormat(('hh:mm a')).format(sunriseTime);
      customPrayerTimes!.duhrTime = DateFormat(('hh:mm a')).format(dhuhrTime);
      customPrayerTimes!.asrTime = DateFormat(('hh:mm a')).format(asrTime);
      customPrayerTimes!.maghribTime =
          DateFormat(('hh:mm a')).format(maghribTime);
      customPrayerTimes!.ishaTime = DateFormat(('hh:mm a')).format(ishaTime);
      _textEditingController!.text = location.toString();
      isLoading = false;
    });
  }

  void updateFromInternet() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ShowWaitDialog());
    data = await HelperMethods.getPrayerTimesFromAPI(
        '', _textEditingController!.text);
    switch (data) {
      case 'Unable to geocode address.':
      case 'failed':
      case 'no internet':
      case null:
        showSnackbar(data ?? 'error');
        break;
      default:
        print('savedData data $jsonEncode(data)');
        await LocalData.setString('prayerTime', jsonEncode(data) ?? '');
        showSnackbar('updated to ${_textEditingController!.text}');
    }
    getLocalData();
    AppRoutes.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: isLoading
            ? const ShowWaitDialog()
            : Container(
                padding: 15.hEdge,
                margin: EdgeInsets.only(top: context.height * 0.05),
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  color: AppColors.kGreenColor,
                ),
                child: Padding(
                    padding: 20.aEdge,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tiempos de oracio',
                          style: AppTextStyles.h2,
                        ),
                        15.hSize,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 410,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: 10.cBorder,
                                      border: BoxBorder.lerp(
                                          Border.all(
                                              color: Colors.black,
                                              width: 1),
                                          Border(),
                                          0.1)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: 10.cBorder,
                                              color: Colors.lightBlueAccent),
                                          child: Center(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  Format.date(DateTime.now()),
                                                  style: AppTextStyles.h4,
                                                ),
                                              ),
                                              Text(
                                                Format.dayOfWeek(
                                                    DateTime.now()),
                                                style: AppTextStyles.h5,
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData.dark().copyWith(
                                            colorScheme: ColorScheme.dark(
                                          onSurface: Colors.black,
                                          primary: Colors.lightBlueAccent,
                                        )),
                                        child: CalendarDatePicker(
                                          currentDate: DateTime.now(),
                                          onDateChanged: (dateTime) {
                                            print('dateTime $dateTime');
                                            dateToCalc = dateTime;
                                            calculateLocally();
                                          },
                                          firstDate: DateTime.now().subtract(
                                              const Duration(days: 60)),
                                          initialDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 60)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                15.hSize,
                                MainTextField(
                                  borderColor: Colors.black,
                                  focusNode: focusNode,
                                  controller: _textEditingController,
                                  labelText: 'Región',
                                  onEditingComplete: () {
                                    updateFromInternet();
                                    focusNode.unfocus();
                                  },
                                  style: AppTextStyles.h5,
                                ),
                                15.hSize,
                                _buildListTile(
                                    Prayer.Fajr,
                                    'Primer Salah',
                                    AppSvgs.fajr,
                                    customPrayerTimes?.fajrTime ?? ''),
                                15.hSize,
                                _buildListTile(Prayer.Sunrise, '', AppSvgs.duhr,
                                    customPrayerTimes?.sunriseTime ?? ''),
                                15.hSize,
                                _buildListTile(
                                    Prayer.Dhuhr,
                                    'segundo Salah',
                                    AppSvgs.duhr,
                                    customPrayerTimes?.duhrTime ?? ''),
                                15.hSize,
                                _buildListTile(
                                    Prayer.Asr,
                                    'tercer Salah',
                                    AppSvgs.asr,
                                    customPrayerTimes?.asrTime ?? ''),
                                15.hSize,
                                _buildListTile(
                                    Prayer.Maghrib,
                                    'cuarto Salah',
                                    AppSvgs.maghrib,
                                    customPrayerTimes?.maghribTime ?? ''),
                                15.hSize,
                                _buildListTile(
                                    Prayer.Isha,
                                    'quinto Salah',
                                    AppSvgs.isha,
                                    customPrayerTimes?.ishaTime ?? ''),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
      ),
    );
  }

  Widget _buildListTile(
      String title, String subtitle, String svg, String time) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: ((current == title) &&
                  (DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(DateTime.now()) ==
                      DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(dateToCalc)))
              ? Colors.blue.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: 10.cBorder,
          border: BoxBorder.lerp(
              Border.all(color: Colors.black, width: 1), const Border(), 0.1)),
      child: ListTile(
        leading: SvgPicture.asset(svg ?? ''),
        title: Text(
          title ?? '',
          style: AppTextStyles.h3,
        ),
        subtitle: Text(subtitle ?? ''),
        trailing: Text(time),
      ),
    );
  }
}

class CustomPrayerTimes {
  String? fajrTime;
  String? sunriseTime;
  String? duhrTime;
  String? asrTime;
  String? maghribTime;
  String? ishaTime;
  String? latitude;
  String? longitude;
  String? timezone;

  CustomPrayerTimes(
      {this.fajrTime,
      this.sunriseTime,
      this.duhrTime,
      this.asrTime,
      this.maghribTime,
      this.ishaTime,
      this.latitude,
      this.longitude,
      this.timezone});
}
*/

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/string_to_from.dart';
import 'package:hiwayda_oracion_islamica/data/local/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/praying_time_method_selector.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import 'package:adhan_dart/adhan_dart.dart';

import '../../../core/helper/format.dart';

class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({Key? key}) : super(key: key);

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  late LocationData locationData;

  String? current;
  DateTime dateToCalc = DateTime.now();
  late PrayerTimes prayerTimes;
  bool isLoading = true;

  @override
  void initState() {
    calcPrayerTimes();
    super.initState();
  }

  void calcPrayerTimes() async {
    if (AppPublicVar.coordinates == null) {
      Location location = Location();
      locationData = await location.getLocation();
      AppPublicVar.coordinates =
          Coordinates(locationData.latitude ?? 0, locationData.longitude ?? 0);
    }
    CalculationParameters params =
        CalculationMethodSelector.getCalculationMethod(
            locationData.latitude ?? 0, locationData.longitude ?? 0);
    params.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes(
        coordinates: AppPublicVar.coordinates!,
        date: dateToCalc,
        calculationParameters: params,
        precision: true);
    current = prayerTimes.currentPrayer(date: DateTime.now());
    saveData(AppPublicVar.coordinates!);
    setState(() {
      isLoading = false;
    });
  }

  void saveData(Coordinates coordinates) async {
    await LocalData.setString(
        'prayerTime', '${coordinates.latitude}:${coordinates.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? const Center(child: CircularProgressIndicator())
        : _buildContent();
  }

  Widget _buildContent() {
    return Container(
      //padding: 15.hEdge,
      //margin: EdgeInsets.only(top: context.height * 0.05),
      //width: context.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
        color: AppColors.kGreenColor,
      ),
      child: Padding(
          padding: 20.aEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Tiempos de oracio',
                style: AppTextStyles.h3,
              ),
              15.hSize,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 410,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: 10.cBorder,
                            border: BoxBorder.lerp(
                                Border.all(color: Colors.black, width: 1),
                                const Border(),
                                0.1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: 10.cBorder,
                                    color: AppColors.kGoldenColor),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        Format.date(DateTime.now()),
                                        style: AppTextStyles.h4,
                                      ),
                                    ),
                                    Text(
                                      Format.dayOfWeek(DateTime.now()),
                                      style: AppTextStyles.h5,
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            Theme(
                              data: ThemeData.dark().copyWith(
                                  colorScheme: const ColorScheme.dark(
                                onSurface: Colors.black,
                                primary: AppColors.kGoldenColor,
                              )),
                              child: CalendarDatePicker(
                                currentDate: DateTime.now(),
                                onDateChanged: (dateTime) {
                                  setState(() {
                                    dateToCalc = dateTime;
                                  });
                                },
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 60)),
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 60)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      15.hSize,
                      _buildListTile(Prayer.fajr, 'Primer Salah', AppSvgs.fajr,
                          prayerTimes.fajr!),
                      15.hSize,
                      _buildListTile(Prayer.sunrise, '', AppSvgs.duhr,
                          prayerTimes.sunrise!),
                      15.hSize,
                      _buildListTile(Prayer.dhuhr, 'segundo Salah',
                          AppSvgs.duhr, prayerTimes.dhuhr!),
                      15.hSize,
                      _buildListTile(Prayer.asr, 'tercer Salah', AppSvgs.asr,
                          prayerTimes.asr!),
                      15.hSize,
                      _buildListTile(Prayer.maghrib, 'cuarto Salah',
                          AppSvgs.maghrib, prayerTimes.maghrib!),
                      15.hSize,
                      _buildListTile(Prayer.isha, 'quinto Salah', AppSvgs.isha,
                          prayerTimes.isha!),
                      35.hSize
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildListTile(
      String title, String subtitle, String svg, DateTime time) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: ((current == title) &&
                  (DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(DateTime.now()) ==
                      DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                          .format(dateToCalc)))
              ? AppColors.kGoldenColor.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: 10.cBorder,
          border: BoxBorder.lerp(
              Border.all(color: Colors.black, width: 1), const Border(), 0.1)),
      child: ListTile(
        leading: SvgPicture.asset(svg),
        title: Text(
          title,
          style: AppTextStyles.h3,
        ),
        subtitle: Text(subtitle),
        trailing: Text(DateFormat(('hh:mm a')).format(time.toLocal())),
      ),
    );
  }
}

class PermissionprayerPage extends StatefulWidget {
  const PermissionprayerPage({Key? key}) : super(key: key);

  @override
  State<PermissionprayerPage> createState() => _PermissionprayerPageState();
}

class _PermissionprayerPageState extends State<PermissionprayerPage> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
  }

  Future<PermissionStatus> checkPermission() async {
    return await location.hasPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 35),
          //margin: 10.aEdge,
          padding: 10.aEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            color: AppColors.kGreenColor,
          ),
          child: FutureBuilder<PermissionStatus>(
            future: checkPermission(),
            builder: (context, snapshot) {
              String? localData = LocalData.getString('prayerTime');
              if (localData == '' || localData == null) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error.toString()}'),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data == PermissionStatus.denied) {
                    return Center(
                        child: InkWell(
                            onTap: () async {
                              await location.requestPermission();
                              setState(() {});
                            },
                            child: const Text('Denied Click To Enable')));
                  } else {
                    return const PrayerTimesPage();
                  }
                } else {
                  return Center(
                      child: InkWell(
                          onTap: () async {
                            await location.requestPermission();
                            setState(() {});
                          },
                          child: const Text('Error')));
                }
              } else {
                AppPublicVar.coordinates = Coordinates(
                    LocalData.getString('prayerTime')!
                        .split(':')[0]
                        .toDoubleNum,
                    LocalData.getString('prayerTime')!
                        .split(':')[1]
                        .toDoubleNum);
                return const PrayerTimesPage();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          AppPublicVar.coordinates = null;
          await LocalData.setString('prayerTime', '');
          setState(() {});
        },
      ),
    );
  }
}
