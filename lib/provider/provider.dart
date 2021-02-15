import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../const.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeNotifier()),
];
