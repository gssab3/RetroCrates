package rc.control;

public class utils {
	public static String formatta(String s) {
		String result = "";
		for(int i=0; i<s.length(); i++) {
			if(s.charAt(i) == '_')
				result = result+" ";
			else
				result = result+s.charAt(i);
		}
		return result;
	}
}
