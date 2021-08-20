import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firsttest/models/user.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebased user
  UserModel? _fromFirebaseUser(User user)
  {
  return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserModel?> get user{
    return _auth.authStateChanges()
      .map(_fromFirebaseUser);
  }
  @override
  Stream<User> get authStateChanges {
    return _auth.authStateChanges().map(_fromFirebaseUser);
  }
  // Sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign in email and password


  // Register in email and password


  // sign out
}
