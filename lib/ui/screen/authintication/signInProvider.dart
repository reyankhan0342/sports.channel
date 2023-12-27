import 'package:com.sports.channel/ui/customWidgets/Utils.dart';
import 'package:com.sports.channel/ui/customWidgets/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SiginInProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  var id;
  void isLogin(BuildContext context, email, password) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              SessionController().UsserId = value.user!.uid.toString(),
              Utils.toastMassage('user successfully login '),
            })
        .onError((error, stackTrace) => {
              Utils.toastMassage(error.toString()),
            });
    notifyListeners();
  }

  /// obcecure passowrd
  bool password = true;
}
