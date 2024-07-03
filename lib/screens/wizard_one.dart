import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import '../providers/user_provider.dart';

class WizardOne extends StatelessWidget {
  const WizardOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final TextEditingController controllerProvinsi = TextEditingController();
    final List<String> items = [
      "Provinsi 1",
      "Provinsi 2",
      "Provinsi 3",
      "Provinsi 4",
      "Provinsi 5",
      "Provinsi 6",
      "Provinsi 7",
      "Provinsi 8",
      "Provinsi 9",
      "Provinsi 10",
      "Provinsi 11",
      "Provinsi 12",
      "Provinsi 13",
      "Provinsi 14",
      "Provinsi 15"
    ];
    final TextEditingController controllerKotaKabupaten =
        TextEditingController();

    final List<String> kotaKabupaten = [
      "kota 1",
      "kota 2",
      "kota 3",
      "kota 4",
      "kota 5",
      "kota 6",
      "kota 7",
      "kota 8",
      "kota 9",
      "kota 10",
      "kota 11",
      "kota 12",
      "kota 13",
      "kota 14",
      "kota 15"
    ];

    final TextEditingController controllerKecamatan = TextEditingController();

    final List<String> kecamatan = [
      "kota 1",
      "kota 2",
      "kota 3",
      "kota 4",
      "kota 5",
      "kota 6",
      "kota 7",
      "kota 8",
      "kota 9",
      "kota 10",
      "kota 11",
      "kota 12",
      "kota 13",
      "kota 14",
      "kota 15"
    ];

    final TextEditingController controllerKelurahan = TextEditingController();

    final List<String> kelurahan = [
      "kelurahan 1",
      "kelurahan 2",
      "kelurahan 3",
      "kelurahan 4",
      "kelurahan 5",
      "kelurahan 6",
      "kelurahan 7",
      "kelurahan 8",
      "kelurahan 9",
      "kelurahan 10",
      "kelurahan 11",
      "kelurahan 12",
      "kelurahan 13",
      "kelurahan 14",
      "kelurahan 15"
    ];

    void useEffect() {
      if (userProvider.userData.provinsi != '') {
        controllerProvinsi.text = userProvider.userData.provinsi;
      }
      if (userProvider.userData.kota != '') {
        controllerKotaKabupaten.text = userProvider.userData.provinsi;
      }
      if (userProvider.userData.kecamatan != '') {
        controllerKecamatan.text = userProvider.userData.kecamatan;
      }
      if (userProvider.userData.kelurahan != '') {
        controllerKelurahan.text = userProvider.userData.kelurahan;
      }
    }

    useEffect();

    Widget customTextFIeld(
        String label, String hintText, Function handleChange) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: '',
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1)),
              hintText: 'Enter First Name',
            ),
            onChanged: (value) {
              handleChange(value);
            },
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    Widget customFlutterDropdownSearch(String label,
        TextEditingController textController, List<String> items) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlutterDropdownSearch(
            textController: textController,
            items: items,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            hintText: 'Pilih $label',
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Wizard 1')),
      body: GestureDetector(
          // onTap: _unFocus,
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            customTextFIeld('First Name', 'Enter First Name',
                (value) => {userProvider.userData.firstName = value}),
            const SizedBox(height: 10),
            customTextFIeld('Last Name', 'Enter Last Name',
                (value) => {userProvider.userData.lastName = value}),
            const SizedBox(height: 10),
            const Text(
              'Biodata',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1)),
                hintText: 'Enter First Name',
              ),
              onChanged: (value) {
                userProvider.userData.biodata = value;
              },
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            customFlutterDropdownSearch('Provinsi', controllerProvinsi, items),

            const SizedBox(height: 10),
            customFlutterDropdownSearch(
                'Kota', controllerKotaKabupaten, kotaKabupaten),

            const SizedBox(height: 10),
            customFlutterDropdownSearch(
                'Kecamatan', controllerKecamatan, kecamatan),
            const SizedBox(height: 10),
            customFlutterDropdownSearch(
                'Kelurahan', controllerKelurahan, kelurahan),
            const SizedBox(height: 10),

            ElevatedButton(
                onPressed: () {
                  var userData = userProvider.userData;
                  print(userData.firstName);
                  if (userData.firstName == '') {
                    showAlert(context, 'masukan firstname terlebih dahulu');
                    return;
                  }
                  if (userData.lastName == '') {
                    showAlert(context, 'masukan lastname terlebih dahulu');
                    return;
                  }
                  if (userData.biodata == '') {
                    showAlert(context, 'masukan lastname terlebih dahulu');
                    return;
                  }

                  if (controllerProvinsi.value.text == '') {
                    showAlert(context, 'masukan provinsi terlebih dahulu');
                    return;
                  }
                  if (controllerKotaKabupaten.value.text == '') {
                    showAlert(context, 'masukan kota terlebih dahulu');
                    return;
                  }
                  if (controllerKecamatan.value.text == '') {
                    showAlert(context, 'masukan kecamatan terlebih dahulu');
                    return;
                  }
                  if (controllerKelurahan.value.text == '') {
                    showAlert(context, 'masukan kelurahan terlebih dahulu');
                    return;
                  }
                  userData.provinsi = controllerProvinsi.value.text;
                  userData.kota = controllerKotaKabupaten.value.text;
                  userData.kecamatan = controllerKecamatan.value.text;
                  userData.kelurahan = controllerKelurahan.value.text;
                  // FocusScope.of(context).unfocus();
                  Navigator.pushNamed(context, '/wizard2');
                },
                child: const Text('Next'))

            // Tambahkan Dropdown lainnya di sini (Kota, Kecamatan, Kelurahan)
          ],
        ),
      )),
      // resizeToAvoidBottomInset: false,
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
