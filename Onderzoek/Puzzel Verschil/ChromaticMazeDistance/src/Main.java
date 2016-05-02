import java.io.*;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws IOException {
        ChromaticMaze cm1 = new ChromaticMaze();
        FileInputStream fstream = new FileInputStream(args[0]);
        BufferedReader buffer1 = new BufferedReader(new InputStreamReader(fstream));

        ChromaticMaze cm2 = new ChromaticMaze();
        FileInputStream gstream = new FileInputStream(args[1]);
        BufferedReader buffer2 = new BufferedReader(new InputStreamReader(gstream));

        cm1.parseInput(buffer1);
        cm2.parseInput(buffer2);

        ArrayList<Tile> firstAllTiles = cm1.getTileList();
        Tile firstStartTile = cm1.getStart();
        Tile firstFinishTile = cm1.getFinish();

        ArrayList<Tile> secondAllTiles = cm2.getTileList();
        Tile secondStartTile = cm2.getStart();
        Tile secondFinishTile = cm2.getFinish();

        double startDistance = Calculator.tileDistance(firstStartTile, secondStartTile);
        double finishDistance = Calculator.tileDistance(firstFinishTile, secondFinishTile);

        double restDistance = 0;

        for(Tile t : firstAllTiles) {
            restDistance += Calculator.tileCompare(t, secondAllTiles, cm2);
        }

        double sum;

        startDistance = startDistance/cm1.getDimension();
        finishDistance = finishDistance/cm1.getDimension();
        restDistance = restDistance/((Math.pow(cm1.getDimension(),2)) * ((2*cm1.getDimension())-2));
        if(cm2.getTileList().size() == Math.pow(cm2.getDimension(),2) && restDistance == 1) {
            restDistance += 1;
        }
        sum = (startDistance+finishDistance+restDistance)/0.03;
        if(sum > 100) {
            sum =100;
        }

        System.out.print(sum+",");
    }
}
