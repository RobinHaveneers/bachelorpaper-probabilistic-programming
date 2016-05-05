/**
 * Created by Robin on 28/04/16.
 */
public class Tile {

    private int x;
    private int y;
    private String text;

    public Tile(int x, int y, String text) {
        this.x = x;
        this.y = y;
        this.text = text;

    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    @Override
    public String toString() {
        return "Tile(" + this.x + "," + this.y + "," + this.text +")";
    }

}
