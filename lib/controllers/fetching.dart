import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class img extends StatefulWidget {
  const img({Key? key}) : super(key: key);

  @override
  State<img> createState() => _imgState();
}

class _imgState extends State<img> {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Storage().downloadURL('asset.jpeg'),
        builder: (BuildContext context, AsyncSnapshot<String> Snapshot) {
          if (Snapshot.connectionState == ConnectionState.done &&
              Snapshot.hasData) {
            return Center(
              child: Container(
                width: 300,
                height: 250,
                child: Image.network(
                  Snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          if (Snapshot.connectionState == ConnectionState.waiting ||
              !Snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Container();
        });  
  }
}
class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;



  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('PLN/$imageName').getDownloadURL();

    return downloadURL;
  }
}