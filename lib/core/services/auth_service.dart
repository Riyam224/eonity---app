// todo

// ignore_for_file: avoid_print, use_rethrow_when_possible, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // ! register with google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return await _auth.signInWithCredential(credential);
      }
      return null; // User cancelled Google sign-in
    } on FirebaseAuthException catch (e) {
      print('Firebase Google Sign In Error: ${e.code} - ${e.message}');
      throw e;
    } catch (e) {
      print('General Google Sign In Error: $e');
      throw e;
    }
  }

  //  ! register with facebook
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Initiate Facebook login
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.status == LoginStatus.success) {
        // Create Firebase credential from Facebook access token
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.tokenString,
        );

        // Sign in or register with Firebase using the Facebook credential
        return await _auth.signInWithCredential(credential);
      } else {
        // Facebook login failed
        print('Facebook sign-in failed: ${result.status}, ${result.message}');
        return null; // Return null to indicate failure
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Authentication errors
      print('Firebase Facebook Sign In Error: ${e.code} - ${e.message}');
      throw e;
    } catch (e) {
      // Handle general errors
      print('General Facebook Sign In Error: $e');
      throw e;
    }
  }

  // ! register email and password
  Future<UserCredential?> registerUser(
    String username,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update the user's display name (username)
      await userCredential.user?.updateDisplayName(username);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code} - ${e.message}');
      throw e; // Rethrow the exception for handling in the UI
    } catch (e) {
      print('General Error: $e');
      throw e; // Rethrow the exception for handling in the UI
    }
  }

  // ... (signInUser, signOut, getCurrentUser remain the same)
  // ! signin
  Future<UserCredential?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Firebase Sign In Error: ${e.code} - ${e.message}');
      throw e; // Rethrow for UI handling
    } catch (e) {
      print('General Sign In Error: $e');
      throw e; // Rethrow for UI handling
    }
  }

  // ! signout

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // ! get current user

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
