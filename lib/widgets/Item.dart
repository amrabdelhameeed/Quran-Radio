import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key,required this.name,required this.callback,required this.url,required this.isPlay,required this.callbackFav,required this.isFav}) : super(key: key);
  final String name;
  final String url;
  final Function callback;
  final bool isPlay;
  final Function callbackFav;
  final bool isFav;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(50)
      ),
      height: 80,
      child: Card(
        color: isPlay? Colors.teal.shade400:Colors.teal,
        child: Stack(
          children: [
            Center(
              child:Text(name,style: TextStyle(fontSize: 22,color: Colors.white),) ,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(onPressed:(){
                    callback();
                  } ,icon: !isPlay?Icon(Icons.play_arrow,color: Colors.white):Icon(Icons.pause),color: Colors.white,),
                  IconButton(onPressed:(){
                    callbackFav();
                  } ,icon: isFav?Icon(Icons.favorite,color: Colors.white):Icon(Icons.favorite_outline,color: Colors.white),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
