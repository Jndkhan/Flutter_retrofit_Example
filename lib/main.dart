import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi_users/bindings/initial_binding.dart';
import 'package:mockapi_users/network/viewmodels/homeviewmodel/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        initialRoute: '/home',
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/home', page: () => const Home())
        ],
      );

  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (controller){
      return Scaffold(
        body: (controller.userResponse.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading:
              Text(controller.userResponse[index].id.toString()),
              title: Text(
                  controller.userResponse[index].name.toString()),
              subtitle: Text(
                  controller.userResponse[index].email.toString()),
              onTap: () {
                Get.dialog(AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 5),
                  content: Wrap(
                    children: [
                      Container(
                          child: Column(
                            children: [
                              Text(
                                controller.userResponse[index].name!,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.userResponse[index].email!,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: Colors.redAccent,
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  MaterialButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: Colors.green,
                                      child: const Text("Ok"))
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ));
              },
            );
          },
          itemCount: controller.userResponse.length,
        ),
      );
    });
  }
}

