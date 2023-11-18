import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPage({Key? key, required this.camera}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isRecording = false;

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

  Future<void> toggleRecording() async {
    if (isRecording) {
      XFile video = await _controller.stopVideoRecording();
      setState(() {
        isRecording = false;
      });
      // Handle the saved video file as needed
    } else {
      await _controller.startVideoRecording();
      setState(() {
        isRecording = true;
      });
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
            return Stack(
              children: <Widget>[
                CameraPreview(_controller),
                // Overlay widgets here
                Positioned(
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: toggleRecording,
                    child: Icon(isRecording ? Icons.stop : Icons.videocam),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
