import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virtual_chat_assistant/src/constants/app_vars.dart';

import 'package:virtual_chat_assistant/src/feature/settings/screens/settings_screens.dart';

import 'package:virtual_chat_assistant/src/feature/splash/screens/splash_screen.dart';
import 'package:virtual_chat_assistant/src/router/router.dart';
import 'package:virtual_chat_assistant/src/utils/theme/theme.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsViewModel.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  // await LocalData.getInstance.init();
  runApp(ProviderScope(
    child: MyApp(
      navigatorKey: navigatorKey,
    ),
  ));
}

// Future initialization(BuildContext? context) async {
//   ///load resources
//   await Future.delayed(Duration(seconds: 3));

// }

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //close the keypad whenever the user taps on an inactive widget
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: AnimatedBuilder(
          animation: settingsViewModel,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              darkTheme: BotTheme.darkTheme,
              themeMode: settingsViewModel.themeMode,
              theme: BotTheme.lightTheme,
              initialRoute: BotRoutes.settings,
              onGenerateRoute: (RouteSettings settings) {
                return BotRoutes.fadeThrough(settings, (context) {
                  switch (settings.name) {
                    case BotRoutes.splash:
                      return const Splash();
                    case BotRoutes.main:
                      return const RouterOffline();
                    case BotRoutes.settings:
                      return SettingsView(
                        viewModel: settingsViewModel,
                        navigatorKey: navigatorKey,
                      );
                    default:
                      return const RouterOffline();
                  }
                });
              },
            );
          }),
    );
  }
}
