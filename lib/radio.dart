class RadioModel {
  late String name;
  late String url;
  late String id;
  late bool isPlay;
  late bool isFav;
RadioModel.fromJson(Map<String,dynamic>json){
  name = json["Name"];
  url = json["URL"];
  id = json["id"];
  isPlay = json["bool"];
  isFav = json["fav"];
}
void toggleButton () {
  isPlay = !isPlay;
}
void toogleFavourite(){
  isFav = !isFav;
}
}