/**
 * Created by Robin on 30/04/16.
 */
public class Tile {

    private int x;
    private int y;
    private int parentXShift;
    private int parentYShift;

    public Tile(int x, int y, int parentXShift, int parentYShift) {
        this.x = x;
        this.y = y;
        this.parentXShift = parentXShift;
        this.parentYShift = parentYShift;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getParentXShift() {
        return parentXShift;
    }

    public void setParentXShift(int parentXShift) {
        this.parentXShift = parentXShift;
    }

    public int getParentYShift() {
        return parentYShift;
    }

    public void setParentYShift(int parentYShift) {
        this.parentYShift = parentYShift;
    }

    @Override
    public String toString() {
        return "Tile[" + this.getX() + "," + this.getY() + "," + this.getParentXShift() + "," + this.getParentYShift()+"]";
    }
}
