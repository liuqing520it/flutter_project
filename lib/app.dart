import 'package:flutter/material.dart';
import 'package:flutter_project/src/main/main/home_page.dart';
import 'package:flutter_project/src/profile/mine/profile.dart';
import 'package:flutter_project/src/workbranch/workbranch/workbranch.dart';
import 'package:flutter_project/utils/colors/lq_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LQ',
      theme: ThemeData(primarySwatch: LQColors.theme),
      home: const AppMain(),
    );
  }
}

///**
///* tab bar 配置
class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          Workbranch(),
          Profile(),
        ],
      ),///tabBar children集合
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: LQColors.theme, fontSize: 14),///选中文字样式
        unselectedLabelStyle:const TextStyle(color: LQColors.text, fontSize: 14),///未选中文字样式
        currentIndex: _selectedIndex,///记录当前位置

        onTap: (index) {///点击事件
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          LQBottomBarItem('首页', "icon_sy", "icon_h_sy"),
          LQBottomBarItem('工作台', "icon_gzt", "icon_h_gzt"),
          LQBottomBarItem('我的', "icon_wd", "icon_h_wd"),
        ],
      ),
    );
  }
}

///
///单个tab bar item 创建
class LQBottomBarItem extends BottomNavigationBarItem {
  final String title;
  final String imageName;
  final String imageActiveName;

  LQBottomBarItem(this.title, this.imageName, this.imageActiveName)
      : super(
          label: title,
          tooltip: title,
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image(
              image: AssetImage(
                'assets/images/tab/$imageName.png',
              ),
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image(
                image: AssetImage('assets/images/tab/$imageActiveName.png')),
          ),
        );
}
