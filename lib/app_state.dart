import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cromiePosition =
          _latLngFromString(prefs.getString('ff_cromiePosition')) ??
              _cromiePosition;
    });
    _safeInit(() {
      _clorophillaPosition =
          _latLngFromString(prefs.getString('ff_clorophillaPosition')) ??
              _clorophillaPosition;
    });
    _safeInit(() {
      _club73Position =
          _latLngFromString(prefs.getString('ff_club73Position')) ??
              _club73Position;
    });
    _safeInit(() {
      _cdmPosition =
          _latLngFromString(prefs.getString('ff_cdmPosition')) ?? _cdmPosition;
    });
    _safeInit(() {
      _masseriaLeucaspidePosition =
          _latLngFromString(prefs.getString('ff_masseriaLeucaspidePosition')) ??
              _masseriaLeucaspidePosition;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _cromiePosition = const LatLng(40.48781539999999, 16.9489163);
  LatLng? get cromiePosition => _cromiePosition;
  set cromiePosition(LatLng? value) {
    _cromiePosition = value;
    value != null
        ? prefs.setString('ff_cromiePosition', value.serialize())
        : prefs.remove('ff_cromiePosition');
  }

  LatLng? _clorophillaPosition = const LatLng(40.5322027, 16.9217159);
  LatLng? get clorophillaPosition => _clorophillaPosition;
  set clorophillaPosition(LatLng? value) {
    _clorophillaPosition = value;
    value != null
        ? prefs.setString('ff_clorophillaPosition', value.serialize())
        : prefs.remove('ff_clorophillaPosition');
  }

  LatLng? _club73Position = const LatLng(40.4270887, 17.2401145);
  LatLng? get club73Position => _club73Position;
  set club73Position(LatLng? value) {
    _club73Position = value;
    value != null
        ? prefs.setString('ff_club73Position', value.serialize())
        : prefs.remove('ff_club73Position');
  }

  LatLng? _cdmPosition = const LatLng(40.3982722, 17.2624364);
  LatLng? get cdmPosition => _cdmPosition;
  set cdmPosition(LatLng? value) {
    _cdmPosition = value;
    value != null
        ? prefs.setString('ff_cdmPosition', value.serialize())
        : prefs.remove('ff_cdmPosition');
  }

  LatLng? _masseriaLeucaspidePosition = const LatLng(40.5418348, 17.1858779);
  LatLng? get masseriaLeucaspidePosition => _masseriaLeucaspidePosition;
  set masseriaLeucaspidePosition(LatLng? value) {
    _masseriaLeucaspidePosition = value;
    value != null
        ? prefs.setString('ff_masseriaLeucaspidePosition', value.serialize())
        : prefs.remove('ff_masseriaLeucaspidePosition');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
