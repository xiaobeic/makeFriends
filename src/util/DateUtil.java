package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    /**
     * @Title: getDateFromTime 
     * @Description: TODO(从时间字符串中获取日期对象) 
     * @param @param time
     * @param @return    设定文件 
     * @return Date    返回类型 
     * @throws
     */
    public static Date getDateFromTime(String time) {
        SimpleDateFormat sdf = null;
        if (time.indexOf(":") > 0) {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        } else {
            sdf = new SimpleDateFormat("yyyy-MM-dd");
        }
        Date date = null;
        try {
            date = sdf.parse(time);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return date;
    }
}
