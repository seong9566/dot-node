import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/service/user_service.dart';
import 'package:dot_node/web_view/pages/auth/model/sign_up_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-22 
 * Last Modified: 2023-05-22
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 회원가입 페이지 ViewModel
 * TODO: Model을 ViewModel위에 선언할까..? 어차피 데이터가 하나인데..아니면 통일성을 위해서 분리??
 * Model에 필요 데이터를 요청
 * 
 * Provider 사용 시 
 * autoDispose : 변수의 값이 변경 될 경우 이전 값은 쓰레기 값이 되고, provider에서 기본적으로 해제 해주지 않는다, 한번 사용하고 이후 사용하지 않는 것들은 autoDispose사용
 * -> autoDispost를 넣으면 ViewModel이 없어져서 다시 요청을 할 수 없다, check는 한번하고 두번째도 시도를 해야하기 때문에 autoDispose x
 * family : 특정 변수의 정보를 가져오고 싶을 경우 사용.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

final signUpViewModel = StateNotifierProvider<SignUpViewModel, SignUpModel?>((ref) {
  return SignUpViewModel(null, ref);
});

class SignUpViewModel extends StateNotifier<SignUpModel?> {
  final UserService userService = UserService();
  //final mContext = navigatorKey.currentContext;
  Ref ref;
  SignUpViewModel(SignUpModel? state, this.ref) : super(state);

  Future<void> notifyViewModel(String username) async {
    ResponseDto responseDto = await userService.fetchUsernameCheck(username);
    if (responseDto.code == "OK") {
      if (responseDto.data is Map<String, dynamic>) {
        dynamic result = responseDto.data['result'];
        Logger().d("여기가 실행 안됌? $result");
        state = SignUpModel(result);
        Logger().d("여기 실행 확인 : ${state!.result}");
        //여기 까진 잘 들어갔음
      }
      return;
    }
  }
}