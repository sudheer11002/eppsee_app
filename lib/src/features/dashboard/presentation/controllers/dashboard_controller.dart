import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;

  final RxInt currentIndex = 0.obs;

  void changeTab(int index) => currentIndex.value = index;

  // Hook your "Search Now" button here later if you want
  void onSearchTap() {}
  
}
