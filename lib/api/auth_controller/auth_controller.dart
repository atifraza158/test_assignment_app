import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_assignment_app/views/auth_views/signin_view/signin_view.dart';
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
        Get.offAll(() => SigninView());
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

  // Login with Google
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot userDoc =
            await firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          await firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'full_name': user.displayName ?? '',
            'email': user.email ?? '',
            'practitioner_type': '',
            'country': '',
            'created_at': FieldValue.serverTimestamp(),
          });
        }

        Get.offAll(() => NavbarView());
        Get.snackbar(
          'Login Success',
          'Welcome, ${user.displayName ?? 'User'}!',
        );
      } else {
        Get.snackbar('Login Failed', 'Something went wrong.');
      }
    } on FirebaseAuthException catch (e) {
      print("GoogleSigninException: $e");
      Get.snackbar('Google Login Failed', e.message ?? 'An error occurred');
    } catch (e) {
      loader(false);
      print("Exception: $e");
      Get.snackbar('Error', e.toString());
    }
  }
}
