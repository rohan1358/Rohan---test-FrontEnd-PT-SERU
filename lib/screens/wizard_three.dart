import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzard_app/screens/previewImage.dart';
import '../providers/user_provider.dart';

class WizardThree extends StatelessWidget {
  WizardThree({super.key});

  final Map<String, String> data3 = {
    'firstname': 'rohan',
    'lastname': 'priyatna',
    'bio': 'ini bio saya'
  };

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.userData;

    Map<String, String> data = {
      'First Name': userData.firstName,
      'Last Lame': userData.lastName,
      'Bio': userData.biodata,
      'Provinsi': userData.provinsi,
      'Kota': userData.kota,
      'Kecamatan': userData.kecamatan,
      'Kelurahan': userData.kelurahan,
    };

    Map<String, String> image = {
      'Gambar Selfie': userData.selfiePath,
      'Gambar KTP': userData.ktpPath,
      'Gambar Bebas': userData.bebasPath,
    };

    return Scaffold(
        appBar: AppBar(title: const Text("Wizzard 3")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                },
                children: _buildTableRows(data, image, context),
              ),
              ElevatedButton(
                  onPressed: () {
                    showAlert(context, "Submit Berhasil!");
                  },
                  child: const Text("Submit"))
            ],
          ),
        ));
  }

  List<TableRow> _buildTableRows(Map<String, String> data,
      Map<String, String> image, BuildContext context) {
    List<TableRow> rows = [
      const TableRow(
        children: [
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Key',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Value',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ];

    rows.addAll(
      data.entries.map((entry) {
        return TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(entry.key),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(entry.value),
              ),
            ),
          ],
        );
      }).toList(),
    );
    rows.addAll(
      image.entries.map((entry) {
        return TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(entry.key),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PreviewImage(),
                                settings:
                                    RouteSettings(arguments: entry.value)),
                          )
                        },
                    child: Image.file(
                      File(entry.value),
                      width: 300,
                      height: 300,
                    )),
              ),
            ),
          ],
        );
      }).toList(),
    );

    return rows;
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
