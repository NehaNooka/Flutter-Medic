import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );
// GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }


  // GET CURRENT USER
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }


  // Email & Password Sign Up
  Future createUserWithEmailAndPassword(
      String email, String password, String name) async {
    AuthResult authResult =await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  return authResult;
  }
  Future createUser(email, password, displayName) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Firestore.instance.collection('users').document().setData({
      'name': displayName,
      'email': email,
      'password':password
    });
return getCurrentUID();
  }


  // Email & Password Sign In
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult authResult =await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return authResult;
    }catch(e){
      print(e);
    }
  }
  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

}

class NameValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Name can't be empty!";
    }
    if(value.length < 2) {
      return "Name must be at least 2 characters long!";
    }
    if(value.length > 50) {
      return "Name must be less than 50 characters long!";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Email can't be empty!";
    }
    if(!value.contains('@')){
      return 'Please enter a valid email address!';
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if(value.isEmpty) {
      return "Password can't be empty!";
    }
    if(value.length<8) {
      return "Password must be atleast 8 digit!";
    }
    return null;
  }
}