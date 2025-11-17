import 'package:Pationt_Donor/modules/patient/data/data_source/my_disease_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_disease_model.dart';
import 'package:get/get.dart';

class MyDiseaseController extends GetxController {
  List<Data>? data;
  @override
  void onInit() {
    super.onInit();
    Future.microtask(() => mydisease());
  }

  bool isloading = false;
  Future<void> mydisease() async {
    isloading = true;
    update();

    data = (await MyDiseaseDataSource.getAllMyDisease());
    print(data?.length.toString());
    isloading = false;
    update();
  }
}
