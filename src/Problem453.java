/**
 * Created by ilan on 22/12/14.
 */
public class Problem453 {

    private static class Line {

        Point a ;
        Point b ;

        double gradient ;

        double cutoff ;

        Line(Point a, Point b) {

            //A will be the "left" point (that is, x is smaller)
            if (a.x <= b.x) {
                this.a = a ;
                this.b = b;
            } else {
                this.a = b ;
                this.b = a ;
            }
            gradient = calculateGradient() ;
            cutoff = b.y - (gradient * b.x) ;
        }

        private double calculateGradient() {
            if (a.x == b.x) {
                return Double.POSITIVE_INFINITY ;
            }
            return ((b.y - a.y)/(b.x - a.x)) ;
        }

        boolean hasCommonPointWith(Line that) {
            if (this.a.equals(that.a) || this.a.equals(that.b) || this.b.equals(that.a) || this.b.equals(that.b)) return true ;
            return false ;
        }

        boolean intersectsWith(Line that) {
            double x = (that.cutoff - this.cutoff) / (this.gradient - that.gradient) ;
            if (this.gradient == Double.POSITIVE_INFINITY) {
                x = this.a.x ;
            }
            if (that.gradient == Double.POSITIVE_INFINITY) {
                x = that.a.x ;
            }


            //If x appears on both lines, then they intersect
            boolean appearsOnThisLine = (this.a.x <= x && x <= this.b.x) ;
            boolean appearsOnThatLne = (that.a.x <= x && x <= that.b.x) ;

            if (appearsOnThisLine && appearsOnThatLne) return true ;
            return false ;
        }

        boolean hasStraightAngleWith(Line that) {
            if (this.gradient == that.gradient && this.hasCommonPointWith(that)) return true ;
            return false ;
        }
    }

    private static class Point {
        int x;
        int y;

        Point(int x, int y) {
            this.x = x ;
            this.y = y ;
        }


        @Override
        public boolean equals(Object obj) {
            Point that = (Point)obj ;
            if (this.x == that.x && this.y == that.y) return true;
            return false ;
        }
    }

    public static void main(String[] args) {
        Point a = new Point(3, 3) ;
        Point b = new Point(1, 1) ;
        Line l = new Line(a,b) ;

        Point c = new Point(2,1) ;
        Point d = new Point(2,0) ;
        Line l2 = new Line(c,d) ;

        System.out.println(l.intersectsWith(l2));
    }
}
