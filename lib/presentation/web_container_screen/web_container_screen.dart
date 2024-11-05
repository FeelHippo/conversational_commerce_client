import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:stadtplan/presentation/widgets/app_webview.dart';
import 'package:stadtplan/presentation/widgets/circular_progress_bar.dart';
import 'package:stadtplan/presentation/widgets/components/app_bar_general.dart';
import 'package:stadtplan/presentation/widgets/custom_navigator.dart';

class WebContainerScreen extends StatefulWidget {
  const WebContainerScreen({
    super.key,
    required this.url,
    this.headers = const <String, String>{},
    required this.onClosed,
    this.funcBackPressCallBack,
    this.funcUrlCallBack,
    this.imageLogoUrl = '',
    this.headerTitle = '',
    this.serverTrustAuthResponseAction,
    this.checkCurrentRoute = true,
  });

  final String url;
  final VoidCallback onClosed;
  final bool checkCurrentRoute;
  final Map<String, String> headers;
  final Function? funcUrlCallBack;
  final Function? funcBackPressCallBack;
  final bool? serverTrustAuthResponseAction;
  final String? imageLogoUrl;
  final String? headerTitle;

  @override
  _WebContainerScreenState createState() => _WebContainerScreenState();
}

class _WebContainerScreenState extends State<WebContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        widget.onClosed();
      },
      child: widget.checkCurrentRoute
          ? Consumer<ChangeRouteEvent>(
              builder: (
                BuildContext context,
                ChangeRouteEvent value,
                Widget? child,
              ) {
                final ModalRoute<Object?>? route = ModalRoute.of(context);
                Widget initialChild;
                if (value.currentRoute == route) {
                  initialChild = const Center(child: CircularProgressBar());
                } else {
                  initialChild = const SizedBox();
                }
                return AppWebView(
                  url: widget.url,
                  showCustomAppBar: true,
                  serverTrustAuthResponseAction:
                      widget.serverTrustAuthResponseAction,
                  urlChanged: (String url) {},
                  webviewCallBack: (InAppWebViewController controller) {},
                  onLoadStopCallBack: (String url) {},
                  onLoadError: (String url, String message, String code) {},
                  headers: widget.headers,
                  funcUrlCallBack: widget.funcUrlCallBack,
                  funcBackPressCallBack: widget.funcBackPressCallBack,
                  initialChild: initialChild,
                  appBar: AppBarGeneral(
                    logoUrl: widget.imageLogoUrl,
                    title: widget.headerTitle,
                  ),
                );
              },
            )
          : AppWebView(
              url: widget.url,
              urlChanged: (String url) {},
              webviewCallBack: (InAppWebViewController controller) {},
              onLoadStopCallBack: (String url) {},
              onLoadError: (String url, String message, String code) {},
              headers: widget.headers,
              funcUrlCallBack: widget.funcUrlCallBack,
              funcBackPressCallBack: widget.funcBackPressCallBack,
              initialChild: const Center(child: CircularProgressBar()),
              //appBar: AppBarGeneral(logoUrl: widget.imageLogoUrl,title: widget.headerTitle),
            ),
    );
  }
}
