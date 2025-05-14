import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final follower = 0.obs;
  final following = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 16),
          Text("Nama: Ananda Fajar Saputra"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Column(
                  children: [
                    Text("Follower"),
                    Text("${follower.value}"),
                    IconButton(
                      onPressed: () => follower.value++,
                      icon: Icon(Icons.person_add),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Column(
                  children: [
                    Text("Following"),
                    Text("${following.value}"),
                    IconButton(
                      onPressed: () => following.value++,
                      icon: Icon(Icons.group_add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}