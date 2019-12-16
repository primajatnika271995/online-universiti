import 'package:get_it/get_it.dart';
import 'package:online_university/src/utils/shared_preferences_helper.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  SharedPreferencesHelper sharedPreferencesHelper = await SharedPreferencesHelper.getInstance();
  locator.registerSingleton<SharedPreferencesHelper>(sharedPreferencesHelper);
}