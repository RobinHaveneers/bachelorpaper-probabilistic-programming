import java.util.ArrayList;

/**
 * Created by Robin on 28/04/16.
 */
public final class Calculator {

    public static double tileDistance(Tile tile1, Tile tile2) {
        double startX1 = (double) tile1.getX();
        double startX2 = (double) tile2.getX();
        double startY1 = (double) tile1.getY();
        double startY2 = (double) tile2.getY();
        return Math.abs(startX1-startX2) + Math.abs(startY1-startY2) ;

    }

    public static double tileCompare(Tile tile1, ArrayList<Tile> tileList, ChromaticMaze cm) {
        String currentColor = tile1.getText();
        double currentDistance = (2*cm.getDimension())-2;
        Tile removedTile = null;

        for(Tile t : tileList) {
            if (currentColor.equals(t.getText())) {
                double distance = Calculator.tileDistance(tile1, t);
                if (distance < currentDistance) {
                    currentDistance = distance;
                    removedTile = t;
                }
            }
        }
        if(removedTile != null) {
            tileList.remove(removedTile);
            cm.setTileList(tileList);
        }
        return currentDistance;
    }
}
