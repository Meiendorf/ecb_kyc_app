import 'package:flutter/material.dart';

class EcbBanner extends StatelessWidget {
  const EcbBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/images/ecb-logo.png', height: 80, width: 240,),
        ],
      ),
    );
  }
}
