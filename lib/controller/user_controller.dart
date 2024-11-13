import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static User? user = FirebaseAuth.instance.currentUser;

  static Future<User?> loginWithGoogle() async {
    print('Attempting to sign in with Google...');
    final googleAccount = await GoogleSignIn().signIn();
    if (googleAccount == null) {
      print('Google sign-in canceled by user.');
      return null; // User canceled the login
    }
    
    print('Google account details: ${googleAccount.displayName}, ${googleAccount.email}');
    final googleAuth = await googleAccount.authentication;

    // Print access and ID tokens for debugging
    print('Access Token: ${googleAuth.accessToken}');
    print('ID Token: ${googleAuth.idToken}');

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    // Update static user to reflect the logged-in user
    user = FirebaseAuth.instance.currentUser;
    print('User signed in: ${user?.displayName}');

    return user;
  }

  static Future<void> signOut() async {
    print('Signing out...');
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    // Reset static user
    user = null;
    print('User signed out successfully.');
  }
}
