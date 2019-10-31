import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'messages_all.dart';
/// Callers can lookup localized strings with an instance of DemoLocalizations returned
/// by `DemoLocalizations.of(context)`.
///
/// Applications need to include `DemoLocalizations.delegate()` in their app's
/// loclalizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// return MaterialApp(
///   localizationsDelegates: <LocalizationsDelegate<dynamic>>[
///     DemoLocalizations.delegate(),
///     GlobalMaterialLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
///   ],
///   supportedLocales: const <Locale>[
///     Locale('en', 'US'),
///     Locale('es', 'ES'),
///   ],
///   home: MyApplicationHome(),
/// );
/// ```
class DemoLocalizations {
  DemoLocalizations(Locale locale) : _localeName = locale.toString();
  final String _localeName;
  static Future<DemoLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString())
      .then<DemoLocalizations>((void _) => DemoLocalizations(locale));
  }
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }
  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();
  String helloWorld() {
    return Intl.message(
      'Hello World',
      locale: _localeName,
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting'
    );
  }

  String hello(Object world) {
    return Intl.message(
      'Hello $world',
      locale: _localeName,
      name: 'hello',
      desc: 'A message with a single parameter',
      args: [world]
    );
  }

  String greeting(Object hello, Object world) {
    return Intl.message(
      '$hello $world',
      locale: _localeName,
      name: 'greeting',
      desc: 'A message with a two parameters',
      args: [hello, world]
    );
  }

  String helloWorlds(int count) {
    return Intl.plural(
      count,
      locale: _localeName,
      name: 'helloWorlds',
      args: [count],
      zero: 'Hello',
      one: 'Hello World',
      two: 'Hello two worlds',
      few: 'Hello $count worlds',
      many: 'Hello all $count worlds',
      other: 'Hello other $count worlds'
    );
  }

}
class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalizationsDelegate();
  @override
  Future<DemoLocalizations> load(Locale locale) => DemoLocalizations.load(locale);
  @override
  bool isSupported(Locale locale) => ['es', 'en'].contains(locale.languageCode);
  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}
