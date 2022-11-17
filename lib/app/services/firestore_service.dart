import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseUser {
  bool? isAdmin;
  User? user;
  DatabaseUser({this.isAdmin, this.user});
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  // CollectionReference aminCollection =
  //     FirebaseFirestore.instance.collection("admin");

  setUser(String codeAdmin) async {
    // if (isAdmin!) {
    userCollection.doc(user!.uid).set({
      "email": user!.email,
      "isAdmin": isAdmin,
      "uidUser": user!.uid,
      "code_admin": codeAdmin
    });
    // } else {
    //   userCollection.doc(user!.uid).set({
    //     "email": user!.email,
    //     // "tache": [],
    //     "isAdmin": false,
    //     "uidUser": user!.uid,
    //     "code_admin": codeAdmin
    //   });
    // }
  }

  UserInfom utilisateur(DocumentSnapshot snapshot) {
    return UserInfom(
      email: (snapshot.data() as dynamic)["email"],
      isAdmin: (snapshot.data() as dynamic)["isAdmin"],
      uid: (snapshot.data() as dynamic)["uid"],
      codeAdmin: (snapshot.data() as dynamic)["code_admin"],
    );
  }

  List<UserInfom> utilisateurs(QuerySnapshot snpashots) {
    return snpashots.docs.map((doc) {
      return UserInfom(
        email: (doc.data() as dynamic)["email"],
        isAdmin: (doc.data() as dynamic)["isAdmin"],
        uid: (doc.data() as dynamic)["uid"],
        codeAdmin: (doc.data() as dynamic)["code_admin"],
      );
    }).toList();
  }

  Stream<UserInfom> get userInfo {
    return userCollection.doc(user!.uid).snapshots().map(utilisateur);
  }

  Stream<List<UserInfom>> get totalusers {
    return userCollection.snapshots().map(utilisateurs);
  }
}

class UserInfom {
  String? email;
  String? codeAdmin;
  bool? isAdmin;
  String? uid;
  // List<dynamic>? connectionRequest;
  UserInfom({
    required this.email,
    required this.codeAdmin,
    required this.isAdmin,
    required this.uid,
  });
}
