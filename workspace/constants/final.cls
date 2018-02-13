public class MyClass {
	static final Integer = PRIVATE_INT_CONST = 200;
	static final Integer = PRIVATE_INT_CONST2;

	public static Integer calculate() {
		return 2 + 7;
	}
	// initialize constant with a static block and static method
	static {
		PRIVATE_INT_CONST2 = calculate();
	}
}

