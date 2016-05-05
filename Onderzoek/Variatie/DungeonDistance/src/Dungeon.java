import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Robin on 01/05/16.
 */
public class Dungeon {
    private ArrayList<Tile> wallList = new ArrayList();
    private ArrayList<Tile> noneList = new ArrayList();
    private Tile gem;
    private Tile altar;
    private int dimension = 0;

    public void parseInput(BufferedReader br) throws IOException {
        String line;
        while ((line = br.readLine()) != null) {
            if (line.isEmpty()) {
                break;
            }
            this.dimension += 1;
            if(!(this.matchesAltar(line) || this.matchesWall(line) || this.matchesGem(line) || this.matchesNone(line))) {
                continue;
            }
            else if(this.matchesAltar(line)) {
                line = line.replace("altar", "");
                int[] tileCoordinates = this.extractCoordinates(line);
                this.altar = new Tile(tileCoordinates[0], tileCoordinates[1],"altar");
            }

            else if(this.matchesGem(line)) {
                line = line.replace("gem", "");
                int[] tileCoordinates = this.extractCoordinates(line);
                this.gem = new Tile(tileCoordinates[0], tileCoordinates[1],"gem");
            }
            else if(this.matchesWall(line)) {
                line = line.replace("rest", "");
                int[] tileCoordinates = this.extractCoordinates(line);
                this.wallList.add(new Tile(tileCoordinates[0], tileCoordinates[1],"wall"));
            }
            else if(this.matchesNone(line)) {
                line = line.replace("rest", "");
                int[] tileCoordinates = this.extractCoordinates(line);
                this.noneList.add(new Tile(tileCoordinates[0], tileCoordinates[1],"none"));

            }
        }

    }

    private int[] extractCoordinates(String line) {
        int[] returnArray = new int[2];
        line = line.replace(".", "");
        line = line.replace(" ", "");
        line = line.replace("(", "");
        line = line.replace(")", "");
        String[] lineArray = line.split(",");
        returnArray[0] = Integer.parseInt(lineArray[0]);
        returnArray[1] = Integer.parseInt(lineArray[1]);
        return returnArray;
    }

    public boolean matchesGem(String line) {
        Pattern p = Pattern.compile("gem\\(\\(\\d+, \\d+\\)\\)\\.");
        Matcher m = p.matcher(line);
        Pattern s = Pattern.compile("gem\\(\\d+,\\d+\\)");
        Matcher k = s.matcher(line);
        return m.matches() || k.matches();
    }

    public boolean matchesAltar(String line) {
        Pattern p = Pattern.compile("altar\\(\\(\\d+, \\d+\\)\\)\\.");
        Matcher m = p.matcher(line);
        Pattern s = Pattern.compile("altar\\(\\d+,\\d+\\)");
        Matcher k = s.matcher(line);
        return m.matches() || k.matches();

    }
    public boolean matchesNone(String line) {
        Pattern p = Pattern.compile("rest\\(\\(\\d+, \\d+, none\\)\\)\\.");
        Matcher m = p.matcher(line);
        Pattern s = Pattern.compile("rest\\(\\d+,\\d+,none\\)");
        Matcher k = s.matcher(line);
        return m.matches() || k.matches();
    }


    public boolean matchesWall(String line) {
        Pattern p = Pattern.compile("rest\\(\\(\\d+, \\d+, wall\\)\\)\\.");
        Matcher m = p.matcher(line);
        Pattern s = Pattern.compile("rest\\(\\d+,\\d+,wall\\)");
        Matcher k = s.matcher(line);
        return m.matches() || k.matches();
    }

    public ArrayList<Tile> getWallList() {
        return wallList;
    }

    public void setWallList(ArrayList<Tile> wallList) {
        this.wallList = wallList;
    }

    public ArrayList<Tile> getNoneList() {
        return noneList;
    }

    public void setNoneList(ArrayList<Tile> noneList) {
        this.noneList = noneList;
    }

    public Tile getGem() {
        return gem;
    }

    public void setGem(Tile gem) {
        this.gem = gem;
    }

    public Tile getAltar() {
        return altar;
    }

    public void setAltar(Tile altar) {
        this.altar = altar;
    }

    public double getDimension() {
        return Math.sqrt(dimension);
    }

}

