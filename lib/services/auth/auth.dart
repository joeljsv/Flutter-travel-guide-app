import 'package:google_sign_in/google_sign_in.dart';
import 'package:tripme/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User Function(FirebaseUser event) get _userFromFirebaseUser => null;
  

  // create user obj based on firebase use
  User _userFromFIrebaseUser(FirebaseUser user){
    return user !=null?User(uid: user.uid ):null;
  }
Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
      
  }
  // auth change user stream
  

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFIrebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
 

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
 _userFromFIrebaseUser(user);
  return 'signInWithGoogle succeeded: '+ user.displayName;
  
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}

  // sign in with email and password

  // register with email and password

  // sign out

}


