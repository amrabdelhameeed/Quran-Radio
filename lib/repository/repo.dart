import 'package:quranwithstatemangment/local_services_ReadJson/read_fromJson.dart';
import 'package:quranwithstatemangment/radio.dart';

class Repository {
  final ReadJson readJson;

  Repository(this.readJson);

  Future< List<RadioModel>> getAllReciters () async{
    final data =await readJson.getAllReciters();
    return data.map((reciter) =>RadioModel.fromJson(reciter)).toList();
  }
}