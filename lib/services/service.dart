import 'package:get_dem/app_constant/app_constant.dart';
import 'package:get_dem/models/model.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<SongResponse> fetchItem() async {
    try {
      final url = Uri.parse(AppConstant.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return songResponseFromJson(response.body);
      } else {
        return SongResponse(count: 0, entries: []);
      }
    } catch (e) {
      return SongResponse(count: 0, entries: []);
    }
  }
}
