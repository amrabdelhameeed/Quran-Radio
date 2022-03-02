
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranwithstatemangment/cubit/quran_cubit.dart';
import 'package:quranwithstatemangment/widgets/Item.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: BlocConsumer<QuranCubit,QuranState>(
            builder: (context,state) {
              var bloc = BlocProvider.of<QuranCubit>(context);
              return ListView.builder(
              shrinkWrap: true,
              itemCount: bloc.favoriutes.length,
              itemBuilder: (context,index){
              var favReciter = BlocProvider.of<QuranCubit>(context).favoriutes[index];
              return Item(name: favReciter.name, callback: (){}, url: favReciter.url, isPlay: favReciter.isPlay, callbackFav: (){}, isFav: favReciter.isFav);
            });
            },
            listener: (context,state){

            },
          ))
        ],
      ),
    );
  }
}