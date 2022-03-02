import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranwithstatemangment/appRouter.dart';
import 'package:quranwithstatemangment/pages/Home.dart';

import 'cubit/quran_cubit.dart';
import 'local_services_ReadJson/read_fromJson.dart';
import 'repository/repo.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key,required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "a"
      ),    
    );
  }
}
