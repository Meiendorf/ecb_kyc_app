import 'package:ecb_kyc_app/webview.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECB KYC APP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(
              child: Text(''),
            ),
          ),
          Image.asset('assets/images/ecb.png', width: 200,),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => WebView()),
                ),
              );
            },
            child: Text('Open WebView'),
          ),
        ],
      ),
    );
  }
}
