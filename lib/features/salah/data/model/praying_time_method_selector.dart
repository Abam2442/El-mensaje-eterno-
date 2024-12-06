import 'package:adhan_dart/adhan_dart.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/region_model.dart';

class CalculationMethodSelector {
  static CalculationParameters getCalculationMethod(
      double latitude, double longitude) {
    if (isInRegion(latitude, longitude, _middleEastNorthAfrica)) {
      return CalculationMethod.muslimWorldLeague();
    } else if (isInRegion(latitude, longitude, _egyptRegion)) {
      return CalculationMethod.egyptian();
    } else if (isInRegion(latitude, longitude, _southAsia)) {
      return CalculationMethod.karachi();
    } else if (isInRegion(latitude, longitude, _saudiArabia)) {
      return CalculationMethod.ummAlQura();
    } else if (isInRegion(latitude, longitude, _unitedArabEmirates)) {
      return CalculationMethod.dubai();
    } else if (isInRegion(latitude, longitude, _northAmerica)) {
      return CalculationMethod.northAmerica();
    } else if (isInRegion(latitude, longitude, _kuwaitRegion)) {
      return CalculationMethod.kuwait();
    } else if (isInRegion(latitude, longitude, _qatarRegion)) {
      return CalculationMethod.qatar();
    } else if (isInRegion(latitude, longitude, _singaporeRegion)) {
      return CalculationMethod.singapore();
    } else if (isInRegion(latitude, longitude, _iranRegion)) {
      return CalculationMethod.tehran();
    } else if (isInRegion(latitude, longitude, _turkeyRegion)) {
      return CalculationMethod.turkiye();
    } else if (isInRegion(latitude, longitude, _moroccoRegion)) {
      return CalculationMethod.morocco();
    } else if (isInRegion(latitude, longitude, _europeRegion)) {
      return CalculationMethod.muslimWorldLeague();
    } else if (isInRegion(latitude, longitude, _australiaRegion)) {
      return CalculationMethod.other();
    } else if (isInRegion(latitude, longitude, _southAmericaRegion)) {
      return CalculationMethod.other();
    } else if (isInRegion(latitude, longitude, _centralAsiaRegion)) {
      return CalculationMethod.ummAlQura();
    } else {
      return CalculationMethod.other();
    }
  }

  static bool isInRegion(
      double latitude, double longitude, List<Region> regions) {
    for (var region in regions) {
      if (latitude >= region.minLat &&
          latitude <= region.maxLat &&
          longitude >= region.minLon &&
          longitude <= region.maxLon) {
        return true;
      }
    }
    return false;
  }

  static final List<Region> _middleEastNorthAfrica = [
    Region(minLat: 12.0, maxLat: 37.0, minLon: -17.0, maxLon: 63.0)
  ];

  static final List<Region> _egyptRegion = [
    Region(minLat: 22.0, maxLat: 32.0, minLon: 25.0, maxLon: 35.0)
  ];

  static final List<Region> _southAsia = [
    Region(minLat: 8.0, maxLat: 37.0, minLon: 60.0, maxLon: 97.0)
  ];

  static final List<Region> _saudiArabia = [
    Region(minLat: 16.0, maxLat: 32.0, minLon: 34.0, maxLon: 56.0)
  ];

  static final List<Region> _unitedArabEmirates = [
    Region(minLat: 22.5, maxLat: 26.0, minLon: 51.0, maxLon: 56.5)
  ];

  static final List<Region> _northAmerica = [
    Region(minLat: 24.0, maxLat: 49.5, minLon: -125.0, maxLon: -66.5)
  ];

  static final List<Region> _kuwaitRegion = [
    Region(minLat: 28.0, maxLat: 30.0, minLon: 46.0, maxLon: 49.0)
  ];

  static final List<Region> _qatarRegion = [
    Region(minLat: 24.0, maxLat: 27.0, minLon: 50.0, maxLon: 52.0)
  ];

  static final List<Region> _singaporeRegion = [
    Region(minLat: 1.0, maxLat: 2.0, minLon: 103.5, maxLon: 104.0)
  ];

  static final List<Region> _iranRegion = [
    Region(minLat: 25.0, maxLat: 40.0, minLon: 44.0, maxLon: 63.0)
  ];

  static final List<Region> _turkeyRegion = [
    Region(minLat: 36.0, maxLat: 42.0, minLon: 26.0, maxLon: 45.0)
  ];

  static final List<Region> _moroccoRegion = [
    Region(minLat: 21.0, maxLat: 36.0, minLon: -17.0, maxLon: -1.0)
  ];

  static final List<Region> _europeRegion = [
    Region(minLat: 35.0, maxLat: 71.0, minLon: -10.0, maxLon: 40.0)
  ];

  static final List<Region> _australiaRegion = [
    Region(minLat: -44.0, maxLat: -10.0, minLon: 112.0, maxLon: 154.0)
  ];

  static final List<Region> _southAmericaRegion = [
    Region(minLat: -56.0, maxLat: 13.0, minLon: -81.0, maxLon: -34.0)
  ];

  static final List<Region> _centralAsiaRegion = [
    Region(minLat: 35.0, maxLat: 55.0, minLon: 45.0, maxLon: 90.0)
  ];
}
