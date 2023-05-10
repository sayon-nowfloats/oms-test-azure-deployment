import 'package:get/get.dart';
import 'package:oms/views/home/controllers/home_controller.dart';
import 'package:oms/views/order/list/controllers/order_list_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    // Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrderListController>(() => OrderListController());
  }
}
