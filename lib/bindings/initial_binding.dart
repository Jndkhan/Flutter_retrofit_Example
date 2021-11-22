import 'package:get/get.dart';
import 'package:mockapi_users/network/viewmodels/homeviewmodel/home_view_model.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }

}