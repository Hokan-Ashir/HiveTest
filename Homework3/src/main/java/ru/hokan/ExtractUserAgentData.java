package ru.hokan;


import eu.bitwalker.useragentutils.UserAgent;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

import java.util.HashMap;
import java.util.Map;

public class ExtractUserAgentData extends UDF {
    public Map<Text, Text> evaluate(String str) {

        UserAgent userAgent = UserAgent.parseUserAgentString(str);
        Map<Text, Text> map = new HashMap<Text, Text>();
        map.put(new Text("OS name"), new Text(userAgent.getOperatingSystem().getName()));
        map.put(new Text("Browser"), new Text(userAgent.getBrowser().getName()));
        map.put(new Text("DeviceType"), new Text(userAgent.getOperatingSystem().getDeviceType().getName()));
        return map;
    }
}