import 'package:flutter/material.dart';
import 'package:flutter_project/src/login/send_code.dart';
import 'package:flutter_project/src/webview/LQWebView.dart';
import 'package:flutter_project/utils/configuration/configuration.dart';
import 'package:flutter_project/utils/extension/int_extension.dart';
import 'package:flutter_project/utils/share/lq_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginContainer();
  }
}

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  ///密码输入框是否 眯眼
  bool _visibility = false;

  ///是否同意协议
  bool _isAgreeProtocol = false;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                loginTitleWidget(),
                loginInputWidget(),
                loginButton(),
              ],
            )
          ],
        ));
  }

  Widget loginTitleWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('密码登录',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: LQColors.text,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '请输入手机号密码登录',
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
  Widget loginInputWidget() {
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
          TextField(
            controller: _passwordController,
            obscureText: !_visibility,
            decoration: InputDecoration(
              labelText: "请输入密码",
              hintText: "登录密码",
              hintStyle: const TextStyle(color: LQColors.text, fontSize: 16),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _visibility = !_visibility;
                    });
                  },
                  icon: Icon(
                    _visibility ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  )),
            ),
            onChanged: (String value) {},
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SendCodeScreen.routeName);
              },
              child: const Text(
                '验证码登录',
                style: TextStyle(color: LQColors.theme, fontSize: 14),
              )),
        ],
      ),
    );
  }

  ///登录按钮及协议
  Widget loginButton() {
    bool canLogin = _userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty && _isAgreeProtocol;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ElevatedButton(
              onPressed: canLogin ? () {
                ///登录点击

              } : null,
              style: ButtonStyle(
                fixedSize:
                    MaterialStateProperty.all(const Size(double.maxFinite, 44)),
                enableFeedback: true,
              ),
              child: const Text(
                '登录',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Checkbox(
                  value: _isAgreeProtocol,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _isAgreeProtocol = !_isAgreeProtocol;
                    });
                  }),
              TextButton(
                  onPressed: () {
                    String url = Configuration.h5Host + '/privacyProtocol.html';
                    Navigator.of(context).pushNamed(LQWebView.routeName, arguments: {"title":"用户协议与隐私政策", "url":url});
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "同意",
                          style: TextStyle(
                              color: LQColors.text[800], fontSize: 12),
                        ),
                        const TextSpan(
                          text: "《明楼智慧云用户协议与隐私政策》",
                          style: TextStyle(color: LQColors.theme, fontSize: 12),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
