import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zido_app/provider/settings_provider.dart';
import 'package:zido_app/screen/home_screen.dart';
import 'package:zido_app/utils/app_providers.dart';
import 'package:zido_app/utils/cache_helper.dart';
import 'package:zido_app/utils/theme.dart';

import 'language/app_locale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,

            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            locale: Locale(settings.locale, ''),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // this method localeResolutionCallback return  device current locale
            localeResolutionCallback: (currentLocale, supportedLocales) {
              if (currentLocale != null) {
                print(currentLocale.languageCode);
                for (Locale locale in supportedLocales) {
                  if (currentLocale.languageCode == locale.languageCode) {
                    return currentLocale;
                  }
                }
              }
              return supportedLocales.first;
            },
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
