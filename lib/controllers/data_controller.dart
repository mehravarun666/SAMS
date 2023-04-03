import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sams/controllers/auth_controller.dart';


class DataController extends GetxController{

  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'joinDate': ''};

  AuthController authController= AuthController();

  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
   
    try {
      var response = await firebaseInstance
          .collection('userslist')
          .where('user_Id', isEqualTo: authController.userid)
          .get();
      
      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['user_name'];
        userProfileData['joinDate'] = response.docs[0]['joinDate'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}