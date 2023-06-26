import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _MaxPicsInCurrentSession = prefs.getInt('ff_MaxPicsInCurrentSession') ??
          _MaxPicsInCurrentSession;
    });
    _safeInit(() {
      _isDark = prefs.getBool('ff_isDark') ?? _isDark;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _MaxPicsInCurrentSession = 0;
  int get MaxPicsInCurrentSession => _MaxPicsInCurrentSession;
  set MaxPicsInCurrentSession(int _value) {
    _MaxPicsInCurrentSession = _value;
    prefs.setInt('ff_MaxPicsInCurrentSession', _value);
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  bool _makePhoto = false;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool _value) {
    _makePhoto = _value;
  }

  int _index = 0;
  int get index => _index;
  set index(int _value) {
    _index = _value;
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String _value) {
    _filePath = _value;
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool _value) {
    _isLoggedIn = _value;
  }

  bool _isDark = false;
  bool get isDark => _isDark;
  set isDark(bool _value) {
    _isDark = _value;
    prefs.setBool('ff_isDark', _value);
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
