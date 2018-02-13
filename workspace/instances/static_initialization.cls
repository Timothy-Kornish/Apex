public class MyClass {
	
	class RGB {
		Integer red;
		Integer green;
		Integer blue;

		RGB(Intger red, Integer green, Integer blue) {
			this.red = red;
			this.green = green;
			this .blue = blue;
		}
	}

	static Map<String, RGB> colorMap = new Map<String, RGB>();

	static {
		colorMap.put('red', new RGB(255, 0, 0));
		colorMap.put('green', new RGB(0, 255, 255));
		colorMap.put('blue', new RGB(255, 0, 255));
	}
}
	
