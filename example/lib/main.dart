// ignore_for_file: avoid_print

import 'package:country_picker/country_picker.dart';
import 'package:country_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      supportedLocales: [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountryPicker Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CountryPicker(
              onChanged: print,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: 'IT',
              favorite: const ['+39', 'FR'],
              countryFilter: const ['IT', 'FR'],
              showFlagDialog: false,
              comparator: (a, b) {
                final bName = b.name ?? '';
                final aName = a.name ?? '';
                return bName.compareTo(aName);
              },
              //Get the country information relevant to the initial selection
              onInit: (code) => print(
                "on init ${code?.name} ${code?.dialCode} ${code?.name}",
              ),
            ),
            CountryPicker(
              onChanged: print,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: 'IT',
              favorite: const ['+39', 'FR'],
              countryFilter: const ['IT', 'FR'],
              // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
              flagDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            const SizedBox(
              width: 400,
              height: 60,
              child: CountryPicker(
                onChanged: print,
                hideMainText: true,
                showFlagMain: true,
                showFlag: false,
                initialSelection: 'TF',
                hideSearch: true,
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                alignLeft: true,
              ),
            ),
            SizedBox(
              width: 400,
              height: 60,
              child: CountryPicker(
                onChanged: (e) => print(e.toLongString()),
                initialSelection: 'TF',
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                favorite: const ['+39', 'FR'],
              ),
            ),
            SizedBox(
              width: 100,
              height: 60,
              child: CountryPicker(
                enabled: false,
                onChanged: (c) => c.name,
                initialSelection: 'TF',
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                favorite: const ['+39', 'FR'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
