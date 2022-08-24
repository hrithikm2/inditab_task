import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

double W(BuildContext context) => context.safePercentWidth;
double H(BuildContext context) => context.safePercentHeight;

String sampleImageURL =
    "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60";

CollectionReference userCol = FirebaseFirestore.instance.collection("Users");

User? user = FirebaseAuth.instance.currentUser;

DocumentReference userDataDoc = userCol.doc(user?.uid);

String mid = "KmZAUF37883149088489";

String mKey = "Ct&d@le&Ks3&TC99";
