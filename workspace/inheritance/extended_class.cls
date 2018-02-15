public class OuterClass {
	
	private static final Integer MY_INT;
	public static String sharedState;
	
	public static Integer getInt() {
		return MY_INT;
	}

	static {
		MY_INT = 2;
	}

	private final String m;
	
	// instance Initialization block
	{
		m = 'a';
	}

	// inner interface
	public virtual interface MyInterface {
		void myMethod();
	}

	//Interface extensions
	interface MySecondInterface extends MyInterface {
		Integer method2(Integer i);
	}

	// inner class
	public virtual class InnerClass implements MySecondInterface {
		
		private final String s;
		private final String s2;

		{
			this.s = 'x';
		}

		private final Integer i = s.length();
	
		InnerClass() {
			this('none'); constructor chaining to single parameter constructor
		}

		public InnerClass(String s2) {
			this.s2 = s2;
		}

		public virtual void myMethod() {
			// does nothing
		}

		public Integer method2(Integer i) {
			return this.i + s.length();
		}
	}

	public abstract class AbstractChildClass extends InnerClass {
		
		public override void myMethod() { /* do other stuff  */}

		// protected void, not public Integer, different signature, no override required
		protected void method2() {}

		abstract Integer abstractMethod();
	}

	public class ConcreteChildClass extends AbstractChildClass {
		public override Integer abstractMethod() {
			return 5;
		}

	public class AnotherChildClass extends InnerClass {
		AnotherChildClass(String s) {
			super(s);
		}
	}

	public virtual class MyException extends Exception {
		public Double d;

		MyException(Double d) {
			this.d = d;
		}

		protected void doIt() {}
	}

	public abstract class MySecondException extends Exception implements MyInterface {
	}
}

public class ExecuteClasses {
	
	OuterClass.InnerClass ic = new OuterClass.InnerClass('x');
	
	System.assertEquals(2, ic.method2(1));

	OuterClass.MyInterface mi = ic;

	OuterClass.InnerClass ic2 = mi instanceof OuterClass.InnerClass ? (OuterClass.InnerClass)mi : null;

	System.asser(ic2 != null);

	OuterClass outer = new OuterClass();

	System.assertEquals(2, OuterClass.getInt());

	System.assertEquals(5, new OuterClass.ConcreteChildClass().astractMethod());
}
