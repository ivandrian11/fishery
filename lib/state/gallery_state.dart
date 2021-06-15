import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/gallery_model.dart';
import '../routes/app_route.dart';
import '../services/error_service.dart';

class GalleryState extends GetxController {
  List<GalleryModel> _galeries;

  List<GalleryModel> get galeries => _galeries;

  Future<void> getGalleries() async {
    try {
      var response = await http.get(
        Uri.parse(AppRoute.api + 'get_gallery.php'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<GalleryModel> galeries = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((gallery) {
          galeries.add(
            GalleryModel.fromJSON(gallery),
          );
        });
        _galeries = galeries;
      } else {
        _galeries = [];
      }
    } catch (e) {
      showError(e);
      _galeries = [];
    } finally {
      update();
    }
  }
}
