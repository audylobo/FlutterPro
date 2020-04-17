import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'database_service.dart';

class RegisterData {

  String name;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String phone;

  RegisterData({this.lastName, this.password, this.confirmPassword, this.phone, this.name, this.email});
}

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin facebookSignIn = FacebookLogin();

  // Create user object
  User _userFromFirebaseUser(FirebaseUser user){    
    return user != null ? User(uid: user.uid , email: user.email , name: user.displayName, picture: user.photoUrl) : null;
  }

  // Auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // Sign in email/password
  Future<User> signEmailIn(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);      
    FirebaseUser user = result.user;

    print('signed in OK');
    return _userFromFirebaseUser(user); 
  }

  Future<User> signInWithGoogle() async {
    // CERTIFICADO: 4F:BB:A2:5E:C0:5D:80:A1:53:5D:EF:E6:74:81:4B:EE:A8:08:D9:B1
    final googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

    // Get user data if exists
    var userData = await DatabaseService(user.uid).getUserData()
      .then((document) => document);

    if (!userData.exists) {
      // Create data on new user
      await DatabaseService(user.uid).updateUserData('usuario', '', user.email);
    } else {
      // Set data to operate (userData.data)

    }
    print('signed in OK');

    return _userFromFirebaseUser(user);
  }

  Future<User> signInWithFacebook() async {
    // CERTIFICADO: T7uiXsBdgKFTXe/mdIFL7qgI2bE= 
    final FacebookLoginResult facebookLoginResult = await facebookSignIn.logIn(['email', 'public_profile']);
    FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
    AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
    
    FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;

    // Get user data if exists
    var userData = await DatabaseService(user.uid).getUserData()
      .then((document) => document);

    if (!userData.exists) {
      // Create data on new user
      await DatabaseService(user.uid).updateUserData('usuario', '', user.email);
    } else {
      // Set data to operate (userData.data)

    }
    
    print('signed in OK');
    return _userFromFirebaseUser(user);
  }

  // Register with email and password
  Future signUpEmail(RegisterData registerData) async {

    AuthResult result = await _auth.createUserWithEmailAndPassword(email: registerData.email, password: registerData.password );
    FirebaseUser user = result.user;
    
    // Update user name info    
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '${registerData.name} ${registerData.lastName}';

    // Save updated info
    await user.updateProfile(info);

    // Create user info (rol, phone) on firestore
    await DatabaseService(user.uid).updateUserData('usuario', registerData.phone, registerData.email);

    _auth.signOut();
  }

  // Sign out
  Future singOut() async {
    try {      
      // If google is signed in
      var google = await _googleSignIn.isSignedIn();
      if (google) {
        _googleSignIn.signOut();
      }
      // If facebook is signed in
      var facebook = await facebookSignIn.isLoggedIn;
      if (facebook) {
        facebookSignIn.logOut();
      }
      // Firebase Auth sign out      
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: ' + e.toString());
    }
  }


  String authErrorHandling(error) {

    String errorMessage;

    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "El email no tiene un formato valido.";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Contraseña incorrecta.";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "Usuario no encontrado.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "Usuario deshabilitado.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Demasiadas peticiones realizadas. espere un momento para volver a realizar la peticion.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = "El email ya esta en uso.";
        break;
      default:
        errorMessage = "Ha occurido un error no definido.";
    }

    return errorMessage;
  }
}