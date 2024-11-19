import 'dart:async';
import 'dart:math' show pi;

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:location/location.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  late Stream<LocationData> locationData;
  Location location = Location();

  @override
  void initState() {
    print('I am in Compass');
    locationData = location.onLocationChanged;
    _checkLocationStatus();
    super.initState();
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
          child: LayoutBuilder(builder: (context, constraint) {
            final height = constraint.maxHeight;
            final width = constraint.maxWidth;
            return StreamBuilder<LocationData>(
              stream: locationData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //snapshot.data;
                  AppPublicVar.coordinates = Coordinates(
                      snapshot.data!.latitude ?? 0,
                      snapshot.data!.longitude ?? 0);
                  double degree = Qibla.qibla(AppPublicVar.coordinates);
                  var qibla = degree * (pi / 180);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Qibla',
                          style: AppTextStyles.h2,
                        ),
                        30.hSize,
                        StreamBuilder<CompassEvent>(
                          stream: FlutterCompass.events,
                          builder: (context, snapshot2) {
                            if (snapshot2.hasData) {
                              //print(snapshot2.data!.heading!);
                              double compass =
                                  (-snapshot2.data!.heading! * (pi / 180));
                              var range = degree + snapshot2.data!.heading!;
                              return Column(
                                children: [
                                  Text(
                                    (range < 5 && range > -5)
                                        ? 'El dispositivo indica la dirección de la Qibla.' //' الجهاز يشير إلى اتجاه القبلة'
                                        : 'Gire el dispositivo hasta que la flecha cambie a verde.'
                                    //'قم بتدوير الجهاز حتى يتغير السهم للأخضر'
                                    ,
                                    style: AppTextStyles.h4,
                                  ),
                                  Transform.rotate(
                                    angle: compass,
                                    child: SizedBox(
                                      height: context.width,
                                      width: context.width,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/3.svg',
                                            //needle
                                            height: height, width: width,
                                          ),
                                          Transform.rotate(
                                            angle: qibla,
                                            child: SvgPicture.asset(
                                              (range < 5 && range > -5)
                                                  ? 'assets/images/5.svg'
                                                  : 'assets/images/4.svg',
                                              width: 150,
                                              height: 150,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        Text(
                          'Dirección qibla desde el norte ${degree.round()}\u00B0' //'اتجاه القبلة من الشمال'
                          ,
                          style: AppTextStyles.h4,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }),
        ),
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    if (await Location().serviceEnabled() &&
        locationData == PermissionStatus.denied) {
      await location.requestPermission();
      //final s = await PermissionStatus.checkLocationStatus();
      //_locationStreamController.sink.add(s);
    } else {
      // _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void dispose() {
    super.dispose();
    //_locationStreamController.close();
    //FlutterQiblah().dispose();
  }
}

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
  }

  Future<PermissionStatus> checkPermission() async {
    print('checking perminsion ${location.toString()}');
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
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('Waiting');
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }

              if (snapshot.hasError) {
                print('has Error');
                print('Error: ${snapshot.error.toString()}');
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              }

              if (snapshot.hasData) {
                if (snapshot.data == PermissionStatus.denied) {
                  //location.requestPermission();
                  //setState(() {});
                  return Center(
                      child: InkWell(
                          onTap: () {
                            location.requestPermission();
                            setState(() {});
                          },
                          child: const Text('Denied Click To Enable')));
                } else {
                  print('has data ${snapshot.data}');
                  return const QiblaCompass();
                }
              } else {
                print('not has data');
                return Center(
                    child: InkWell(
                        onTap: () {
                          location.requestPermission();
                          setState(() {});
                        },
                        child: const Text('Error')));
              }
            },
          ),
        ),
      ),
    );
  }
}
