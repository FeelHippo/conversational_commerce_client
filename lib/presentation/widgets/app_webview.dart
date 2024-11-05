import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stadtplan/presentation/navigation/app_navigator.dart';
import 'package:stadtplan/presentation/widgets/components/app_bar_general.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({
    super.key,
    required this.url,
    this.appBar,
    this.initialChild,
    this.appCacheEnabled = true,
    this.clearCache = false,
    this.clearCookies = false,
    this.urlChanged,
    required this.webviewCallBack,
    required this.onLoadStopCallBack,
    required this.onLoadError,
    this.funcUrlCallBack,
    this.funcBackPressCallBack,
    this.headers = const <String, String>{},
    this.showCustomAppBar = false,
    this.shouldOverrideUrlLoading,
    this.roundLogoUrl,
    this.serverTrustAuthResponseAction,
  });

  final String url;
  final PreferredSizeWidget? appBar;
  final Widget? initialChild;
  final bool appCacheEnabled;
  final bool clearCache;
  final bool clearCookies;
  final Map<String, String> headers;
  final void Function(String)? urlChanged;
  final void Function(InAppWebViewController) webviewCallBack;
  final void Function(String) onLoadStopCallBack;
  final void Function(String, String, String) onLoadError;
  final Function? funcUrlCallBack;
  final Function? funcBackPressCallBack;
  final bool showCustomAppBar;
  final bool? serverTrustAuthResponseAction;
  final Future<NavigationActionPolicy?> Function(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  )? shouldOverrideUrlLoading;
  final String? roundLogoUrl;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {

  final GlobalKey webViewKey = GlobalKey();
  bool isSuccess = false;
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showCustomAppBar
          ? widget.appBar
          : AppBarGeneral(
              backPressCallBack: () {
                if (widget.funcBackPressCallBack != null) {
                  widget.funcBackPressCallBack!();
                } else {
                  AppNavigator.doPopUp(context);
                }
              },
            ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest:
            URLRequest(url: Uri.parse(widget.url), headers: widget.headers),
        initialOptions: options,
        onWebViewCreated: (InAppWebViewController controller) {
          webViewController = controller;
          widget.webviewCallBack(webViewController!);
        },
        shouldOverrideUrlLoading: widget.shouldOverrideUrlLoading,
        androidOnPermissionRequest: (
          InAppWebViewController controller,
          String origin,
          List<String> resources,
        ) async {
          return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT,
          );
        },
        onReceivedServerTrustAuthRequest: (
          InAppWebViewController controller,
          URLAuthenticationChallenge challenge,
        ) async {
          if (Platform.isAndroid) {
            return ServerTrustAuthResponse(
              action: widget.serverTrustAuthResponseAction!
                  ? ServerTrustAuthResponseAction.PROCEED
                  : ServerTrustAuthResponseAction.CANCEL,
            );
          }
          return null;
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) async {
          widget.onLoadStopCallBack(url.toString());
        },
        onLoadError: (
          InAppWebViewController controller,
          Uri? url,
          int code,
          String message,
        ) {
          widget.onLoadError(url.toString(), message, code.toString());
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {},
        onUpdateVisitedHistory: (
          InAppWebViewController controller,
          Uri? url,
          bool? androidIsReload,
        ) {
          Fimber.d('URL $url');
          widget.urlChanged?.call(url.toString());
        },
        onConsoleMessage: (
          InAppWebViewController controller,
          ConsoleMessage consoleMessage,
        ) {},
        gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
            EagerGestureRecognizer.new,
          ),
        },
      ),
    );
  }
}
