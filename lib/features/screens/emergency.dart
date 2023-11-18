import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:protizen/constant/color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPage({Key? key, required this.camera}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final TextEditingController _chatController = TextEditingController();
  List<String> messages = [];
  List<XFile> photos = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
      enableAudio: true,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  Future<void> takePhoto() async {
    final photo = await _controller.takePicture();
    setState(() {
      photos.add(photo);
    });
    uploadPhoto(photo);
  }

  Future<void> uploadPhoto(XFile photo) async {
    final file = File(photo.path);
    final fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}_${photo.name}';

    final response = await Supabase.instance.client.storage
        .from('protizen')
        .upload(fileName, file);

    if (response == null) {
    print('Upload error: ${response}');
    } else {
      // Handle upload error
    }
  }

  void sendMessage() async {
    if (_chatController.text.isNotEmpty) {
      // Send message to Supabase
      final response = await Supabase.instance.client
          .from('chat_messages')
          .insert({'message': _chatController.text})
          .execute();

      if (response == null) {
        setState(() {
          messages.add(_chatController.text);
        });
        _chatController.clear();
      } else {
        // Handle error
      }
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Camera View')),
    body: FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: <Widget>[
              Expanded(child: CameraPreview(_controller)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3, // Adjusted for more space
                padding: const EdgeInsets.all(8),
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded( // This will make the ListView take all available space
                      child: ListView.builder(
                        reverse: true, // This will start the list from the bottom
                        itemCount: messages.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(messages[messages.length - 1 - index], // Reverse the message order
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _chatController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Type a message",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: sendMessage,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: takePhoto,
      child: const Icon(Icons.camera_alt),
      backgroundColor: primaryYellow,
      elevation: 0,
      mini: true,
      tooltip: 'Take a photo',
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
  );
}




  @override
  void dispose() {
    _controller.dispose();
    _chatController.dispose();
    super.dispose();
  }
}
