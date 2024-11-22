import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthWork{


  signInWIthG() async{
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential1 = GoogleAuthProvider.credential(accessToken: gAuth.accessToken,idToken: gUser.id);
    return await FirebaseAuth.instance.signInWithCredential(credential1);
  }
}