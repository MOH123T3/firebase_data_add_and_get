import 'package:flutter/material.dart';
import 'package:form_view/provider/model.dart';
import 'package:form_view/provider/provider_controller.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderController(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Get Api data with Provider"),
          ),
          body: Center(
            child: Consumer<ProviderController>(
              builder: (context, value, child) {
                value.getData();

                return ListView.builder(
                    itemCount: value.userModelList.length,
                    itemBuilder: (context, index) {
                      print(index);
                      return ListTile(
                        subtitle:
                            Text(value.userModelList[index]['body'].toString()),
                        leading: Text(
                            value.userModelList[index]['email'].toString()),
                        title:
                            Text(value.userModelList[index]['name'].toString()),
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
