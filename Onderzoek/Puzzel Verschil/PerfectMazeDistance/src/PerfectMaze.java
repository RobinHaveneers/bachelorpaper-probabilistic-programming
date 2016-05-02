import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Robin on 30/04/16.
 */
public class PerfectMaze {

    private ArrayList<Tile> listOfTiles = new ArrayList<Tile>();

    public ArrayList<Tile> getListOfTiles() {
        return listOfTiles;
    }

    public void setListOfTiles(ArrayList<Tile> listOfTiles) {
        this.listOfTiles = listOfTiles;
    }

    public void parseInput(BufferedReader br) throws IOException {
        String line;
        while ((line = br.readLine()) != null) {
            if (line.isEmpty()) {
                break;
            }
            if(this.matchesTile(line)) {
                int[] coordinates = extractCoordinates(line);
                Tile tile = new Tile(coordinates[0], coordinates[1], coordinates[2], coordinates[3]);
                this.listOfTiles.add(tile);
            }
        }
    }

    private boolean matchesTile(String line) {
        Pattern p = Pattern.compile("parent\\(-?\\d+,-?\\d+,-?\\d+,-?\\d+\\)\\.?");
        Matcher m = p.matcher(line);
        return m.matches();
    }

    public int[] extractCoordinates(String line) {
        int[] returnArray = new int[4];
        line = line.replace("parent", "");
        line = line.replace("(", "");
        line = line.replace(".", "");
        line = line.replace(")", "");
        String[] lineArray = line.split(",");
        returnArray[0] = Integer.parseInt(lineArray[0]);
        returnArray[1] = Integer.parseInt(lineArray[1]);
        returnArray[2] = Integer.parseInt(lineArray[2]);
        returnArray[3] = Integer.parseInt(lineArray[3]);
        return returnArray;
    }
}

