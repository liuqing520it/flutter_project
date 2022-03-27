import 'package:flutter/material.dart';
import 'package:flutter_project/src/profile/mine/api/profile_api.dart';
import 'package:flutter_project/utils/widget/hud/progress_hud.dart';
import '../../../utils/share/lq_colors.dart';
import '../../../utils/share/size_fit.dart';
import 'model/profile_model.dart';
import 'model/user_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserProfile? _userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            userHeaderWidget(),
            Expanded(
              child: Container(
                height: double.maxFinite,
                color: LQColors.gray[300],
                padding:const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    myCollectWidget(),
                    profileListWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///个人中心头像
  Widget userHeaderWidget() {
    ImageProvider userPhoto;
    if (_userProfile?.photo == null) {
      userPhoto = const AssetImage('assets/images/profile/icon_tx.png');
    } else {
      userPhoto = NetworkImage(_userProfile!.photo);
    }
    String userName = "华仔";

    ///_userProfile?.nickName ?? '';
    String phone = _userProfile?.phone ?? '';
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 30, left: 15, right: 15),
      color: Colors.white,
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: userPhoto,
                radius: 30,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        color: LQColors.text[800],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    phone,
                    style: TextStyle(color: LQColors.text[300], fontSize: 13),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }

  ///我的收藏 布局
  Widget myCollectWidget() {
    String collect = (_userProfile?.collectCount ?? '0').toString();
    return Stack(
      children: [
        const Positioned(
          child: Image(
            image: AssetImage('assets/images/profile/img_bj.png'),
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Image(
                        image: AssetImage('assets/images/profile/icon_jh.png')),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '我的集合',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      collect,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        )
      ],
    );
  }

  Widget profileListWidget() {
    List<ProfileModel> dataSource = [
      ProfileModel('icon_yjfk', '意见反馈', RowType.feedback),
      ProfileModel('icon_gywm', '关于我们', RowType.aboutUs),
      ProfileModel('icon_lxwm', '联系我们', RowType.contactUs),
      ProfileModel('icon_xtsz', '系统设置', RowType.systemSetting),
    ];

    return Expanded(
      child: ListView.builder(
        ///禁止滚动
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataSource.length,
        itemExtent: 64,
        itemBuilder: (ctx, index) {
          ProfileModel itemModel = dataSource[index];
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white,),
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                        image: AssetImage(
                            'assets/images/profile/${itemModel.imageName}.png')),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      itemModel.title,
                      style: TextStyle(color: LQColors.text[800], fontSize: 15),
                    )
                  ],
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ///获取用户信息
  _loadUserInfo() {
    ProfileApi.loadUserInfo((res) {
      setState(() {
        _userProfile = res;
      });
    }, (error) {
      LQProgressHud.showError(error);
    });
  }
}
