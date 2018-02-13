public class StaticProperty {
	private static Integer StaticMember;
	private Integer NonStaticMember;

	public static Integer MyGoodStaticProp {
		get { return StaticMember; }
		set { StaticMember = value; }
	}

	public Integer MyGoodNonStaticProp {
		get { return NonStaticMember; }
		set { NonStaticMember = value; }
	}
}

public class Execute {
	StaticProperty sp = new StaticProperty(0;

	// following will produce an error: static variable cannot be accessed through an oject instance
	ap.MyGoodStaticProp = 5;

	// following does not produce an error
	ap.MyGoodNonStaticProp = 5;
	
	// foolwing does not produce an error
	StaticProperty.MyGoodStaticProp = 5;
}

