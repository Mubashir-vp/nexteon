import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:netxone/controller/data/api_services.dart';

import '../model/bodymodeld.dart';
import '../model/model.dart';

class HomeScreenController extends GetxController {

  Body body = Body(
      sortType: 1,
      sortOrder: 1,
      statusArray: [1],
      screenType: [100, 50],
      responseFormat: [1, 500, 1000],
      subCategoryIds: [],
      categoryIds: [],
      limit: 10,
      skip: 0,
      searchingText: "");
  Model? model;
  Future<Model?> postCall() async {
    model = await ApiService().datafetching(body: body);
    return model;
  }
}
