import 'package:firebase_auth/firebase_auth.dart';
import 'package:prj_clinica/model/client.dart';
import 'package:prj_clinica/provider/firebase_firestore.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<Client?> get user {
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

//add storebase
  Client? _userFromFirebaseUser(User? user) {
    return user != null ? Client(uid: user.uid) : null;
  }

  Future<Client?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

//add storebase
  Future<Client?> createUserWithEmailAndPassword(
      Client client, String password) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: client.nm_email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      client.uid = user.uid;
      FirestoreDatabase.helper.insertClient(client);
    }

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
