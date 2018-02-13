public class Plotter {
	
	class Point {
		Double x;
		Double y;

		Point(Double x, Double y) {
			this.x = x;
			this.y = y;
		}

		Double getXCoordinate() {
			return x;
		}
		Double getYCoordinate() {
			return y;
		}
	}

	List<Point> points = new List<Point>();

	public void plot(Double x, Double y) {
		points.add(new Point(x, y));
	}

	public void render() {
		// insert code to render a plot
	}
}
