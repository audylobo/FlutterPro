import 'package:drawer_menu/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database_service.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String _name = '';

  // Create user object
  User _userFromFirebaseUser(FirebaseUser user){    
    return user != null ? User(uid: user.uid, email: user.email , name: user.displayName, picture: user.photoUrl) : null;
  }

  // Auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // Sign in email/password
  Future signEmailIn(String email, String password) async {
    
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);      
      FirebaseUser user = result.user;

      //Obtain real name - TODO

      print('signed in OK');
      return _userFromFirebaseUser(user);

    } catch (e) {

      print('Sign in error: ' + e.toString());
      return null;
    }    
  }

  Future signInWithProvider() async {
    try {
      var result = await _googleSignIn.signIn();
      print(result);
    } catch (e) {

    }
  }

  // Register email/password
  Future signUpEmail(String email, String password, String name) async {

    try {
      
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password );
      FirebaseUser user = result.user;
      
      // Create user real name
      await DatabaseService(uid: user.uid).updateUserData(name);     
      _name = name; 

      print('signed up OK');
      return _userFromFirebaseUser(user);

    } catch (e) {
      print('Sign Up error: ' + e.toString());
      return null;
    }

  }

  Future<bool> forgotPwEmail(String email) async{
    
    try {

      await _auth.sendPasswordResetEmail(email: email); 
      
      return true;

    } catch (e) {
      print('Forgot PW error: ' + e.toString());
      return false;
    }

  }

  // Sign out
  Future singOut() async {

    try {
      print('Sign out OK');
      return await _auth.signOut();
    } catch (e) {
      print('Sign out error: ' + e.toString());
    }

  }

}