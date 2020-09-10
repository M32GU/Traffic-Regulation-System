int sign(double x){
    return fabs(x) < 1e-8 ? 0 : (x > 0 ? 1 : -1);
}

struct Point
{
	double x, y;
	Point(){}
	Point(double x, double y) : x(x), y(y) {}
	Point(int x, int y) : x(x), y(y) {}
	bool eq(Point a){
        return !sign(x-a.x) && !sign(y-a.y);
    }
    double operator * (const Point &b){
        return x*b.y-y*b.x;
    }
    Point operator - (const Point &b){
        return Point(x-b.x, y-b.y);
	}
};

struct Segment
{
	Point a, b;
	Segment(){}
    Segment(Point a, Point b) : a(a), b(b){}
    int joint(Segment C, Point &ans){
        Point c = C.a, d = C.b;
        if(std::max(a.x,b.x) < std::min(c.x,d.x)||
            std::max(a.y,b.y) < std::min(c.y,d.y)||
            std::max(c.x,d.x) < std::min(a.x,b.x)||
            std::max(c.y,d.y) < std::min(a.y,b.y))
            return 0; // don't joint 
        int x = sign((b-a)*(c-a)), y = sign((b-a)*(d-a));
        if(x == 0 && y == 0) return -1; // joint and overlap
        if(x == 0) ans = c;
        else if(y == 0) ans = d;
        else{
            ans.x =-(c*d*(a.x-b.x)-a*b*(c.x-d.x))/((a-b)*(c-d));
            ans.y =(a*b*(c.y-d.y)-c*d*(a.y-b.y))/((a-b)*(c-d));
        }
        if(sign(ans.x-std::max(a.x,b.x)) > 0 || sign(ans.x-std::min(a.x,b.x)) < 0)
            return 0; // don't joint
        return 1; // joint
	}
};