import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaano_katagal/modules/date/page/date_page.dart';
import 'package:get_it/get_it.dart';

import 'app_config.dart';
import 'widgets/debug_banner/debug_banner.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return FutureBuilder(
      future: _initializeDependencies(),
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const DatePage(),
          builder: (context, widget) {
            final showDebugBanner =
                AppConfig.of(context)?.buildFlavor == 'qa' ||
                    AppConfig.of(context)?.buildFlavor == 'dev';

            return Stack(
              children: [
                widget!,
                showDebugBanner ? _buildDebugBanner(context) : const SizedBox(),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _initializeDependencies() async {
    await GetIt.instance.allReady();
  }

  Widget _buildDebugBanner(BuildContext context) {
    return const Positioned(
      left: 5,
      bottom: 5,
      child: SafeArea(
        child: DebugBanner(),
      ),
    );
  }
}
