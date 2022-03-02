import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranwithstatemangment/cubit/quran_cubit.dart';
import 'package:quranwithstatemangment/local_services_ReadJson/read_fromJson.dart';
import 'package:quranwithstatemangment/pages/FavouriteScreen.dart';
import 'package:quranwithstatemangment/pages/Home.dart';
import 'package:quranwithstatemangment/repository/repo.dart';
class AppRouter {
  late Repository repository;
  late QuranCubit quranCubit;
  AppRouter(){
    repository = Repository(ReadJson());
    quranCubit=QuranCubit(repository);
  }
  Route ? generateRoute (RouteSettings settings) {
    switch (settings.name) {
      case "/":
      return  MaterialPageRoute(builder:(_)=>
           BlocProvider(
             create: (BuildContext context) => quranCubit,
             child: Home(),
           )
        );
      case "/s":
      return  MaterialPageRoute(builder:(_)=>
           BlocProvider(
             create: (BuildContext context) => QuranCubit(repository),
             child: FavouriteScreen(),
           )
        );
    }
  }
}