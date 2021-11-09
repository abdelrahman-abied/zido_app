import '/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
  ),
];
