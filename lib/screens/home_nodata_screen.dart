import 'package:flutter/material.dart';

class EmptyHomeScreem extends StatefulWidget {
  const EmptyHomeScreem({super.key});

  @override
  State<EmptyHomeScreem> createState() => _EmptyHomeScreemState();
}

class _EmptyHomeScreemState extends State<EmptyHomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Column(
      children: [
        Image.asset('images/search_em.gif',height: 250,width: 250,fit:BoxFit.fill,)
        ,Text('Searching 🔍',style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)
      ],
    ),);
  }
}
