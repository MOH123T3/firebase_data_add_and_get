import 'package:flutter/material.dart';
import 'package:form_view/bloc/exmp2/bloc/ui/home_ex.dart';
import 'package:form_view/bloc/ui/home_screen.dart';
import 'package:form_view/getx/ui/home_page.dart';
import 'package:form_view/provider/home_provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            // ignore: avoid_unnecessary_containers
            return InkWell(
              onTap: () {
                print(index);
                if (index == 0) {
                  Get.to(MyHome());
                } else if (index == 1) {
                  Get.to(GetXHomePage());
                } else {
                  Get.to(PostsPage());
                }
              },
              child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.amberAccent,
                child: Text(index == 0
                    ? "provider"
                    : index == 1
                        ? "getX "
                        : index == 2
                            ? "streams"
                            : "BLoc"),
              ),
            );
          },
        ),
      ),
    );
  }
}
