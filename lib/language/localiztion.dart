import 'package:get/route_manager.dart';
import 'package:shopapp/language/ar.dart';
import 'package:shopapp/language/en.dart';
import 'package:shopapp/language/fr.dart';

import '../utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: english,
        frf: french,
        ara: arabic,
      };
}
