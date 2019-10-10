package com.qsxh.utiles;
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
    public static String app_id = "2016101200671303";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCZSM03NJIZCWjYnQw61E0rAV5jiaX8dZylJP/++szbwa5IjWTJXwqK6VbiLiKpz1WklmIUtCCyOkI7dC4pXON/+TbXbEbIRUj8ZtBwnZ+YH9noaLt777xjIxxeYcCSUkBxLkBAnxx5nt/De2inPu2+R/bSqfkcP01gto83LYQC7tLQ10rbM0W8WsGUcS7+DA4bkiR7Hd5j5iu/T6PI3/B8zKu5tylmW6E93eOAg4mjk8XmSKzK9iJG5i3X8ZaGcAEOOXjJ5j+YHrmb779vDnJRkUCYUdlwQwL9K3U2vaaPqsXT5OMYXCq+dJd0/HyvHql172j0PiSsNznCTkTFSp6hAgMBAAECggEAa9lUQlZjwOfk9BuzgiTj0rFY1xH/Tpz1xSA+WgneX3RrirKpSiHrygcZUXSCgRXXPUFt6wE9zAi/lxNMc1/e1ajkFDgjqT9OdgBlAgd1RdSLPkGKQE5SLzKCAEoo8wqaOsf+/zi0EUJeUC0hWiMlpW7+1AQxuNU1PSnVpE4LBwAljJg1nNzzf6hfZ/SiUYL0Pau+9MhhBIFmK26e0iULKDK24FYdhlRp7jhWdXt5xptKzYfAwSUJ0QEckwlxVD/Au0z+UF9FYvpwSupoSxLeeqkzAr2WGYtnATDCt+CITYBqZu5C3tl+P0NidPVfrEcuhDwpqF3195buMWcP2RADPQKBgQDp1pCPu8Yw8iDjCM92sgb/KeCjkswJaT+7Gs1Wu4BnONA2DPou5WCI8TAdcx0Jaf16vZBPXoin9zHpUdLT1+ysEeN/AjHwuMJi5G42QmtmkUDkRUPy7jgxUSIt7gYUzAVBMrpiPQewMhHJ8ihQGwZbvkGnVdac9wwKTiTFV6x0PwKBgQCnz9Km/zvHbtxGwFRSCYNTJnrrjKsYYPwLmyCo4t6ECM9eC8H1k69tfobwwJ0QD6Gwb7VN5raULVJ4GXiPI+q6rCtIyqS/aBHXyJiegHUXJWt+hLeyvIzUGbVNV9VSEtVvtsO0+gS4gKPtXCUIa+JHq1PlKJjOY/I1Tx/emMi1HwKBgErwe5XEvMh04HtCGJLWjQ17U0W4xvEBLO5+sW3pW0Y5W+jmkcszsZNRkHTvrk+VCyop1DTLfAowW2uF0IYZvfyLIxhSEMUvwQRGZte2w4q0ZFKDrDoPhCyx7r0/ee1yUQDLDBZtrqgV88N/etHpR0lhmNLS3JujRNWMo5Ym+dqrAoGBAJtn5tkofR/QFsaezne6v5d9h1AkUT6eckv9OV2t3AvCbOfXU6QtRMTN7AGBHvMExuQyT2D5TBQldL4sOG23AWYmk18x6ygnJH8FEfGXXNg2mznrhoNMAc9aj4A02yTKtEZkpxEuiLikySrDrrgB0Og2TddmpTxdaqzbvdPTAexZAoGAZNwCcRyOd90iF6vyGrRzcDUe7hlZhIHDapcV1f+j/x9GbFgiSWPs8zECKMoCZBQTEhaxH+8UrAy+JroA5FNIh39TdIcMyG60VrFvxkscIDUFrXeXSc3Cf6RuGdIgtaYxsXOloBKW4aKrqWcSicypUux7Cy9MxyQL1LQndVdp/Nw=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApU+hI0CGKmqovKd+o1iufj0kcsNOS2X2BNAC6Sk8j39PtQYCQ8mvx1NsjF51hlYUAERhh6XWziwdsK8DuhnU8i64G3aTBd813PKsYdoYFPW7foQj54/h6TV2G4xRhzEh8ZcwEXdjh5f4zQ5lzspsTDgQx7wNstPNhzdq48thEmmF/OVJiZYtJaOuM1yhqpw0Jl4KP8kqrDDfEAAyG73FHoWVzzEUavmCd1hMFImP+XfT1y1nCHbYjEUmofrZCc1CmTHUDmT0JoSMQWpPrHimQv0lCcA0k+621tyd/a/nySYiQGVpO8OXeiIT8gIxn76d4XMcUXyUOjs10OjTkYjZVQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/Project04_war_exploded/jsp/alipay/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //public static String return_url = "http://localhost:8080/Project04_war_exploded/jsp/alipay/return_url.jsp";
    public static String return_url = "http://localhost:8888/Project04_war_exploded/jsp/alipay/return_url.jsp";

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

