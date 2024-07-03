import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wizzard_app/screens/previewImage.dart';
import '../providers/user_provider.dart';

class WizardTwo extends StatefulWidget {
  const WizardTwo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WizardTwoState createState() => _WizardTwoState();
}

class _WizardTwoState extends State<WizardTwo> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(String type, UserProvider userProvider) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        switch (type) {
          case 'selfie':
            userProvider.userData.selfiePath = pickedFile.path;
            break;
          case 'ktp':
            userProvider.userData.ktpPath = pickedFile.path;
            break;
          case 'bebas':
            userProvider.userData.bebasPath = pickedFile.path;
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Wizard 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildImagePreview('Selfie', userProvider.userData.selfiePath,
                () => _pickImage('selfie', userProvider)),
            const SizedBox(height: 20),
            _buildImagePreview('KTP', userProvider.userData.ktpPath,
                () => _pickImage('ktp', userProvider)),
            const SizedBox(height: 20),
            _buildImagePreview('Foto Bebas', userProvider.userData.bebasPath,
                () => _pickImage('bebas', userProvider)),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (userProvider.userData.selfiePath == '') {
                    showAlert(context, "masukan foto selfie terlebih dahulu");
                    return;
                  }
                  if (userProvider.userData.ktpPath == '') {
                    showAlert(context, "masukan foto KTP terlebih dahulu");
                    return;
                  }
                  if (userProvider.userData.bebasPath == '') {
                    showAlert(context, "masukan foto bebas terlebih dahulu");

                    return;
                  }
                  Navigator.pushNamed(context, '/wizard3');
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }

  bool isOpen = false;

  void previewImage(String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PreviewImage(),
      ),
    );
  }

  Widget _buildImagePreview(
      String label, String imagePath, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        imagePath.isEmpty
            ? IconButton(
                icon: const Icon(Icons.add_a_photo),
                onPressed: onTap,
                iconSize: 300,
              )
            : Stack(
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PreviewImage(),
                            settings: RouteSettings(arguments: imagePath)),
                      )
                    },
                    child: Image.file(
                      File(imagePath),
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.repeat),
                        onPressed: onTap,
                        color: Colors.blue,
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.amber)),
                      ))
                ],
              ),
      ],
    );
  }

  void showAlert(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal)),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: const Text(
                      "close",
                    ))
              ],
            ));
  }
}
