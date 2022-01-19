import 'dart:io';

import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebase(User? user) {
    return user != null ? UserModel(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? _firebaseUser = result.user;
      return _userFromFirebase(_firebaseUser);
     } on FirebaseAuthException catch (e) {
      throw (e.message.toString());
    } on SocketException {
      throw ("Not internet connection");
    } on HttpException {
      throw ("Silahkan Ulangi kembali");
    } on FormatException {
      throw ("Silahkan Ulangi kembali");
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? _firebaseUser = result.user;
      return _userFromFirebase(_firebaseUser);
    } on FirebaseAuthException catch (e) {
      throw (e.message.toString());
    } on SocketException {
      throw ("Not internet connection");
    } on HttpException {
      throw ("Silahkan Ulangi kembali");
    } on FormatException {
      throw ("Silahkan Ulangi kembali");
    }
  }

  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.message.toString());
    } on SocketException {
      throw ("Not internet connection");
    } on HttpException {
      throw ("Silahkan Ulangi kembali");
    } on FormatException {
      throw ("Silahkan Ulangi kembali");
    }
  }
}
