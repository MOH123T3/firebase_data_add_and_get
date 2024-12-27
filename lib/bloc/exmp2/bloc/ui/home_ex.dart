import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_view/bloc/exmp2/bloc/get_data_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  GetDataBloc dataBloc = GetDataBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataBloc.add(InitGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<GetDataBloc, GetDataState>(
        bloc: dataBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.runtimeType == OnLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.runtimeType == OnSuccessState) {
            var data = state as OnSuccessState;
            return Center(
                child: ListView.builder(
              itemCount: data.userData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                        leading: Text("Id : ${data.userData[index]['id']}"),
                        title: Text("Name : ${data.userData[index]['name']}"),
                        subtitle:
                            Text("Email : ${data.userData[index]['email']}")),
                  ),
                );
              },
            ));
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
