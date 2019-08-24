import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Constants {
  static final Constants _constants = new Constants._internal();

  factory Constants() {
    return _constants;
  }

  Constants._internal();

  static const isFullScreen = "isFullScreen";
  static const isVolumeControl = "isVolumeControl";
  static const searchType = "searchType";
  static const history = "history";

  String _localPath;
  final _settingConfigFile = "setting.config";
  final _searchConfigFile = "search.config";

  static dynamic settingConfig;
  static dynamic searchConfig;

  void init() async {
    dynamic defaultSearchConfig = {
      searchType: "准确",
      history: [
        "蓝翅",
        "山海师",
      ],
    };
    dynamic defaultSettingConfig = {
      isFullScreen: true,
      isVolumeControl: false,
    };

    _localPath = await getLocalPath();

    try {
      String search = await readAppDoc(_searchConfigFile);
      searchConfig = jsonDecode(search);
    } catch (e) {
      searchConfig = defaultSearchConfig;
    }
    try {
      String setting = await readAppDoc(_settingConfigFile);
      settingConfig = jsonDecode(setting);
    } catch (e) {
      settingConfig = defaultSettingConfig;
    }
  }

  Future<void> saveConfig(dynamic config) {
    return writeAppDoc(_searchConfigFile, jsonEncode(config));
  }

  void writeAppDocSync(String fileName, String source) {
    File('$_localPath/$fileName').writeAsStringSync('$source');
  }

  String readAppDocSync(String fileName) {
    return File('$_localPath/$fileName').readAsStringSync();
  }

  Future<File> writeAppDoc(String fileName, String source) async {
    // final path = await getLocalPath();
    return File('$_localPath/$fileName').writeAsString('$source');
  }

  Future<String> readAppDoc(String fileName) async {
    // final path = await getLocalPath();
    return File('$_localPath/$fileName').readAsString();
  }

  Future<String> getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
