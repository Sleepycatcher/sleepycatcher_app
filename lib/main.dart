import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/button/button1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      );

  }
}
class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("page2")
        )
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SleepyCather"),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
            "Accueil",
            style: GoogleFonts.poppins(
                textStyle:TextStyle(fontSize: 42),

          ),
            ),
           const Text(
              "Accueil",
              style: TextStyle(
                fontSize: 42,
              )
            ),GradientButton(text: 'Accueil')

          ],
        )
      )

      );
  }
}
