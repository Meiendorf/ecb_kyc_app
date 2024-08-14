import 'package:ecb_kyc_app/banner.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String kycResult;
  final Map<String, dynamic>? kycDetails;

  const ResultScreen({Key? key, required this.kycResult, this.kycDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 245),
        // title: const Text('ECB KYC APP'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: kycResult == 'success' && kycDetails != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    EcbBanner(),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 191, 191, 191),
                            width: 2),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      width: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('KYC Result: $kycResult',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 227, 115, 2))),
                          SizedBox(height: 10),
                          Text('IDNP: ${kycDetails!['idnp']}',
                              style: TextStyle(fontSize: 16)),
                          Text('First Name: ${kycDetails!['firstName']}',
                              style: TextStyle(fontSize: 16)),
                          Text('Last Name: ${kycDetails!['lastName']}',
                              style: TextStyle(fontSize: 16)),
                          Text('Phone: ${kycDetails!['phone']}',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text('KYC Result: $kycResult',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
        ),
      ),
    );
  }
}
