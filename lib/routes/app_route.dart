import 'package:get/get.dart';
import 'package:perikanan/ui/detail/article_detail_page.dart';
import 'package:perikanan/ui/detail/gallery_detail_page.dart';
import '../ui/home_page.dart';
import '../ui/auth/login_page.dart';
import '../ui/auth/register_page.dart';
import '../ui/splash_page.dart';

class AppRoute {
  static final api = 'https://ivandriancode.000webhostapp.com/perikanan/';

  static final pages = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/detail-article',
      page: () => ArticleDetailPage(),
    ),
    GetPage(
      name: '/detail-gallery',
      page: () => GalleryDetailPage(),
    ),
  ];
}
