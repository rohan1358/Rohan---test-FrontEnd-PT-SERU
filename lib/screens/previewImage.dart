import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({super.key});

  @override
  Widget build(BuildContext context) {
    final filePath = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: PhotoView(
            imageProvider: FileImage(File(filePath)),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained * 1.1,
          )),
    );
  }
}
