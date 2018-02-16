public class PairNumbers {
	Integer x, y;

	public PairNumbers(Integer x, Integer y) {
		this.x = x;
		this.y = y;
	}

	public Boolean equals(Object obj) {
		if (obj instanceof PairNumbers) {
			PairNumbers p = (PairNumbers)obj;
			return ((x == p.x) && (y == p.y));
		}
		return false;
	}

	public Integer hashCode() {
		return (101 * x) ^ y;
	}
}

public class TestPairNumbers {
	
	Map<PairNumbers, String> m = new Map<PairNumbers, String>();
	
	PairNumbers p1 = new PairNumbers(1, 2);
	PairNumbers p2 = new PairNumbers(3, 4);
	
	// creating a duplicate
	PairNumbers p3 = new PairNumbers(1, 2);

	m.put(p1, 'First');
	m.put(p2, 'Second');
	m.put(p3, 'Third');

	System.assertEquals(2, m.size());

	if (p1 == p3) {
		System.debug('p1 and p3 are equal.');
	}

	System.assertEquals(true, m.containsKey(p1));
	System.assertEquals(true, m.containsKey(p2));
	System.assertEquals(false, m.containsKey(new PairNumbers(5, 6)));

	for (PairNumbers pn : m.keySet()) {
		System.debug('Key: ' + pn);
	}

	List<String> mValues = m.values();
	System.debug('m.values: ' + mValues);

	Set<PairNumbers> s1 = new Set<PairNumbers>();

	s1.add(p1);
	s1.add(p2);
	s1.add(p3);

	// verify that only 2 elements are in  the set since p3 is a duplicate
	System.assertEquals(2, s1.size());
}
