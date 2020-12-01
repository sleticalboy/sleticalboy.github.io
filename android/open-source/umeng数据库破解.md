# 破解 umeng 数据库加密内容

---
## 相关内容
- sp 文件: `umeng_general_config.xml`
- sp 中一个key 为 `ek__id` 的值（945a824208d5647d）
- 数据库文件: `ua.db`

---
## 生成加密秘钥
```java
/**
 * umeng 生成加密秘钥的的算法
 * @param ek__id 存储在 SharedPreference 中的字符串，其 key 为 ek__id
 * SharedPreference 对应的文件为 umeng_general_config.xml
 **/
public static String getEncryptKey(final String ek__id) {
    String ek;
    final String sub_str = ek__id.substring(1, 9);
    final StringBuilder ret = new StringBuilder();
    for (int i = 0; i < sub_str.length(); ++i) {
        final char a_ch = sub_str.charAt(i);
        if (Character.isDigit(a_ch)) {
            if (Integer.parseInt(Character.toString(a_ch)) == 0) {
                ret.append(0);
            } else {
                ret.append(10 - Integer.parseInt(Character.toString(a_ch)));
            }
        } else {
            ret.append(a_ch);
        }
    }
    ek = ret.toString()
    if (ek != null && ek.length() != 0) {
        ek = ek + ret.reverse().toString();
    }
    return ek;
}
```

---
## 获取异常堆栈信息
```java
/**
 * 生成 base64 类型的异常堆栈信息
 *
 * @param context 发生崩溃时的错误栈信息
 * @param ek 加密秘钥
 */
 public static String toBase64(final String context, final String ek) {
    String ret = null;
    try {
        // ek 在 umeng 的 jar 包中是一个类的一个静态字段
        if (TextUtils.isEmpty(ek)) {
            ret = context;
        } else {
            // 对堆栈信息进行加密
            // com.umeng.commonsdk.statistics.common.DataHelper 源码如下
            byte[] input = DataHelper.encrypt(context.getBytes(), ek.getBytes());
            ret = Base64.encodeToString(input, 0);
        }
    } catch (Exception ignored) {
    }
    return ret;
}
```

---
## 数据加解密工具类
```java
// DataHelper 源码
package com.umeng.commonsdk.statistics.common;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public final class DataHelper {

    private static final byte[] iv = new byte[]{10, 1, 11, 5, 4, 15, 7, 9, 23, 3, 1, 6, 8, 12, 13, 91};
    public static long ENVELOPE_EXTRA_LENGTH = 1024L;
    public static long ENVELOPE_ENTITY_RAW_LENGTH_MAX = 2097152L;
    public static long ENVELOPE_LENGTH_MAX = 204800L;

    private DataHelper() {
    }

    public static byte[] reverseHexString(String source) {
        if (source == null) {
            return null;
        } else {
            int len = source.length();
            if (len % 2 != 0) {
                return null;
            } else {
                byte[] ret = new byte[len / 2];

                for(int i = 0; i < len; i += 2) {
                    ret[i / 2] = (byte)Integer.valueOf(source.substring(i, i + 2), 16);
                }

                return ret;
            }
        }
    }

    public static boolean largeThanMaxSize(long left, long right) {
        return left > right;
    }

    public static String toHexString(byte[] input) {
        if (input == null) {
            return null;
        } else {
            StringBuffer ret = new StringBuffer();

            for(int i = 0; i < input.length; ++i) {
                ret.append(String.format("%02X", input[i]));
            }
            return ret.toString().toLowerCase(Locale.US);
        }
    }

    public static byte[] hash(byte[] input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.reset();
            md.update(input);
            return md.digest();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 加密
     */
    public static byte[] encrypt(byte[] input, byte[] key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding");
        cipher.init(1, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
        return cipher.doFinal(input);
    }

    /**
     * 解密
     */
    public static byte[] decrypt(byte[] input, byte[] key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding");
        cipher.init(2, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
        return cipher.doFinal(input);
    }

    public static int random(int var0, String var1) {
        boolean var2 = false;
        float var3 = (new Random()).nextFloat();
        int var7;
        if ((double)var3 < 0.001D) {
            if (var1 == null) {
                MLog.e("--->", new Object[]{"null signature.."});
            }

            int var4 = 0;

            try {
                var4 = Integer.parseInt(var1.substring(9, 11), 16);
            } catch (Exception var6) {
            }

            var7 = (128 | var4) * 1000;
        } else {
            var7 = (new Random()).nextInt(var0);
            if (var7 <= 255000 && var7 >= 128000) {
                var7 = 127000;
            }
        }

        return var7;
    }

    public static String convertExceptionToString(Throwable thr) {
        if (thr == null) {
            return null;
        } else {
            String ret = null;
            try {
                StringWriter writer = new StringWriter();
                PrintWriter printer = new PrintWriter(writer);
                thr.printStackTrace(printer);

                for(Throwable e = thr.getCause(); e != null; e = e.getCause()) {
                    e.printStackTrace(printer);
                }

                ret = writer.toString();
                printer.close();
                writer.close();
            } catch (Exception ignored) {
            }

            return ret;
        }
    }

    public static String assembleURL(String var0) {
        String var1 = "https://";
        String var2 = "/unify_logs";
        return var1 + var0 + var2;
    }

    public static String assembleStatelessURL(String var0) {
        String var1 = "https://";
        return var1 + var0;
    }

    public static String encryptBySHA1(String var0) {
        MessageDigest var1 = null;
        String var2 = null;
        byte[] var3 = var0.getBytes();

        try {
            var1 = MessageDigest.getInstance("SHA1");
            var1.update(var3);
            var2 = bytes2Hex(var1.digest());
            return var2;
        } catch (Exception var5) {
            return null;
        }
    }

    static String bytes2Hex(byte[] var0) {
        String var1 = "";
        String var2 = null;

        for(int var3 = 0; var3 < var0.length; ++var3) {
            var2 = Integer.toHexString(var0[var3] & 255);
            if (var2.length() == 1) {
                var1 = var1 + "0";
            }

            var1 = var1 + var2;
        }

        return var1;
    }
}
```