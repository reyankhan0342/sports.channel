// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:com.sports.channel/ui/customWidgets/Utils.dart';
import 'package:com.sports.channel/ui/customWidgets/session_manager.dart';
import 'package:com.sports.channel/ui/screen/authintication/signUpModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  ///  Sigin Up  firebase database Work

  /// authintication ////
  FirebaseAuth auth = FirebaseAuth.instance;

  //var name, email, number, password;
  void siginUp(passowrd, email) {
    print(email.toString() + "=========>>>");
    auth
        .createUserWithEmailAndPassword(email: email, password: passowrd)
        .then((value) {
      SessionController().UsserId = value.user!.uid.toString();
      print(SessionController().UsserId.toString() + "=========>>> user id");

      Utils.toastMassage('user successFully Register');
    }).onError((error, stackTrace) {
      Utils.toastMassage(error.toString());
    });
    notifyListeners();
  }

  void storeData(name, email, password, phoneNumber) async {
    final uidd = await SessionController().UsserId;
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference users = firestoreInstance.collection('Users');
    SignUpModel model = SignUpModel(
      email: email,
      password: password,
      userId: uidd.toString(),
      username: name,
      phoneNumber: phoneNumber,
    );
    print("lkanajfbkajfakfakfaks==========>>>>>>" + uidd.toString());
    print("lkanajfbkajfakfakfaks==========>>>>>>" + name.toString());
    print("lkanajfbkajfakfakfaks==========>>>>>>" + email.toString());
    print("lkanajfbkajfakfakfaks==========>>>>>>" + password.toString());
    print("lkanajfbkajfakfakfaks==========>>>>>>" + phoneNumber.toString());
    try {
      await users.doc(uidd.toString()).set(model.toJson());
      Utils.toastMassage('Data stored in Firestore successfully');
    } catch (error) {
      Utils.toastMassage('Error: $error');
    }

    notifyListeners();
  }

  /// password visibility
  bool retypepassword = true;
  bool createpassword = true;

  /// login in firebase Auth //
}
