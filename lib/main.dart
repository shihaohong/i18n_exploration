import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(AppLocalizations.of(context).helloWorld()),
            Text(AppLocalizations.of(context).hello('International World')),
            Text(AppLocalizations.of(context).greeting('Greetings', 'Earthlings')),
            Text(AppLocalizations.of(context).helloWorlds(100)),
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Home(),
    );
  }
}

void main() {
  runApp(I18NDemoApp());
}