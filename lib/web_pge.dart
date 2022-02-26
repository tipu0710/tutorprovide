import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:developer';

class WebWidget extends StatefulWidget {
  final String url;

  const WebWidget({Key? key, this.url = "https://tutorprovide.com"})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebWidget();
  }
}

class _WebWidget extends State<WebWidget> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isLoading = true;
  bool isLoadFirstTime = true;
  bool isInternet = true;
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      checkInternetStatus(result);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isInternet
        ? WillPopScope(
            onWillPop: () async {
              if (webViewController != null &&
                  await webViewController!.canGoBack()) {
                await webViewController!.goBack();
                return false;
              } else {
                Navigator.pop(context);
                return true;
              }
            },
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                body: Stack(
                  children: [
                    WebView(
                      initialUrl: widget.url,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onProgress: (pro) {
                        if (isLoading && pro == 100) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    if (isLoading)
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: SpinKitRipple(
                            size: 150,
                            itemBuilder: (_, int index) {
                              return const DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.green,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Image.asset(
                "assets/internet.png",
                height: (MediaQuery.of(context).size.height * 0.3),
              ),
            ),
          );
  }

  void checkInternetStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() {
          isInternet = true;
        });
        break;
      case ConnectivityResult.mobile:
        setState(() {
          isInternet = true;
        });
        break;
      case ConnectivityResult.none:
        setState(() {
          isInternet = false;
          isLoadFirstTime = true;
        });
        break;
      default:
        setState(() => isInternet = true);
        break;
    }
  }
}
