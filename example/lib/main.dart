import 'package:flutter/material.dart';

import 'package:diletta_modal/dilettaModals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diletta Modal Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Diletta Modal Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DilettaAlertModal modal = DilettaAlertModal(
                  modalColor: Color(0xffefefef),
                  title: 'ATENÇÃO!',
                  body:
                      'Teste de um body cheio de coisa escrita pra gente ficar bem feliz...',
                  buttonText: 'OK',
                );
                DilettaModal.openDilettaModal(context, modal);
              },
              child: Text('Abrir Modal'),
            ),
            ElevatedButton(
              onPressed: () {
                DilettaOptionsModal modal = DilettaOptionsModal(
                  modalColor: Color(0xffefefef).withOpacity(0.5),
                  title: 'ATENÇÃO!',
                  body:
                      'Teste de um body cheio de coisa escrita pra gente ficar bem feliz, mas dessa vez com uma escolha pra fazer',
                  cancelButtonText: 'VOLTAR',
                  confirmButtonText: 'INICIAR VIAGEM',
                  buttonFontColor: Colors.pink,
                  borderRadius: 14,
                );
                DilettaModal.openDilettaModal(context, modal).then((result) {
                  if (result == null) {
                  } else if (result == false) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Ops, você clicou na opção de cancelar'),
                        duration: Duration(seconds: 2)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Uhuuuuu, você clicou na opção de confirmar'),
                        duration: Duration(seconds: 2)));
                  }
                });
              },
              child: Text('Abrir Modal Opções'),
            )
          ],
        ),
      ),
    );
  }
}
