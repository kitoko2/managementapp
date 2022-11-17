import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthentificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AuthentificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
