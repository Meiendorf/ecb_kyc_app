import 'package:ecb_kyc_app/figma_button.dart';
import 'package:ecb_kyc_app/figma_button_bottom.dart';
import 'package:ecb_kyc_app/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 245),
        // title: const Text('ECB KYC APP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(
              child: Text(''),
            ),
          ),
          Image.asset(
            'assets/images/ecb-logo.png',
            width: 240,
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color:
                        Color.fromARGB(10, 30, 25, 25), // Slight gray color
                    blurRadius: 4, // Slight blur
                    spreadRadius: 2, // Slight spread
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: TextField(
                      cursorColor: Colors.black,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: 'Телефон',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: double.infinity,
                    child: FigmaButton(
                      onPressed: () {
                        
                      },
                      label: 'Далее',
                      isDiactivated: false,
                    ),
                  ),
                  Spacer(),
                  Text('Новый пользоваеть ENBank?', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: double.infinity,
                    child: FigmaButtonBottom(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => WebView()),
                          ),
                        );
                      },
                      label: 'Зарегистрируйтесь',
                      isDiactivated: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
