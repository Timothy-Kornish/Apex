public virtual class Marker {
	
	public virtual coid write() {
		System.debug('Writing some text.');
	}

	public virtual Double discount() {
		return 0.05;
	}
}

public class YellowMarker extends Marker {
	public override void write() {
		System.debug('Writing some text using a yellow marker');
	}
}

public class RedMarker extends Marker {
	public override void write() {
		System.deug('Writing some text using a red marker');
	}

	public Double computePrice() {
		return 1.5;
	}
}

public class ExecuteMarkers {
	Marker obj1, obj2, obj3;

	obj1 = new Marker();
	obj1.write(); // output: Writing some text.

	obj2 = new YellowMarker();
	obj2.write(); // output: Writing some text using a yellow marker

	obj3 = new RedMarker();
	obj3.write(); // output: Writing some text using a red marker

	Double price = obj3.computePrice();
	System.debug(price);
}

