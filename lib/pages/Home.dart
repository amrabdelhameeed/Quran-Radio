

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranwithstatemangment/cubit/quran_cubit.dart';
import 'package:quranwithstatemangment/pages/FavouriteScreen.dart';
import 'package:quranwithstatemangment/widgets/ListViewBuilderPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
        BlocProvider.of<QuranCubit>(context).getAllReciters();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit,QuranState>(
      builder: (context,state){
        if(state is QuranLoaded){
          return Scaffold(
            backgroundColor:Colors.teal.shade300,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
             Navigator.pushNamed(context, "/s");
            }, icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.teal.shade300,
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "المقرئيين"
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
             Expanded(child: ListViewBuilderPage())
            ],
          ),
        ),
      );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
