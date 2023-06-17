/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-22 
 * Last Modified: 2023-05-22
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 회원가입 페이지 Model 
 * 
 * Model은 ViewModel이 요청하는 데이터를 응답.
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class SignUpModel {
  dynamic result;

  SignUpModel(this.result);

  // factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
  //       result: json["result"],
  //     );
  // Map<String, dynamic> toJson() => {
  //       "result": result,
  //     };
}
