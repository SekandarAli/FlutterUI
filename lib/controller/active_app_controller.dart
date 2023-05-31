import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActiveAppController extends GetxController{
  RxInt activeApp = 1.obs;

  Future<void> changeActiveApp(int newActiveApp) async {
    activeApp.value = newActiveApp;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("statusValue", newActiveApp);
  }
}