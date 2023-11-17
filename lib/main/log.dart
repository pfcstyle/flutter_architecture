

import 'dart:convert';
import 'dart:io';

import 'package:flutter_architecture/main/app_env.dart';
import 'package:flutter_architecture/shared/utils/date_utils.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(printEmojis: true, printTime: true)),
    level: EnvInfo.isProduction ? Level.warning : Level.all,
    output: MultiOutput([ConsoleOutput(), MyLogFileOutput()])
  );
  
  static void v(dynamic message) {
    _logger.t(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }

  static void e(dynamic message, {Object? error}) {
    _logger.e(message, error: error);
  }

  static void f(dynamic message,{
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  static Future<Stream<FileSystemEntity> > getAllLogFiles() async{
    return MyLogFileOutput.getAllLogFiles();
  }
}

class MyLogFileOutput extends LogOutput {
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  File? file;
  String? _currentDate;

  MyLogFileOutput({
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  Future<void> getDirectoryForLogRecord() async {
    String currentDate = getCurrentDay();
    if (currentDate != _currentDate) {
      final String fileDir = await createDirectory();
      file = File('$fileDir/$currentDate.log');

      _sink = file!.openWrite(
        mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
        encoding: encoding,
      );

      _currentDate = currentDate;
    }
  }

  String getCurrentDay() {
    String currentDate =
        DateUtil.formatDate(DateTime.now(), format: "yyyyMMdd");
    return currentDate;
  }

  @override
  Future<void> init() async{
    deleteLogsOfBefore7Day();
    directoryLogRecord(onCallback: () {});
  }

  void directoryLogRecord({required Function onCallback}) {
    getDirectoryForLogRecord().whenComplete(() {
      onCallback();
    });
  }

  @override
  void output(OutputEvent event) {
    directoryLogRecord(onCallback: () {
      if (_sink != null) {
        // if (Level.info == event.level ||
        //     Level.warning == event.level ||
        //     Level.error == event.level) {
        //   _sink?.writeAll(event.lines, '\n');
        // }
        _sink?.writeAll(event.lines, '\n');
      }
    });
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }

  static Future<String> createDirectory() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    var file = Directory("${directory.path}/lyd");
    try {
      bool exist = await file.exists();
      if (exist == false) {
        await file.create();
      }
    } catch(e) {
      Log.e("createDirectory error");
    }

    return file.path;
  }

  /// Remove log files auto in 7 days
  static Future<void> deleteLogsOfBefore7Day() async {
    final String fileDir = await createDirectory();

    // Get all log files
    var dir = Directory(fileDir);
    Stream<FileSystemEntity> file = dir.list();
    await for (FileSystemEntity x in file) {
      // Get file's name
      List<String> paths = x.path.split('/');
      if (paths.isNotEmpty) {
        String logName = paths.last.replaceAll('.log', '');
        final logDate = DateUtil.getDateTime(logName);
        final currentDate = DateTime.now();
        //Compare days
        if (logDate != null) {
          final difference = currentDate.difference(logDate).inDays;
          Log.d("deleteLogsOfBefore7Day logDate:$logDate, currentDate:$currentDate, difference:$difference");
          if (difference > 7) {
            var file = File(x.path);
            // delete file
            file.delete();
          }
        }
      }
    }
  }

  static Future<Stream<FileSystemEntity> > getAllLogFiles() async{
    final String fileDir = await createDirectory();

    // Get all log files
    var dir = Directory(fileDir);
    return dir.list();
  }
}