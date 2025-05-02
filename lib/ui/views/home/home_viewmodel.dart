import 'package:mettyznest/app/app.bottomsheets.dart';
import 'package:mettyznest/app/app.dialogs.dart';
import 'package:mettyznest/app/app.locator.dart';
import 'package:mettyznest/core/model/get_pet_model.dart';
import 'package:mettyznest/core/navigation/navigation_mixin.dart';
import 'package:mettyznest/services/api_service.dart';
import 'package:mettyznest/services/permission_handler.dart';
import 'package:mettyznest/ui/common/app_strings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel with NavigationMixin {
  HomeViewModel() {
    checkFilePermission();
    getDetails();
  }
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final PermissionServiceService _permissionService = locator<PermissionServiceService>();
  final ApiService _apiService = locator<ApiService>();

  bool? _filePermissionGranted;
  bool? _isLoading;
  bool? _isFavorite = false;
    final Set<int> _favoritePetIds = {};


  GetPetResponse? _getPetResponse;

  List<Datum?> get data => _getPetResponse!.data;

  GetPetResponse? get getPetResponse => _getPetResponse;
  bool? get filePermissionGranted => _filePermissionGranted;
  bool? get isLoading => _isLoading;
  bool? get isFavorite => _isFavorite;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  bool isFavoritefn(int petId) {
    return _favoritePetIds.contains(petId);
  }

  void toggleFavorite(int petId) {
    if (_favoritePetIds.contains(petId)) {
      _favoritePetIds.remove(petId);
    } else {
      _favoritePetIds.add(petId);
    }
    notifyListeners();
  }

  Future<void> getDetails() async {
    _isLoading = true;
    _getPetResponse = await runBusyFuture(_apiService.getDetails()).catchError((e) {
      print(e);
    });
    if (!hasError) {
      _getPetResponse!.data;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> checkFilePermission() async {
    _filePermissionGranted = await _permissionService.requestFilePermission((Permission.storage));

    if (_filePermissionGranted!) {
      print("File access permission granted!");
    } else {
      print("File access permission denied.");
    }
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
