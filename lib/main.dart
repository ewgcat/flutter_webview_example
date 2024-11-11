import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController webViewController = WebViewController();
  WebViewController webViewController2 = WebViewController();
  WebViewController webViewController3 = WebViewController();
@override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/teamofuser.html');  
    webViewController2 = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/index.html');
    webViewController3 = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://udedgg-test.sookcash.com/vdltvzsh5/personalDataPolicy.html'));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
              child: const Text('loadFlutterAsset :assets/html/teamofuser.html',)),
          Container(
              height: 200,
              child: WebViewWidget(controller:webViewController)),
          Container(
              margin: const EdgeInsets.all(10),child: const Text('loadFlutterAsset :assets/html/index.html')),
          Container(
              height: 200,child: WebViewWidget(controller:webViewController2)),
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text('loadRequest :https://udedgg-test.sookcash.com/vdltvzsh5/personalDataPolicy.html')),
          Container(
              height: 200,child: WebViewWidget(controller:webViewController3)),
        ],
      ),
    );
  }
}
