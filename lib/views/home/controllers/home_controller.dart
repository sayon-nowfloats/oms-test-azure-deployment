import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/generated/assets.dart';
import 'package:oms/views/home/home_page.dart';
import 'package:oms/views/order/list/order_list_page.dart';

class HomeController extends GetxController with StateMixin {
  late PageController controller;
  var currentPage = 0.obs;

  /// Views to display
  List<SideMenuItemModel> sideMenuEntries = [
    SideMenuItemModel(
      body: OrderListPage(),
      name: 'Dashboard',
      iconPath: Assets.menuDashboard,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Orders"),
      ),
      name: 'Orders',
      iconPath: Assets.menuOrders,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Shipment"),
      ),
      name: 'Invoice',
      iconPath: Assets.menuShipment,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Inventory"),
      ),
      name: 'Inventory',
      iconPath: Assets.menuInventory,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Channel"),
      ),
      name: 'Channel',
      iconPath: Assets.menuChannel,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Purchase"),
      ),
      name: 'Purchase',
      iconPath: Assets.menuPurchase,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Reports"),
      ),
      name: 'Reports',
      iconPath: Assets.menuReports,
    ),
    SideMenuItemModel(
      body: Scaffold(
        body: Text("Settings"),
      ),
      name: 'Settings',
      iconPath: Assets.menuSettingGear,
    ),
  ];

  void navigateToNext(int page) {
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  void onInit() {
    controller = PageController(
      initialPage: currentPage.value,
    );
    super.onInit();
  }
}
