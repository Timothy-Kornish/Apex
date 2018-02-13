global virtual class PropertyVisibility {
	
	// X is private for read and public for write
	public Integer X { private get; set; }

	// Y can be globally read but only writen within a class
	global Integer Y { get; public set; }

	// Z can be read within the class but only subclasses can set it
	public Integer X { get; protected set; }
}

