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
    _safeInit(() {
      _profileTour = prefs.getBool('ff_profileTour') ?? _profileTour;
    });
    _safeInit(() {
      _feedTour = prefs.getBool('ff_feedTour') ?? _feedTour;
    });
    _safeInit(() {
      _cameraTour = prefs.getBool('ff_cameraTour') ?? _cameraTour;
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

  int _currentSessionPicsNum = 0;
  int get currentSessionPicsNum => _currentSessionPicsNum;
  set currentSessionPicsNum(int _value) {
    _currentSessionPicsNum = _value;
  }

  bool _switchCam = false;
  bool get switchCam => _switchCam;
  set switchCam(bool _value) {
    _switchCam = _value;
  }

  bool _uploadingPhoto = false;
  bool get uploadingPhoto => _uploadingPhoto;
  set uploadingPhoto(bool _value) {
    _uploadingPhoto = _value;
  }

  bool _profileTour = false;
  bool get profileTour => _profileTour;
  set profileTour(bool _value) {
    _profileTour = _value;
    prefs.setBool('ff_profileTour', _value);
  }

  bool _feedTour = false;
  bool get feedTour => _feedTour;
  set feedTour(bool _value) {
    _feedTour = _value;
    prefs.setBool('ff_feedTour', _value);
  }

  bool _cameraTour = false;
  bool get cameraTour => _cameraTour;
  set cameraTour(bool _value) {
    _cameraTour = _value;
    prefs.setBool('ff_cameraTour', _value);
  }

  bool _errorUploading = false;
  bool get errorUploading => _errorUploading;
  set errorUploading(bool _value) {
    _errorUploading = _value;
  }

  List<String> _suggestedNums = [];
  List<String> get suggestedNums => _suggestedNums;
  set suggestedNums(List<String> _value) {
    _suggestedNums = _value;
  }

  void addToSuggestedNums(String _value) {
    _suggestedNums.add(_value);
  }

  void removeFromSuggestedNums(String _value) {
    _suggestedNums.remove(_value);
  }

  void removeAtIndexFromSuggestedNums(int _index) {
    _suggestedNums.removeAt(_index);
  }

  void updateSuggestedNumsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _suggestedNums[_index] = updateFn(_suggestedNums[_index]);
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
