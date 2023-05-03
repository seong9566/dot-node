import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-03 15:29:10
 * Last Modified: 2023-05-03 17:08:12
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOTnode Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'id'.tr,
                    hintText: 'hint_id'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'password'.tr,
                    hintText: 'hint_password'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  child: Text("login".tr),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("sign".tr),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
