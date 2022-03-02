import 'dart:convert';

import 'package:flutter/services.dart';

class ReadJson {
  Future<List<dynamic>> getAllReciters() async{
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    print(data['Radios']);
    return data["Radios"];
  }
}