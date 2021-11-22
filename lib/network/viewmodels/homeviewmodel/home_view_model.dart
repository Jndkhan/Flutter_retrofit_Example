import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mockapi_users/network/api_service/api_service.dart';
import 'package:mockapi_users/network/user_response/user_response.dart';

class HomeViewModel extends GetxController {
  List<UserResponse> userResponse = [];

  final _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    print('Calling methods');

    getAllUsers(onSuccess: (users) {
      userResponse = users;
      update();
    });
  }

  getAllUsers(
      {Function()? beforeSend,
      Function(List<UserResponse> data)? onSuccess,
      Function(dynamic erro)? onError}) async {
    ApiService apiService = ApiService(_dio);

    await apiService.getAllUsers().then((users) {
      if (beforeSend != null) {
        print('before send');
        beforeSend;
      }
      if (onSuccess != null) {
        print('onsuccess call');
        onSuccess(users);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        print('onerrorr call: $error');
      }
    });
  }
}
