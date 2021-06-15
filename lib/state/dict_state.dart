import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/dict_model.dart';
import '../routes/app_route.dart';
import '../services/error_service.dart';

class DictState extends GetxController {
  List<DictModel> _dictionaries;

  List<DictModel> get dictionaries => _dictionaries;

  Future<void> getDictionaries() async {
    try {
      var response = await http.get(
        Uri.parse(AppRoute.api + 'get_dict.php'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<DictModel> dictionaries = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((dict) {
          dictionaries.add(
            DictModel.fromJSON(dict),
          );
        });
        _dictionaries = dictionaries;
      } else {
        _dictionaries = [];
      }
    } catch (e) {
      showError(e);
      _dictionaries = [];
    } finally {
      update();
    }
  }
}
