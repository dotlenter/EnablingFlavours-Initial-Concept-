import 'app_config.dart';
import 'main.dart';
import 'main_base.dart';

void main() {
  const configuredApp = AppConfig(
    appName: 'Gaano Katagal Dev',
    apiBaseUrl: 'https://app-mobileapiv2-test.azurewebsites.net/api/',
    buildFlavor: 'dev',
    child: App(),
  );
  runMain(configuredApp);
}
