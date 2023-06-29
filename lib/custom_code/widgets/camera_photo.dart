// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CameraPhoto extends StatefulWidget {
  const CameraPhoto({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CameraPhotoState createState() => _CameraPhotoState();
}

class _CameraPhotoState extends State<CameraPhoto> {
  CameraController? controller;
  List<CameraDescription>? _cameras;
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) => _cameras = value);
  }

  _initializeController(int cameraIndex) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(
      _cameras![cameraIndex],
      cameraIndex == 0
          ? ResolutionPreset.max
          : ResolutionPreset.high, // use high preset for the front camera
    );
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        print('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      print('Error: ${e.description}');
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant CameraPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_cameras != null) {
      if (FFAppState().switchCam && selectedCameraIndex == 0) {
        selectedCameraIndex = 1;
        _initializeController(selectedCameraIndex);
        FFAppState().switchCam = false;
      } else if (!FFAppState().switchCam && selectedCameraIndex == 1) {
        selectedCameraIndex = 0;
        _initializeController(selectedCameraIndex);
      }
    }

    if (FFAppState().makePhoto) {
      controller!.takePicture().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();
        // Compress the image
        var result = await FlutterImageCompress.compressWithList(
          fileAsBytes,
          minHeight: 1920,
          minWidth: 1080,
          quality: 70,
        );
        FFAppState().update(() {
          FFAppState().makePhoto = false;
        });
        String dir = '/users/' + currentUserUid + '/flicks/';
        final downloadUrl = await uploadData(
            dir + FFAppState().index.toString() + '.jpg', result);
        FFAppState().update(() {
          FFAppState().index = FFAppState().index + 1;
          FFAppState().filePath = downloadUrl ?? '';
        });
      }).catchError((error) {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller?.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (_cameras != null && _cameras!.isNotEmpty) {
            return controller!.value.isInitialized
                ? MaterialApp(
                    home: CameraPreview(controller!),
                  )
                : Container();
          } else {
            return Center(child: Text('No cameras available.'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
