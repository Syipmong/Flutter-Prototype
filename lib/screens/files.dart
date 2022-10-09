import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'homescreen.dart';

class Files extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello world'),
    );
  }
}


class Upload extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Upload'),
    );
  }
}


class Download extends StatefulWidget {
  

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};


  @override
  void initState(){
    super.initState();
   futureFiles = FirebaseStorage.instance.ref('/files').listAll();

  }


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('File Downloads'),
      ),
      drawer: NavigationDrawer(),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot){
            if(snapshot.hasData){
              final files = snapshot.data!.items;
return ListView.builder(
  itemCount: files.length,
  itemBuilder: (context, index){
    final file = files[index];
    double? progress = downloadProgress[index];

    return ListTile(
      title: Text(file.name),
      subtitle: progress != null
      ? LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.red,
      )
      : null,
      trailing: IconButton(
        icon: const Icon(Icons.download,
        color: Colors.red,
      ),
      onPressed: () => downloadFile(index, file),
      ),
    );
  },
);

            }else if(snapshot.hasError){
              return const Center( child: Text('Error Occured'),);
            } else{
              return const Center(child: CircularProgressIndicator(),);
            }
        },
      ),
    );

Future downloadFile(int index, Reference ref) async{
  // final dir = await getApplicationDocumentsDirectory();
  // final file = File('${dir.path}/${ref.name}');
  // await ref.writeToFile(file);

  final url = await ref.getDownloadURL();
  //Visible to the user
  final tempDir = await getTemporaryDirectory();
  final path = '${tempDir.path}/${ref.name}';
  await Dio().download(
    url,
    path,
    onReceiveProgress: (recieved, total){
      double progress = recieved / total;

      setState(() {
        downloadProgress[index] = progress;
      });
    }
    );


if(url.contains('.mp4')){
  await GallerySaver.saveVideo(path, toDcim: true);
} else if(url.contains('.jpg')){
  await GallerySaver.saveImage(path, toDcim: true);
}


  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Downloaded ${ref.name}')),
  );

}

}



class Folders extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Folders'),
    );
  }
}


class Fire extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Fire'),
    );
  }
}