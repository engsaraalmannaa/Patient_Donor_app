import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/appointment_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/write_consultation_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/doctorbyspecialety_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppointmentController extends GetxController {
  // حالات
  final isLoadingSpecialty = false.obs;
  final isLoadingDoctors = false.obs;
  bool isSubmitting = false;

  // بيانات
  final specialties = <String>[].obs;
  DoctorBySpecialetyModel? doctorsOfSelected;

  // خرائط ربط اسم ↔ id
  final Map<String, String> specialtyNameToId = {};
  final Map<String, String> doctorNameToId = {};

  String? specialty_id;
  String? doctorId;
  final selectedSpecialty = RxnString(); // أو RxString('')
  final selectedDoctor = RxnString(); // أو RxString('')

  @override
  void onInit() {
    super.onInit();
    // ممكن تستدعي getSpecialties() من هون بدل initState في الواجهة
  }

  Future<void> getSpecialties() async {
    try {
      isLoadingSpecialty.value = true;

      final res = await AppointmentDataSource.getAllSpecialety();
      specialties
        ..clear()
        ..addAll(res.data?.map((e) {
              specialtyNameToId[e.name ?? ''] = e.id.toString();
              return e.name ?? '';
            }).where((e) => e.isNotEmpty) ??
            []);
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل التخصصات");
    } finally {
      isLoadingSpecialty.value = false;
    }
  }

  Future<void> getDoctorsBySpecialty(String specialtyName) async {
    final id = specialtyNameToId[specialtyName];
    if (id == null) {
      Get.snackbar("خطأ", "لم يتم العثور على معرف التخصص");
      return;
    }
    specialty_id = id;

    isLoadingDoctors.value = true;
    try {
      final res = await AppointmentDataSource.getAlldoctorsbyspecialety(id: id);
      // doctorsOfSelected = null;
      // doctorNameToId.clear();
      if ((res.data?.isEmpty ?? true)) {
        doctorsOfSelected = null; // هذا يعني لا تعرض الدروب داون
        showSnackBar("لا يوجد أطباء لهذا التخصص");
      } else {
        doctorsOfSelected = res;
      }
      selectedDoctor.value = null;
      doctorId = null;

      //doctorsOfSelected = res;

      // for (final d in res.data ?? []) {
      //   final fullName = [d.firstName, d.fatherName, d.lastName]
      //       .where((s) => (s ?? '').isNotEmpty)
      //       .join(' ');
      //   !doctorsOfSelected.add(fullName);
      //   if (d.id != null) {
      //     doctorNameToId[fullName] = d.id!.toString();
      //   }
      // }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل الأطباء");
    } finally {
      isLoadingDoctors.value = false;
    }
  }

  void onDoctorSelected(String doctorIdSelected) {
    // selectedDoctor.value = doctorName;
    // doctor_id = doctorNameToId[doctorName];
    doctorId = doctorIdSelected;
    print("✅ تم اختيار الطبيب id = $doctorId");
    //print("✅ تم اختيار الطبيب: $doctorName => id = test");
  }

  Future<void> appointmentRequest() async {
    print("📌 specialty_id = $specialty_id");
    print("📌 doctor_id = $doctorId");

    if (specialty_id == null || doctorId == null) {
      showSnackBar("اختر التخصص والطبيب أولاً");
      return;
    }

    print("⏳ isSubmitting = true");
    isSubmitting = true;
    update();

    await AppointmentDataSource.appointmentriq(
      specialty_id: specialty_id!,
      doctor_id: doctorId!.toString(),
    );
    isSubmitting = false;
    update();

  }
}
