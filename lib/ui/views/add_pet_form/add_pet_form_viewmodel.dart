import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mettyznest/app/app.locator.dart';
import 'package:mettyznest/core/model/create_response_model.dart';
import 'package:mettyznest/core/navigation/navigation_mixin.dart';
import 'package:mettyznest/services/api_service.dart';
import 'package:mettyznest/services/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:path/path.dart' as path;

class AddPetFormViewModel extends BaseViewModel with NavigationMixin {
  AddPetFormViewModel() {
    checkFilePermission();
  }

  final PermissionServiceService _permissionService =
      locator<PermissionServiceService>();
  final ApiService _apiService = locator<ApiService>();

  CreateResponse? _createResponse;

  bool isLoading = false;

  String? _selectedPetType;
  String? _selectedGender;
  String? _petName;
  String? _petOwnerName;
  String? _location;
  String? _notes;
  String? _imageName;
  MultipartFile? _multipartFile;

  String? get selectedPetType => _selectedPetType;
  String? get selectedGender => _selectedGender;
  MultipartFile? get multipartFile => _multipartFile;

  List<File> uploadedImages = [];

  final ImagePicker _picker = ImagePicker();

  void petName(petName) {
    _petName = petName;
    notifyListeners();
  }

  void petOwnerName(petOwnerName) {
    _petOwnerName = petOwnerName;
    notifyListeners();
  }

  void typeOfPet(typeOfPet) {
    _selectedPetType = typeOfPet;
    notifyListeners();
  }

  void selectedGenderfn(gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void location(location) {
    _location = location;
    notifyListeners();
  }

  void notes(notes) {
    _notes = notes;
    notifyListeners();
  }

  Future<void> checkFilePermission() async {
    _filePermissionGranted =
        await _permissionService.requestFilePermission((Permission.storage));

    if (_filePermissionGranted!) {
      print("File access permission granted!");
    } else {
      print("File access permission denied.");
    }
    notifyListeners();
  }

  bool? _filePermissionGranted;
  bool? get filePermissionGranted => _filePermissionGranted;

  Future<void> pickImage(bool isCamera) async {
    // await checkFilePermission();
    final XFile? pickedFile = await _picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      uploadedImages.add(File(pickedFile.path));
      _imageName = path.basename(pickedFile.path);

      _multipartFile = await MultipartFile.fromFile(
        pickedFile.path,
        filename: _imageName,
      );

      notifyListeners();
    }
  }

  void removeImage(int index) {
    uploadedImages.removeAt(index);
    notifyListeners();
  }

  Future<void> submitData(context) async {
    FormData addFormData = FormData.fromMap({
      "pet_name": _petName.toString(),
      "user_name": _petOwnerName.toString(),
      "pet_type": _selectedPetType.toString(),
      "gender": _selectedGender.toString(),
      "location": _location,
      if (_multipartFile != null) "image": _multipartFile,
    });
    _createResponse =
        await runBusyFuture(_apiService.createDetails(formData: addFormData))
            .catchError((e) {
      print(e);
    });
    if (!hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pet details saved successfully!')),
      );
      goToHome();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save pet details')),
      );
    }
  }
}
