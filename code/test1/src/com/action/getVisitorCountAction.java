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
			//һ�ζ�һ�У�����nullʱ�ļ�����
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
	 * ��ȡ�ļ�ָ���С�
	 */
	public static void main(String[] args) throws IOException {
		// ָ����ȡ���к� 
		int lineNumber = 3;
		// ��ȡ�ļ� 
		File sourceFile = new File("D:/visitCount1.txt");
		// ��ȡָ������ 
		readAppointedLineNumber(sourceFile, lineNumber);
		// ��ȡ�ļ������ݵ������� 
		//System.out.println(getTotalLines(sourceFile));
	}
	// ��ȡ�ļ�ָ���С� 
	static void readAppointedLineNumber(File sourceFile, int lineNumber)
			throws IOException {
		FileReader in = new FileReader(sourceFile);
		LineNumberReader reader = new LineNumberReader(in);
		String s = reader.readLine();
		if (lineNumber < 0 || lineNumber > getTotalLines(sourceFile)) {
			System.out.println("�����ļ���������Χ֮�ڡ�");
		}
		{
			//int i = 1;
			while (s != null) {
				//System.out.println("��ǰ�к�Ϊ:"+ reader.getLineNumber());
				//reader.setLineNumber(20);
				//System.out.println("���ĺ��к�Ϊ:"+ reader.getLineNumber());
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
	// �ļ����ݵ��������� 
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



