import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/demo_localizations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(DemoLocalizations.of(context).helloWorld()),
            Text(DemoLocalizations.of(context).hello('International World')),
            Text(DemoLocalizations.of(context).greeting('Greetings', 'Earthlings')),
            Text(DemoLocalizations.of(context).helloWorlds(100)),
          ],
        ),
      ),
    );
  }
}

class I18NDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      home: Home(),
    );
  }
}

void main() {
  runApp(I18NDemoApp());
}