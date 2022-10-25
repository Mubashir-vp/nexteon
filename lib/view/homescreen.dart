import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netxone/model/model.dart';

import '../controller/homescreen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeScreenController>(
            init: HomeScreenController(),
            builder: (controller) {
              return FutureBuilder(
                future: controller.postCall(),
                builder: (
                  context,
                  AsyncSnapshot<Model?> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: ((context, index) {
                        return  Container(
                          color: Colors.grey,
                          height: 30,
                        );
                      }),
                      itemCount: snapshot.data!.data!.list!.length,
                      itemBuilder: ((context, index) {
                        return Table(
                         border:TableBorder.all(width: 3.0,color: Colors.black),
                          children: [
                            const TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                )),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Name"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Code"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Category Details name"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("URL"),
                                  ),
                                ]),
                            TableRow(
                                decoration: const BoxDecoration(
                                    border: Border(
                                  right: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                )),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Text(
                                        snapshot.data!.data!.list![index]!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Text(
                                        snapshot.data!.data!.list![index]!
                                            .code.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Text(
                                        snapshot.data!.data!.list![index]!.categoryDetails!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Text(
                                        snapshot.data!.data!.list![index]!.globalGalleryDetails!.url!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                ]),
                          ],
                        );
                      }),
                      // separatorBuilder: (context, index) {
                      //   return const SizedBox(
                      //     height: 50,
                      //   );
                      // },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}
