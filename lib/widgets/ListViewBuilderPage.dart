
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranwithstatemangment/cubit/quran_cubit.dart';
import 'package:quranwithstatemangment/widgets/Item.dart';

class ListViewBuilderPage extends StatelessWidget {
   ListViewBuilderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {
      },
      builder: (context, state) {
          var bloc = BlocProvider.of<QuranCubit>(context);
          var player = bloc.player;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder:(context,index){
          var reciper = bloc.allReciters[index];
          return Item(
          isFav: reciper.isFav,
          callbackFav: (){
            bloc.updateFavButton(reciper);
          },
          isPlay: reciper.isPlay,
          name: reciper.name,
          url: reciper.url,
          callback: (){
            if(!reciper.isPlay){
              player.open(
                Audio.network(
                  "${reciper.url}",
                  metas: Metas(
                    album:  "${reciper.name}",
                    title:  "${reciper.name}",
                    onImageLoadFail:  MetasImage.asset("assets/images/radio.png"),
                    image:  MetasImage.asset("assets/images/radioaa.jpg"),
                  ),
                ),showNotification: true,
                playInBackground: PlayInBackground.enabled,
                notificationSettings: NotificationSettings(
                  nextEnabled: false,
                  prevEnabled: false,
                  stopEnabled: true,
                  customStopAction: (player){
                    player.stop();
                     bloc.updateButton(reciper);
                  },
                  customPlayPauseAction: (player){
                    if(!reciper.isPlay){
                      player.play().then((_) {
                        bloc.updateButton(reciper);
                      });
                    }
                    else{
                      player.pause().then((_) {
                        bloc.updateButton(reciper);
                      });
                    }
                  }
                )
              ).then((_) {
                bloc.updateButton(reciper);
              });
            }
            else {
              player.pause().then((_) {
                bloc.updateButton(reciper);
              });
            }
          },
        );} ,itemCount:bloc.allReciters.length ,shrinkWrap: true,);
      },);
}}
