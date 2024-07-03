import 'package:flutter/material.dart';
import '../models/user_data.dart';

class UserProvider with ChangeNotifier {
  UserData _userData = UserData(
    firstName: '',
    lastName: '',
    biodata: '',
    provinsi: '',
    kota: '',
    kecamatan: '',
    kelurahan: '',
    selfiePath: '',
    ktpPath: '',
    bebasPath: '',
  );

  UserData get userData => _userData;

  void updateUserData(UserData newData) {
    _userData = newData;
    notifyListeners();
  }
}
