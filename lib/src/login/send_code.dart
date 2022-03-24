import 'package:flutter/material.dart';
import 'package:flutter_project/utils/extension/int_extension.dart';

import '../../utils/share/lq_colors.dart';

class SendCodeScreen extends StatefulWidget {
  static String routeName = '/SendCodeScreen';

  const SendCodeScreen({Key? key}) : super(key: key);

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // fit: StackFit.loose,
          children: [

            Positioned(
              child: Image.asset(
                'assets/images/login/img_bj.png',
                width: 214.px,
                height: 292.px,
                fit: BoxFit.fill,
              ),
              right: 0,
              top: 0,
            ),
            ListView(
              children: [
                const SizedBox(height: 80),
                titleWidget(),
                inputWidget(),
                sendCodeButton(),
              ],
            ),
            SizedBox(
              height: 180,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
            ),
          ],
        ));
  }

  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('验证码登录',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: LQColors.text,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '请输入手机号获取验证码',
            style: TextStyle(
                color: LQColors.text,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  ///输入框相关
  Widget inputWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 30.px, top: 100.px, right: 30.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _userNameController,
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration: const InputDecoration(
                labelText: "请输入手机号",
                hintText: "登录手机号",
                hintStyle: TextStyle(color: LQColors.text, fontSize: 16),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                )),
            onChanged: (String value) {},
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '密码登录',
                style: TextStyle(color: LQColors.theme, fontSize: 14),
              )),
        ],
      ),
    );
  }

  ///登录按钮及协议
  Widget sendCodeButton() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ElevatedButton(
              onPressed: () {
                ///发送验证码点击
              },
              style: ButtonStyle(
                fixedSize:
                    MaterialStateProperty.all(const Size(double.maxFinite, 44)),
                enableFeedback: true,
              ),
              child: const Text(
                '发送验证码',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ],
    );
  }
}
