import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../widget/button/button1.dart';
import '../../widget/button/button2.dart';
import '../../widget/button/card1.dart';


DateTime today = new DateTime.now();
String dateString = DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(today);


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Center(
      child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/fond1.png",height: 300,width: 300),
            const Text('HomePage'),
            Button1(text: "Alarme",),
            Button2(text: "button2"),
            Card1(
              title: "Mon dernier sommeil",
              subtitle: dateString,
            )
    ]
      )

    );
  }
}

