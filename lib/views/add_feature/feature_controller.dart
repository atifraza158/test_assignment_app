import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeatureController extends GetxController {
  var featureName = TextEditingController();
  var categoryName = TextEditingController();
  var description = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;

  @override
  void onInit() {
    super.onInit();
    userId = auth.currentUser?.uid;
  }
}
