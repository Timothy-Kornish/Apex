public class TestSetupClass {
	
	@testSetup 
	static void method() {
		// record get setup here for following test
		// this test executes first, there can be only one testSetup method
		// a following test will get access to the original unmodified state of those records
	}
}
