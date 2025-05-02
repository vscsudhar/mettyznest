import 'package:flutter/material.dart';
import 'package:mettyznest/ui/common/shared/styles.dart';
import 'package:mettyznest/ui/views/home/widgets/pet_card_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:mettyznest/ui/common/app_colors.dart';
import 'package:mettyznest/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              viewModel.isBusy
                  ? const Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (viewModel.data.isEmpty)
                            Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/background.png',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Opps! your pet list is empty",
                                    style: TextStyle(fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          if (viewModel.data.isNotEmpty)
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: viewModel.data.length,
                                itemBuilder: (context, index) {
                                  return PetCardWidget(
                                    petName: viewModel.data[index]!.petName,
                                    location: viewModel.data[index]!.location,
                                    imageUrl: viewModel.data[index]!.imageUrl,
                                    gender: viewModel.data[index]!.gender,
                                    isFavorite: viewModel.isFavoritefn(viewModel.data[index]!.id),
                                    onTap: () => viewModel.toggleFavorite(viewModel.data[index]!.id),
                                  );
                                },
                              ),
                            )
                        ],
                      ),
                    ),
              verticalSpacing10,
              const Divider(
                height: 0,
              ),
              verticalSpacing10,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: ElevatedButton.icon(
                    onPressed: () => viewModel.goToAddPetForm(),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Color(0xFFFFDC4E)),
                    ),
                    label: const Text('Add New Pet', style: TextStyle(color: Colors.black)),
                    icon: const Icon(
                      Icons.add_box,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ])),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
