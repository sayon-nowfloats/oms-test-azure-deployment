import 'package:get/route_manager.dart';
import 'package:oms/shared/helpers/storage_helper.dart';
import 'package:oms/views/authentication/authentication_home_page.dart';
import 'package:oms/views/authentication/controllers/authentication_binding.dart';
import 'package:oms/views/home/controllers/home_binding.dart';
import 'package:oms/views/home/home_page.dart';

class Routes {
  //static const initial = '/login';

  static String getInitialRoute() {
    String route = '/';
    if (StorageHelper.isAuthenticated()) {
      route = '/home';
    }
    return route;
  }

  static final routes = [
    // GetPage(
    //   name: '/splash',
    //   page: () => const SplashPage(),
    // ),
    GetPage(
      name: '/',
      page: () => const AuthenticationHomePage(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const AuthenticationHomePage(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => const AuthenticationHomePage(
        viewTypes: [
          ViewType.login,
          ViewType.forgotPassword,
        ],
        initialPageIndex: 1,
      ),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: '/signUp',
      page: () => const AuthenticationHomePage(
        viewTypes: [
          ViewType.login,
          ViewType.signup,
        ],
        initialPageIndex: 1,
      ),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: '/product/:id',
    //   page: () => const ProductPage(),
    //   binding: ProductBinding(),
    // ),
    // GetPage(
    //   name: '/order/details/:id',
    //   page: () => const OrderDetailsPage(),
    //   binding: ProductBinding(),
    // )
  ];
}
