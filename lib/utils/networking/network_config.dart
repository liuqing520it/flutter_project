
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import "package:characters/characters.dart";
import '/utils/configuration/configuration.dart';

class NetworkingConfig {

  static String configSignString(int timeStamp){
    // 规则：
    // 1.当前时间毫秒数 1589176009867*2=3178352019734
    // 2.取偶数位，即字符串数组下标为1,3,5,7,9,11的数字185093
    // 3.拼接后3位即734，得到185093734
    // 4.反转得到 437390581
    // 令牌生成样例
    /// 1.获取当前时间戳字符串
    String twoTimeStr = (timeStamp * 2).toString();
    /// 2.取偶数位，即字符串数组下标
    List<String> timeArray = [];
    for (String char in twoTimeStr.characters) {
      timeArray.add(char);
    }
    List<String> twoTimeArray = [];
    for (int i = 0; i < timeArray.length; i++) {
      if (i % 2 != 0) {
        twoTimeArray.add(timeArray[i]);
      }
    }
    String threeTimeStr = twoTimeArray.join('');
    /// 3. 拼接后3位
    String fourTimeStr = twoTimeStr.substring(twoTimeStr.length - 3);
    String fiveTimeStr = threeTimeStr + fourTimeStr;
    List<String> threeTimeArray = [];
    for (String char in fiveTimeStr.characters) {
      threeTimeArray.add(char);
    }
    /// 4. 反转
    List<String> fourTimeArray = threeTimeArray.reversed.toList();
    ///console.log('最终结果: ' + SixTimeStr);
    return fourTimeArray.join('');
  }

  static String configSequenceId(){
    String currentTimeString = getCurrentTimeString().toString();
    int random = Random().nextInt(1000000);
    String tempString = currentTimeString + random.toString();
    return tempString.replaceAll('.', '');
  }

  static String configCheckSum(String seqId){
    String checkSumStr = seqId + Configuration.signAuthKey;
    String encodeURIStr = Uri.encodeComponent(checkSumStr);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(encodeURIStr);
    String checkSum = md5.convert(utf8.encode(encoded)).toString();
    return checkSum;
}

  static int getCurrentTimeString(){
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String getITagString(){
    String currentTimeString = getCurrentTimeString().toString();
    int random = Random().nextInt(1000);
    return currentTimeString + random.toString();
  }
}