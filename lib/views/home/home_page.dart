import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oms/generated/assets.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/order/list/order_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;
  int currentPage = 0;

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

  @override
  void initState() {
    controller = PageController(
      initialPage: currentPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.network(
                  "https://jiw-oms-cdn-staging.azureedge.net/oms-frontend/nowfloats.svg",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 30,
                ),
                _sideMenuEntriesWidget(),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              children: sideMenuEntries.map((e) => e.body).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideMenuEntriesWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .20,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: sideMenuEntries.length,
        itemBuilder: (BuildContext context, int index) {
          SideMenuItemModel item = sideMenuEntries.elementAt(index);
          bool isSelected = index == currentPage;
          return _menuItemWidget(
              iconPath: item.iconPath,
              name: item.name,
              isSelected: isSelected,
              onTap: () {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                );
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox();
        },
      ),
    );
  }

  Widget _menuItemWidget({
    bool isSelected = false,
    VoidCallback? onTap,
    String name = "",
    String iconPath = "",
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: isSelected ? AppColors.blue3 : Colors.transparent,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                  color: isSelected ? AppColors.white : AppColors.blue4,
                ),
                const SizedBox(width: 6),
                Text(
                  name,
                  style: AppTextTheme.of(context).h5.copyWith(
                        color: isSelected ? AppColors.white : AppColors.blue4,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuItemModel extends Equatable {
  final String name;
  final Widget body;
  final String iconPath;

  const SideMenuItemModel({
    required this.name,
    this.body = const IgnorePointer(),
    this.iconPath = "",
  });

  SideMenuItemModel copyWith(String? name, Widget? body, String? iconPath) {
    return SideMenuItemModel(
      name: name ?? this.name,
      body: body ?? this.body,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  @override
  List<Object?> get props => [name, body, iconPath];
}
