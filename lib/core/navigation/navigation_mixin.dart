import 'package:mettyznest/app/app.locator.dart';
import 'package:mettyznest/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToHome() => _navigationService.clearStackAndShow(Routes.homeView);
  void goToAddPetForm() => _navigationService.navigateTo(Routes.addPetFormView);
}
