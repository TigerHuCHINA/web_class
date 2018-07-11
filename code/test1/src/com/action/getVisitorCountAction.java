package com.action;

/*import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class getVisitorCountAction {
	public static void readFileByLines(String fileName) {
		File file = new File(fileName);
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			for(int i = 1;reader.readLine()!=null;i++) {
				if(i==3) {
					tempString = reader.readLine();
				}
			}
			//一次读一行，读入null时文件结束
			//			while ((tempString = reader.readLine()) != null) {
			//			tempString=reader.readLine(3);
			System.out.println(tempString);
			//			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
	}
}
 */
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
public class getVisitorCountAction{
	/**
	 * 读取文件指定行。
	 */
	public static void main(String[] args) throws IOException {
		// 指定读取的行号 
		int lineNumber = 3;
		// 读取文件 
		File sourceFile = new File("D:/visitCount1.txt");
		// 读取指定的行 
		readAppointedLineNumber(sourceFile, lineNumber);
		// 获取文件的内容的总行数 
		//System.out.println(getTotalLines(sourceFile));
	}
	// 读取文件指定行。 
	static void readAppointedLineNumber(File sourceFile, int lineNumber)
			throws IOException {
		FileReader in = new FileReader(sourceFile);
		LineNumberReader reader = new LineNumberReader(in);
		String s = reader.readLine();
		if (lineNumber < 0 || lineNumber > getTotalLines(sourceFile)) {
			System.out.println("不在文件的行数范围之内。");
		}
		{
			//int i = 1;
			while (s != null) {
				//System.out.println("当前行号为:"+ reader.getLineNumber());
				//reader.setLineNumber(20);
				//System.out.println("更改后行号为:"+ reader.getLineNumber());
				//if(i==3) {
					System.out.println(s);
				//}
				//System.exit(0);     
				s = reader.readLine();
				//i++;
			}
		}
		reader.close();
		in.close();
	}
	// 文件内容的总行数。 
	static int getTotalLines(File file) throws IOException {
		FileReader in = new FileReader(file);
		LineNumberReader reader = new LineNumberReader(in);
		String s = reader.readLine();
		int lines = 0;
		while (s != null) {
			lines++;
			s = reader.readLine();
		}
		reader.close();
		in.close();
		return lines;
	}
}



