import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mettyznest/ui/common/shared/styles.dart';
import 'package:stacked/stacked.dart';

import 'add_pet_form_viewmodel.dart';

class AddPetFormView extends StackedView<AddPetFormViewModel> {
  const AddPetFormView({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    AddPetFormViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add Your Pet Detail'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () => viewModel.goToHome(),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Center(
                    child: Icon(
                  Icons.chevron_left,
                  size: 24,
                )),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Pet Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          TextFormField(
                            key: const ValueKey('petName'),
                            decoration: InputDecoration(
                              hintText: "Enter Your Pet Name",
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                            ),
                            onSaved: (petName) => viewModel.petName(petName),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your pet name';
                              }
                              return null;
                            },
                          ),
                          verticalSpacing20,
                          const Text(
                            "Pet Owner Name",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          TextFormField(
                            key: const ValueKey('petOwnerName'),
                            decoration: InputDecoration(
                              hintText: "Enter Your Pet Owner Name",
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                            ),
                            onSaved: (petOwnerName) =>
                                viewModel.petOwnerName(petOwnerName),
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the pet owner name';
                              }
                              return null;
                            },
                          ),
                          verticalSpacing20,
                          const Text(
                            "Type of Pet",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          DropdownButtonFormField<String>(
                            key: const ValueKey('typeOfPet'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            hint: const Text('ex. Dog'),
                            items: ['Dog', 'Cat', 'Bird', 'Fish', 'Other']
                                .map((type) => DropdownMenuItem(
                                      value: type,
                                      child: Text(type),
                                    ))
                                .toList(),
                            onChanged: (value) => viewModel.typeOfPet(value),
                            onSaved: (value) => viewModel.typeOfPet(value),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select the type of pet';
                              }
                              return null;
                            },
                          ),
                          verticalSpacing20,
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          DropdownButtonFormField<String>(
                            key: const ValueKey('gender'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            value: viewModel.selectedGender,
                            hint: const Text('ex. Male'),
                            items: ['Male', 'Female', 'Other']
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                            onSaved: (gender) =>
                                viewModel.selectedGenderfn(gender),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select the gender';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                viewModel.selectedGenderfn(value),
                          ),
                          verticalSpacing20,
                          const Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          TextFormField(
                            key: const ValueKey('location'),
                            decoration: InputDecoration(
                              hintText: "Enter Location",
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              //prefixIcon: const Icon(Icons.location_on_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                            ),
                            onSaved: (location) => viewModel.location(location),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the location';
                              }
                              return null;
                            },
                          ),
                          verticalSpacing20,
                          const Text(
                            "Additional Notes",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0Xff252525),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpacing10,
                          TextFormField(
                            key: const ValueKey('notes'),
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: "Enter any additional notes",
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                            ),
                            onSaved: (notes) => viewModel.notes(notes),
                          ),
                          verticalSpacing20,
                          const Text(
                            "Add your pet profile picture and upload pet photos",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          verticalSpacing16,
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text("Take a Photo"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        viewModel.pickImage(true);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: const Text("Choose from Gallery"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        viewModel.pickImage(false);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: DottedBorder(
                              color: Colors.blue,
                              strokeWidth: 2,
                              dashPattern: [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Upload Photos",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 16),
                                    ),
                                    verticalSpacing8,
                                    Icon(Icons.file_upload_outlined,
                                        color: Colors.blueAccent),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          verticalSpacing16,
                          if (viewModel.uploadedImages.isNotEmpty)
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(
                                  viewModel.uploadedImages.length, (index) {
                                return Stack(
                                  children: [
                                    // Image Preview of the images
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        viewModel.uploadedImages[index],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // Delete func
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () =>
                                            viewModel.removeImage(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpacing10,
          const Divider(),
          verticalSpacing16,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: ElevatedButton(
                onPressed: viewModel.isBusy
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate() &&
                            viewModel.uploadedImages.isNotEmpty) {
                          _formKey.currentState!.save();
                          viewModel.submitData(context);
                          _formKey.currentState!.reset();
                        }
                      },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFFFDC4E)),
                ),
                child: viewModel.isBusy
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ))
                    : const Text('Submit',
                        style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  AddPetFormViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddPetFormViewModel();
}
