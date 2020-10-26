import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../../../Utilities/CTask.dart';

class CounterStorage {
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/Events.json");
  }

  Future<Task> parseJson() async {
    String jsonString = await _loadFromAsset();
    print(jsonString);
    Map jsonRespone = jsonDecode(jsonString);
    var task = Task.fromJson(jsonRespone);
    return task;
  }
}
