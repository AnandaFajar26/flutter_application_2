import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigation_controller.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text("Login", style: TextStyle(fontSize: 24)),
            SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 16),
            Obx(
              () => TextField(
                controller: passwordController,
                obscureText: isPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed:
                        () => isPasswordHidden.value = !isPasswordHidden.value,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Login', 'Login berhasil');
                navController.changeTab(1); // Berpindah ke Home
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}