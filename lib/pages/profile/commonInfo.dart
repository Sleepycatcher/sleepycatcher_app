import 'package:flutter/material.dart';

class CommonInfo extends StatelessWidget {


  const CommonInfo({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('name'),
        Text('email'),
      ],
    );
  }
}
