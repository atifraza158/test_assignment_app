import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_assignment_app/views/navbar_view/navbar_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var loader = false.obs;

  // Observable user
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    super.onInit();
  }

  // ------------------ SIGN UP METHOD ------------------
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String practitionerType,
    required String country,
  }) async {
    try {
      loader(true);
      UserCredential userCred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCred.user;
      if (user != null) {
        loader(false);
        await firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'full_name': fullName,
          'email': email,
          'practitioner_type': practitionerType,
          'country': country,
          'created_at': FieldValue.serverTimestamp(),
        });

        Get.snackbar('Success', 'Account created successfully!');
      }
    } on FirebaseAuthException catch (e) {
      loader(false);
      Get.snackbar('Signup Failed', e.message ?? 'An error occurred');
    } catch (e) {
      loader(false);
      Get.snackbar('Error', e.toString());
    }
  }

  // ------------------ LOGIN METHOD ------------------
  Future<void> login({required String email, required String password}) async {
    try {
      loader(true);
      await auth.signInWithEmailAndPassword(email: email, password: password);
       Get.to(() => NavbarView());
      Get.snackbar('Login Success', 'Welcome back!');
      loader(false);
    } on FirebaseAuthException catch (e) {
      loader(false);
      Get.snackbar('Login Failed', e.message ?? 'Invalid credentials');
    } catch (e) {
      loader(false);
      Get.snackbar('Error', e.toString());
    }
  }

  // ------------------ LOGOUT METHOD ------------------
  Future<void> logout() async {
    await auth.signOut();
  }
}
