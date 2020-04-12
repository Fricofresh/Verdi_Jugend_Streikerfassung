import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:verdi_jugend_streikerfassung/sites/thanksForJoiningPage.dart';
import 'package:verdi_jugend_streikerfassung/widgets/baseLayout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BecomeMemberPage extends StatefulWidget {
  static const String routeId = "/becomeMember";

  @override
  _BecomeMemberPageState createState() => _BecomeMemberPageState();
}

class _BecomeMemberPageState extends State<BecomeMemberPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  bool _isRegistert = false;
  var initUrl = "https://mitgliedwerden.verdi.de/beitritt/verdi";

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Mitgliederwerden",
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x000),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: WebView(
              initialUrl: initUrl,
              onWebViewCreated: (WebViewController c) {
                _controller.complete(c);
              },
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (f) => _onChangeWebsiteListener(),
            ),
          ),
        ),
        RaisedButton(
          child: Text("weiter"),
          onPressed: _isRegistert
              ? () => goToNextPage()
              : kDebugMode ? () => goToNextPage() : null,
        ),
      ],
    );
  }

  Future _onChangeWebsiteListener() async {
    _controller.future.then(
      (value) async {
        if (await value.currentUrl() != initUrl) {
          setState(() {
            _isRegistert = true;
            goToNextPage();
          });
        }
      },
    );
  }

  void goToNextPage() {
    Navigator.pushNamed(context, ThanksForJoiningPage.routeId);
  }
}
