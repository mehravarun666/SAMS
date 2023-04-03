import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Plantation extends StatefulWidget {
  const Plantation({Key? key}) : super(key: key);

  @override
  State<Plantation> createState() => _PlantationState();
}

class _PlantationState extends State<Plantation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plantation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Center(
            child: PLN(),
        )
    ),
      ));
    
  }
}

class PLN extends StatelessWidget {
  const PLN({Key? key}) : super(key: key);

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
