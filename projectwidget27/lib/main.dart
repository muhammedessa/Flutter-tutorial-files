import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  bool _isloading = true;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  void _loadFile() async{
    _pdfViewerKey.currentState?.openBookmarkView();
    setState(() {
      _isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _isloading? const Center( child: CircularProgressIndicator(),)
          : SfPdfViewer.asset( 'assets/laplace.pdf',
        key: _pdfViewerKey,
      ),
      // SfPdfViewer.network(
      //   'https://web.stanford.edu/~boyd/ee102/laplace.pdf',
      //   key: _pdfViewerKey,
      // ),

     );
  }
}
