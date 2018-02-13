public class BasicProperty {

	Integer prop; 
	
	// pretty much the same as c# properties
	
	// differences:
	// Properties provide storage for values directly. You do not need to create supporting members for storing values
	//It is possible to create automatic properties in Apex

	public Integer prop {
		get { return prop; }
		set { prop = value; }
	}
}

public class executeProperties {
	BasicProperty bp = new BasicProperty();
	bp.prop = 5;
	System.assert(bp.prop == 5);
}
