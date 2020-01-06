
import 'package:firebase_auth/firebase_auth.dart';

import 'userManagement.dart';

import 'package:google_sign_in/google_sign_in.dart';



class SignIn {
  static Future<String> signInWithGoogle(context) async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final FirebaseUser user = await _auth.signInWithCredential(credential);

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      FirebaseAuth.instance.currentUser().then((val) {
        UserUpdateInfo updateUser = UserUpdateInfo();
        updateUser.displayName = user.displayName;
        updateUser.photoUrl = user.photoUrl;
        val.updateProfile(updateUser)
            .then((user) {
          FirebaseAuth.instance
              .currentUser()
              .then((user) {
            UserManagement()
                .storeNewUser(user, context,);
          }).catchError((e) {
            print(e);
          });
        }).catchError((e) {
          print(e);
        });
      }).catchError((e) {
        print(e);
      });


      return 'signInWithGoogle succeeded: $user';
    }





  }
