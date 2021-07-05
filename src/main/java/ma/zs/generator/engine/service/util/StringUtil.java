package ma.zs.generator.engine.service.util;


public class StringUtil {

    public static boolean isEmpty(String string) {
        return string == null || string.isEmpty();
    }

    public static boolean isNotEmpty(String string) {
        return !isEmpty(string);
    }

    public static String upperCaseFirstLetter(String name) {
        if (isEmpty(name)) {
            return "";
        } else {
            return (name.charAt(0)+"").toLowerCase()+name.substring(1,name.length());
        }
    }
}
