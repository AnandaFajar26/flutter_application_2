import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var quantity = 1.obs;
  final int price = 15000;

  int get totalPrice => quantity.value * price;
  void increment() => quantity.value++;
}

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coca Cola",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Harga: Rp ${controller.price}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Jumlah: ${controller.quantity.value} pcs"),
                        ElevatedButton(
                          onPressed: controller.increment,
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      "Total: Rp ${controller.totalPrice}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}