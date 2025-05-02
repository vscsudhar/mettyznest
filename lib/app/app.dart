import 'package:mettyznest/services/permission_handler.dart';
import 'package:mettyznest/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:mettyznest/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:mettyznest/ui/views/home/home_view.dart';
import 'package:mettyznest/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mettyznest/services/api_service.dart';
import 'package:mettyznest/ui/views/add_pet_form/add_pet_form_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AddPetFormView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PermissionServiceService),
    LazySingleton(classType: ApiService, resolveUsing: ApiService.init),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
