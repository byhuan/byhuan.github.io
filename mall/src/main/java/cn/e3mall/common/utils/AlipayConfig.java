package cn.e3mall.common.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092500595581";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQC9ZWpH2+qNly56BEX5g0HIi9AVCCUuF9vs9wNGxFTuFGi3nEXuwbXj0rCr4D9WYu6A47u0/HrkRfZoIwD1+SRv4ZHc18xdLi5PnPRhKspq607av68juNCdGUw8ZbtWIWTI9Ji8jeImxE4DWuwIEdeM8n8psPRvEVSy93Su2Mw5iMMHJwBXmVI4YcI/VkXb/ExB/O+e+J9SDu+E8Gn52XiFFg6QLFe+fpQfKuNtLRYcFUPDmHFu1zbFY8+odgBysDF0uKilRluDPM5s3qAzcK5f9EnTps6Mk8fwuWtWyfR0jgkEbMOioE0RrxPDdaJKukdIxfbPObYPBibsHfTTOmZNAgMBAAECggEBALetUQNbrf+fLL28wzgWKYgav7SF77jh/rGzZQQOh+dU97GJ5vCEAKhvvlMR6ZsX2wI42ePOMEiN6UhZGidydfnjIxiwWEvN66/eIcrSOviyOAlBeNMF+5s/24V/i80eGaYiQLYsS7UZECeE1/+Dfi39R4HhUU0d26ys/AZNztHDuCgWXuO3k8h+ZlfoxrZ+5lA1rkxEIVSQ6go9KwOTTYW5IKKHb2CeBON0BGciqpnZqgYngQXJ1pwJexwHMNphEBeHLqyxG94PLFkWQVCqwD4dUKj6tECmvQ07zS/m0gKhC5gBCcj8Db/BTFxa7dlcooeG9o9rDbkklqdbFdWmkakCgYEA+WAYzY3T+nfrGAebkztHeNVcLwrBS0HWhA43Mr+dneeea6/2YOSEB4IfWYISFs5mX6Q69o6n3lcLVqYYtqw4dZwwo/7LNQBli+gTE4L6QhZwuaM3OQLKRXuxDkkMCAqIwO6F8fyzj36fLmvHXvmQkUPSbsAT3Yn0nFrmvsBDs1MCgYEAwm1sX3TQdBlr0ZOG23TmwF5H55Wl91Dn+Ulfm50hrUH8JFTMudBQew/2jezp5jVD9gwKpa+rolusGgb4lMZjMrRO3NTyYz7xm7GMvwiGydNhPC0BuXgNfgbUAhtU6y0AxQADDgZoYi0OtALdpTdLWg45shmY+OkkdOwHI3JM698CgYEAxvz2bbeZich80NzpOI/Z1UKzX1o+qVWs3g0V4KnkFKdI03dCq0hNTkx3xY2z73zdVb4PysREkXd1tbuuBr3gA4ERkxryfaWGYiBacHxYQ7nyUz85BoYCb3Vm8BY7woLdYs4yFclmYr9QN9OK8G9F+5RZ60Pb1jCJ/uXOMDHtE78CgYEAl6CKke8h2kkxAqKQ23lRs9hTL1JPuo6IOqt0OoHSj7IUF6lid87z1OVgHNMUnooP1EUT0J8ttVLU5v9kwXHuTs67ahFQbwHZnthasWjO5XtKK4nV/HSZ4R0mHfZ+xWG1Ze1adIeexGHrQ4uwm3aB91t8t16rJAN+gQjJkGVFg/UCgYEAmr9RMHBvlAGF4RvWT+0XzlXLyW0YNan+pHY/u43cu8D+qdqVU1qCUxLd0JeqPfJq89Xtjm4+kiIbEIomuOnnBZk0wdMMBHSyuUNQi4sXApAKCN6FBldASxBvzs+BAp2vu5YwkOJY4qg5hNU0o1/pt5CyYwUf9s81nEb4o6xfSl8=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA24h1dx5P6rs8P+0iFwyn8g89MqSOPUBHom+VV2l46rgBc/n0PoYMHmr2KKcVfnqiEKd0EgW75U1KbwP7thFnxCFKEQvT25wR9PR+cAMu/oExkXUceB3jyz/uKY96iGnXg5PPGr9GEe4Z57K2HmERkMqLaYfSgNb9Nj4aPCHyfGCyOsSCFgxFhyEZuigyfvs2LxhCXeqqD2ogTznT7JqLPyZ/IpP4eWW5lKDhBIALXF/uNNEljK6jXxO/qQmlHg/IFNhp0Jha8n1R3eLJrHgD6w2BTBHORgsDNGKbohC/GMKJwRXP2y0feQQjjQo6+tvbuKuHixkX/sZy0m3yPp3AgQIDAQAB+YNByIvQFQglLhfb7PcDRsRU7hRot5xF7sG149Kwq+A/VmLugOO7tPx65EX2aCMA9fkkb+GR3NfMXS4uT5z0YSrKautO2r+vI7jQnRlMPGW7ViFkyPSYvI3iJsROA1rsCBHXjPJ/KbD0bxFUsvd0rtjMOYjDBycAV5lSOGHCP1ZF2/xMQfzvnvifUg7vhPBp+dl4hRYOkCxXvn6UHyrjbS0WHBVDw5hxbtc2xWPPqHYAcrAxdLiopUZbgzzObN6gM3CuX/RJ06bOjJPH8LlrVsn0dI4JBGzDoqBNEa8Tw3WiSrpHSMX2zzm2DwYm7B300zpmTQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://kudivq.natappfree.cc/order/notify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8888/order/return_url";
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

