import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Config {
  static final Config _config = new Config._internal();

  factory Config() {
    return _config;
  }

  Config._internal();

  String _localPath;
  String _optionFile = 'optionV3.json';
  String _historyFile = 'history.json';

  static const isFullScreen = 'isFullScreen';
  static const isVolumeControl = 'isVolumeControl';
  static const isFlippingAnimation = 'isFlippingAnimation';
  static const isAutoRefresh = 'isAutoRefresh';
  static const isSlidingNavigationBar = 'isSlidingNavigationBar';
  static const isBrightnessDark = 'isBrightnessDark';
  static const searchTypeIndex = 'searchTypeIndex';
  static const themeIndex = 'themeIndex';
  static const optionVersion = 'themeIndex';

  static const searchTypeList = ['模糊', '准确', '精确'];
  static Map<String, dynamic> option = {
    optionVersion: 1,
    isAutoRefresh: false,
    isFullScreen: true,
    isVolumeControl: false,
    isFlippingAnimation: false,
    isSlidingNavigationBar: true,
    isBrightnessDark: false,
    searchTypeIndex: 1,
    themeIndex: 0,
  };
  static List<dynamic> history = <dynamic>[];
  static dynamic setTheme;
  Future<void> init() async {
    _localPath = await _getLocalPath();
    try {
      String optionString = await _getConfig(_optionFile);
      option = jsonDecode(optionString) as Map<String, dynamic>;
    } catch (e) {
      print(e.toString());
    }

    try {
      String historyString = await _getConfig(this._historyFile);
      history = jsonDecode(historyString) as List<dynamic>;
    } catch (e) {
      print(e.toString());
    }

    return;
  }

  Future<void> changeOption(item, value) {
    option[item] = value;
    return _saveConfig(_optionFile, option);
  }

  Future<void> changeHistory({List<String> history}) {
    if (history != null) {
      Config.history = history;
    }
    return _saveConfig(_historyFile, Config.history);
  }

  Future<void> _saveConfig(String configName, dynamic config) {
    return File('$_localPath/$configName').writeAsString(jsonEncode(config));
  }

  Future<String> _getConfig(String configName) {
    return File('$_localPath/$configName').readAsString();
  }

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
