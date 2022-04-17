package supportingjson;

import java.io.*;

public class jsonbody {


    public static void writeInfor(String text) throws FileNotFoundException {

        PrintWriter writer = new PrintWriter("infor.json");
        writer.println(text);
        writer.flush();
        writer.close();
    }
}