public class AutomaticProperty {
	public Integer MyReadOnlyProp { get; }
	public Double  MyReadWriteProp { get; set; }
	public String  MyWriteOnlyProp { set; }
}

public class Execute {
	AutomaticProperty ap = new AutomaticProperty();
	ap.MyReadOnlyProp = 5; // this produces a compile error: not writale
	ap.MyReadWriteProp = 5; // no error
	System.asser(ap.MyWriteOnlyProp == 5); // this produces a compile error: not readable
}


