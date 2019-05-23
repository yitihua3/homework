package cn.edu.nenu.util;

/**
 * Created by wangh on 2019/4/26.
 */
public class Constants {
    public static final String UTF_8 = "utf-8";

    public enum Status{
        ENABLE(1,"启用"),
        DISABLE(2,"禁用");

        private int key;
        private String value;

        Status(int key,String value) {
            this.key = key;
            this.value = value;
        }

        public int getKey() {
            return key;
        }

        public void setKey(int key) {
            this.key = key;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

}
