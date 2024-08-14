import 'dart:convert';

import 'package:ecb_kyc_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController controller;

  @override
  initState() {
    super.initState();
    requestPermissions();

    controller =
        WebViewController(onPermissionRequest: (request) => request.grant())
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse("https://kyc-energ.redriverapps.net"))
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (NavigationRequest request) async {
                final Uri uri = Uri.parse(request.url);
                if (uri.path.startsWith('/finalResult/success/')) {
                  // Extracting the UUID from the URL path
                  final uuid = uri.pathSegments.last;
                  print('UUID extracted: $uuid');

                  // Make the HTTP call to the KYC details endpoint
                  final kycData = await fetchKycDetails(uuid);

                  // Navigate to the ResultScreen to display the result
                  if (mounted && kycData != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                            kycResult: kycData['result'],
                            kycDetails: kycData['kycDetails']),
                      ),
                    );
                  }

                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },
            ),
          );
  }

  Future<void> requestPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.storage.request();
  }

  Future<Map<String, dynamic>?> fetchKycDetails(String operationId) async {
    final response = await http.get(Uri.parse(
        'https://kyc-energ.redriverapps.net/external/kyc/details/$operationId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load KYC details');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
