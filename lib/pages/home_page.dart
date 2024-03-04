import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_march/pages/learn_flutter_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<List<DocumentSnapshot>> getPostsFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(
            'posts') // Replace 'posts' with the name of your Firestore collection
        .get();
    return querySnapshot.docs;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
        future: getPostsFromFirestore(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<DocumentSnapshot>? posts = snapshot.data;
            inspect(posts);
            return ListView.builder(
              itemCount: posts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Post ${index + 1}'),
                  subtitle: Text(posts![index]['description'] ?? ''),
                );
              },
            );
          }
        });
  }
}
