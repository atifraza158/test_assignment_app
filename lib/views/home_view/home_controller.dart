import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;

  @override
  void onInit() {
    super.onInit();
    userId = auth.currentUser!.uid;
  }
}
