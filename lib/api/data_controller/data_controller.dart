import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var loader = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;

  Future<void> saveFeature({
    required String featureName,
    required String categoryName,
    required String userId,
    required String description,
  }) async {
    try {
      loader(true);
      DocumentReference docRef = _firestore.collection('Features').doc();

      final Timestamp timestamp = Timestamp.now();

      Map<String, dynamic> featureData = {
        'featureName': featureName,
        'categoryName': categoryName,
        'userId': userId,
        'description': description,
        'createdAt': timestamp,
        'updatedAt': timestamp,
      };

      await docRef.set(featureData);
      Get.snackbar("Success", "New Feature Added Successfully.");

      loader(false);
    } catch (e) {
      loader(false);
      rethrow;
    }
  }

  @override
  void onInit() {
    super.onInit();
    userId = auth.currentUser?.uid;
      }

  // Get Data
  Future<Stream<QuerySnapshot>> getData(String collectionName) async {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }

}
