
class AuthService {
  /*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> logIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return user.user;
  }

  logOut() async {
    return await _auth.signOut();
  }

  Future<User?> register(
      String email, String password, String name, String phone) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Person").doc(user.user!.uid).set({
      "name-surname": name,
      "email": email,
      "password": password,
      "phone": phone,
      "addres": null,
    });

    return user.user;
  }

  Future signUp(emailSignUp, passwordSignUp) async {
    try {
      var user = (await _auth.createUserWithEmailAndPassword(
          email: emailSignUp, password: passwordSignUp));

      await _firestore.collection("Person").doc(user.user!.uid).set({
        // "name-surname": name,
        "email": emailSignUp,
        "password": passwordSignUp,
        //"phone":phone,
        // "addres":null,
      });
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 1;
      } else if (e.code == 'email-already-in-use') {
        return 2;
      } else if (e.code == 'user-not-found') {
        return 3;
      } else if (e.code == 'wrong-password') {
        return 4;
      }
    } catch (e) {
      return 5;
    }
  }*/
}
