import java.io.*;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) throws IOException {

        FileInputStream fstream = new FileInputStream(args[0]);
        BufferedReader buffer1 = new BufferedReader(new InputStreamReader(fstream));
        FileInputStream gstream = new FileInputStream(args[1]);
        BufferedReader buffer2 = new BufferedReader(new InputStreamReader(gstream));

        Dungeon d1  = new Dungeon();
        d1.parseInput(buffer1);

        Dungeon d2  = new Dungeon();
        d2.parseInput(buffer2);

        Calculator calc = new Calculator();

        double gemDistance = calc.tileDistance(d1.getGem(), d2.getGem());
        double altarDistance = calc.tileDistance(d1.getAltar(), d2.getAltar());
        double gemToAltarDistance = Math.abs(calc.tileDistance(d1.getGem(), d1.getAltar()) - calc.tileDistance(d2.getGem(),d2.getAltar()));

        double wallAmountDifference = Math.abs(d1.getWallList().size() - d2.getWallList().size());
        double noneAmountDifference = Math.abs(d1.getNoneList().size() - d2.getNoneList().size());

        double wallDistance = 0;
        for(Tile t : d1.getWallList()) {
            wallDistance += Calculator.wallCompare(t, d2.getWallList(), d2);
        }

        double noneDistance = 0;
        for(Tile t : d1.getNoneList()) {
            noneDistance += Calculator.noneCompare(t, d2.getNoneList(), d2);
        }

        double dim = d1.getDimension();
        double squares = Math.pow(dim, 2);

        gemDistance = gemDistance/(2*dim-2);
        altarDistance = altarDistance/(2*dim-2);
        gemToAltarDistance = gemToAltarDistance/(2*dim-2);
        wallAmountDifference = wallAmountDifference/squares;
        noneAmountDifference = noneAmountDifference/squares;
        wallDistance = wallDistance/((dim*squares)-2);
        noneDistance = noneDistance/((dim*squares)-2);


        double sum = ((gemDistance+altarDistance+gemToAltarDistance+wallAmountDifference+noneAmountDifference+wallDistance+noneDistance)/7)*100;

        System.out.print(sum+";");




    }
}
