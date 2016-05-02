import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by Robin on 28/04/16.
 */
public class ChromaticMaze {


    private ArrayList<Tile> tileList = new ArrayList();
    private Tile start;
    private Tile finish;
    private int dimension;

    public void parseInput(BufferedReader br) throws IOException {
        String line;
        while ((line = br.readLine()) != null) {
            if (line.isEmpty()) {
                break;
            }
            if(!(this.matchesColoredTile(line) || this.matchesStart(line) || this.matchesFinish(line))) {
                continue;
            }
            if(this.matchesColoredTile(line)) {
                line = line.replace("tile_color", "");
                int[] tileCoordinates = this.extractCoordinates(line);
                String text = this.extractString(line);
                this.tileList.add(new Tile(tileCoordinates[0], tileCoordinates[1],text));
            }
            else if(this.matchesStart(line)) {
                line=line.replace("tile_char","");
                int[] tileCoordinates = this.extractCoordinates(line);
                String text = this.extractString(line);
                this.start = new Tile(tileCoordinates[0], tileCoordinates[1],text);
            }
            else if(this.matchesFinish(line)) {
                line=line.replace("tile_char","");
                int[] tileCoordinates = this.extractCoordinates(line);
                String text = this.extractString(line);
                this.finish = new Tile(tileCoordinates[0], tileCoordinates[1],text);
            }

        }
    }

    private int[] extractCoordinates(String line) {
        int[] returnArray = new int[2];
        line = line.replace("(", "");
        line = line.replace(")", "");
        String[] lineArray = line.split(",");
        returnArray[0] = Integer.parseInt(lineArray[0]);
        returnArray[1] = Integer.parseInt(lineArray[1]);
        return returnArray;
    }

    private String extractString(String line) {
        line = line.replace(".", "");
        line = line.replace("(", "");
        line = line.replace(")", "");
        String[] lineArray = line.split(",");
        return lineArray[lineArray.length-1];

    }

    private boolean matchesColoredTile(String line) {
        Pattern p = Pattern.compile("tile_color\\(\\d+,\\d+,\\w+\\)\\.?");
        Matcher m = p.matcher(line);
        return m.matches();
    }

    private boolean matchesStart(String line) {
        Pattern p = Pattern.compile("tile_char\\(\\d+,\\d+,s\\)\\.?");
        Matcher m = p.matcher(line);
        return m.matches();
    }

    private boolean matchesFinish(String line) {
        Pattern p = Pattern.compile("tile_char\\(\\d+,\\d+,f\\)\\.?");
        Matcher m = p.matcher(line);
        return m.matches();
    }


    public ArrayList<Tile> getTileList() {
        return tileList;
    }

    public void setTileList(ArrayList<Tile> newList) {
        this.tileList = newList;
    }

    public void addToTileList(Tile tile) {
        this.tileList.add(tile);
    }

    public Tile getStart() {
        return start;
    }

    public void setStart(Tile start) {
        this.start = start;
    }

    public Tile getFinish() {
        return finish;
    }

    public void setFinish(Tile finish) {
        this.finish = finish;
    }

    public int getDimension() {
        int currentDim = 0;
        for(Tile t: tileList) {
            if(t.getX() > currentDim) {
                currentDim = t.getX();
            }
        }
        return currentDim;
    }

}
