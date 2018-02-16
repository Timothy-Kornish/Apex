global class MyFutureClass {
	
	@future
	// future means method is run asynchronously
	static void myMethod(String a, Integer i) {
		System.debug('Method called with: ' + a + ' and ' + i);
		// perform long-running code
	}
}
