import 'dart:io';

import 'package:path_provider/path_provider.dart';


Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

//.............SAVE LOGIN DATA....................



Future<File> get _localFileForLoginStatus async {
  final path = await _localPath;
  return File('$path/loginStatus.txt');
}

Future<int> readLoginStatus() async {
  try {
    final file = await _localFileForLoginStatus;

    // Read the file
    String contents = await file.readAsString();
    int logStat = int.parse(contents);
    return logStat;
  } catch (e) {
    print('eroor.. $e');
    // If encountering an error, return 0
    return 0;
  }
}

saveLoginStatus(int loginStatus) async {
  final file = await _localFileForLoginStatus;

  // Write the file
  file.writeAsString('$loginStatus');
}