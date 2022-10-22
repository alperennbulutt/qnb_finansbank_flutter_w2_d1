// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnb_finansbank_flutter_w2_d1/controllers/getx_counter_controller.dart';

class GetxCounterPage extends StatelessWidget {
  GetxCounterPage({super.key});

  final controller = Get.put(GetxCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Counter Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Obx(
            () => Text(controller.sayi.value.toString()),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.sayi.value++;

          // Get.snackbar('Hi', 'i am a modern snackbar');
          print('pressed');
        },
      ),
    );
  }
}
