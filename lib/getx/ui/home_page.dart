import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_view/getx/controller/user_controller.dart';
import 'package:get/get.dart';

class GetXHomePage extends StatelessWidget {
  const GetXHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<UserController>(UserController());
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () {
            controller.getData();
            if (controller.userModelList.isNotEmpty) {
              return ListView.builder(
                  itemCount: controller.userModelList.length,
                  itemBuilder: (context, Index) {
                    print(controller.userModelList[Index].image);
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12),
                      child: ListTile(
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(controller
                                .userModelList[Index].image
                                .toString()),
                          ),
                        ),
                        title:
                            Text(controller.userModelList[Index].title ?? "_"),
                        subtitle: Text(
                          controller.userModelList[Index].description ?? "_",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                            '\$' + "${controller.userModelList[Index].price}"),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
