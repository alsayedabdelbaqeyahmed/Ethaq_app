import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveReuse {
 static Box mainBox = Hive.box(AppConst.mainBoxName);
}
