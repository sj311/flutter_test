import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, Key? key}): super(key: key);

  final WebViewController controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState(controller);
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  _WebViewStackState(WebViewController controller) : super() {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.addJavaScriptChannel('SnackBar',
        onMessageReceived: (JavaScriptMessage message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message.message)));
    });

    controller.setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {
        setState(() {
          loadingPercentage = progress;
        });
      },
      onPageStarted: (String url) {
        setState(() {
          loadingPercentage = 0;
        });
      },
      onPageFinished: (String url) {
        print('onPageFinished: $url');
        setState(() {
          loadingPercentage = 100;
        });
      },
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          final host = Uri.parse(request.url).host;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Blocking navigation to $host',
              ),
            ),
          );
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ));
    controller.loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100 || true)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
            semanticsLabel: '로딩중...',
          ),
      ],
    );
  }
}
