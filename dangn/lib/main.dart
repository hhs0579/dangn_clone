import 'package:beamer/beamer.dart';
import 'package:dangn/router/locations.dart';
import 'package:dangn/screens/start_screen.dart';
import 'package:dangn/screens/splash_screen.dart';
import 'package:dangn/states/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:dangn/utils/logger.dart';
import 'package:provider/provider.dart';

final _routerDelegate = BeamerDelegate(guards: [
  BeamGuard(
      pathBlueprints: ['/'],
      check: (context, location) {
        return context.watch<UserProvider>().userState;
      },
      showPage: BeamPage(child: StartScreen()))
], locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));
void main() {
  logger.d('my first log by logger!!');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 1000), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error occur while loading');
      return Text('error occur');
    } else if (snapshot.hasData) {
      return DangnApp();
    } else {
      return SplashScreen();
    }
  }
}

class DangnApp extends StatelessWidget {
  const DangnApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) {
        return UserProvider();
      },
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'DoHyeon',
          hintColor: Colors.grey[350],
          textTheme: TextTheme(
            headline3: TextStyle(
              fontFamily: 'DoHyeon',
            ),
            button: TextStyle(color: Colors.white),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            backgroundColor: Colors.orange,
            primary: Colors.white,
            minimumSize: Size(48, 48),
          )),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 2,
              toolbarTextStyle: TextStyle(color: Colors.black87)),
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
