

class Configuration{
  ///当前是否是生产环境 true:生产环境;  false:开发环境
  static const bool isProduction = false;
  ///请求地址
  static const String baseUrl = isProduction ? 'https://www.ming-lou.com' : 'http://www.jiuchenshuzi.com';
  ///H5地址
  static const String h5Host = (baseUrl + "/mlH5");
  ///请求校验auth key 请求必传
  static const String signAuthKey = "MLQ1liz4Hn3LrTmmPdFE0DuOG9zhzSBnE3EggzD7";

}