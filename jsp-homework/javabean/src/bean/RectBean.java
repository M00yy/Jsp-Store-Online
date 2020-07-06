package bean;

public class RectBean {
	private double length,width,perimeter,area;
	
	public void setLength(double a){
		this.length = a;
	}
	public void setWidth(double w){
		this.width = w;
	}
	public double getLength(){
		return length;
	}
	public double getWidth(){
		return width;
	}
	public double getPerimeter(){
		perimeter = 2.0 * (length + width);
		return perimeter;
	}
	public double getArea(){
		area = length * width;
		return area;
	}
}
