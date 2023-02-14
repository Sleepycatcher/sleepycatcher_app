import 'package:flutter/material.dart';
import '../../widget/button/button1.dart';
import '../../widget/button/button2.dart';
import '../../widget/button/card1.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('HomePage'),
            Button1(text: "button1"),
            Button2(text: "button2"),
            Card1(text: "card1")
    ]
      )

    );
  }
}

