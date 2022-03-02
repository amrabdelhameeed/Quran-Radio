import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranwithstatemangment/radio.dart';
import 'package:quranwithstatemangment/repository/repo.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.repository) : super(QuranInitial());

  final Repository repository;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  List<RadioModel> allReciters=[];
  List<RadioModel> favoriutes = [];
  List<RadioModel> getAllReciters () {
    repository.getAllReciters().then((allReciters) {
      this.allReciters = allReciters;
      emit(QuranLoaded(allReciters));
    });
    return allReciters;
  }
  void onerror () {
      allReciters.forEach((element) { 
      element.isPlay=false;
    });
    emit(QuranLoaded(allReciters));
  }
  void updateButton (RadioModel model) {
    if(!model.isPlay){
      allReciters.forEach((element) { 
      element.isPlay=false;
    });
    }
    model.toggleButton();
    emit(QuranLoaded(allReciters));
  }
  void updateFavButton (RadioModel model){
    if(model.isFav){
      favoriutes.add(model);
    }
    else {
      favoriutes.remove(model);
    }
    model.toogleFavourite();
    emit(QuranLoaded(allReciters));
  }


}
