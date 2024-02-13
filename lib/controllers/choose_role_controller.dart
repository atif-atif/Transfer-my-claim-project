import 'package:get/get.dart';

enum RoleStatus { USER, LAWYER, ADMIN }

class ChooseRoleController extends GetxController {
  Rx<RoleStatus> currentRoleStatus = RoleStatus.LAWYER.obs;

  changeRoleStatus({required RoleStatus roleStatus}) {
    currentRoleStatus.value = roleStatus;
  }

  // getCurrentRole() {
  //   switch (currentRoleStatus.value) {
  //     case RoleStatus.OWNER:
  //       Get.off(const CreateBrandScreen());
  //       break;
  //     case RoleStatus.CHEF:
  //       Get.off(const CreateChefScreen());
  //       break;
  //     case RoleStatus.MANAGER:
  //       Get.off(const CreateManagerScreen());
  //       break;
  //   }
  // }

  checkCurrentRole() {
    return currentRoleStatus.value;
  }
}

final roleController = Get.put(ChooseRoleController());
