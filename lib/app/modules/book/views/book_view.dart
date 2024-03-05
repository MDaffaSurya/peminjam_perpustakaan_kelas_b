import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${state[index].judul}",
              style: TextStyle(fontSize: 18),
              ) ,
              subtitle: Text("Penulis: ${state[index].penulis}",
                style: TextStyle(fontSize: 14),
              ),
              trailing: ElevatedButton(
                child: Text("Pinjam"),
                onPressed: (){
                  Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                    'id': (state[index].id??0).toString(),
                    'judul': state[index].judul??"-"
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                      onPrimary: Colors.white,
                  padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        ))
    );
  }
}
