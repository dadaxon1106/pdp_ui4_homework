import 'package:flutter/material.dart';

class ItemIntro extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const ItemIntro(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40,right: 40,bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.red, fontSize: 32,
            fontWeight: FontWeight.w700),
          ),
        const  SizedBox(height: 16,),
          Text(content,style: const TextStyle(color: Colors.grey,fontSize: 20),
          textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}
