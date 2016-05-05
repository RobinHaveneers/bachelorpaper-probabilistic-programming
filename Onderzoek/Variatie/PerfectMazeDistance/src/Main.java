import java.io.*;

public class Main {

    public static void main(String[] args) throws IOException {

        FileInputStream fstream = new FileInputStream(args[0]);
        BufferedReader buffer1 = new BufferedReader(new InputStreamReader(fstream));

        FileInputStream gstream = new FileInputStream(args[1]);
        BufferedReader buffer2 = new BufferedReader(new InputStreamReader(gstream));

        PerfectMaze pm1 = new PerfectMaze();
        PerfectMaze pm2 = new PerfectMaze();

        Calculator calc = new Calculator();

        pm1.parseInput(buffer1);
        pm2.parseInput(buffer2);

        int nbOfConnections1 = pm1.getListOfTiles().size();
        int nbOfConnections2 = pm2.getListOfTiles().size();

        int shortestPath1 = calc.shortestPath(pm1.getListOfTiles());
        int shortestPath2 = calc.shortestPath(pm2.getListOfTiles());

        double tileScore = 0;
        for(Tile t : pm1.getListOfTiles()) {
            tileScore += calc.calculateDistance(t, pm2.getListOfTiles());
        }

        double result = 0;

        if(tileScore == pm2.getListOfTiles().size() && shortestPath1 == shortestPath2 && nbOfConnections1 == nbOfConnections2) {
            result  = 1000;
        }

        else {
            int dimTemp = calc.getDimension(pm1.getListOfTiles());
            double size = Math.pow(dimTemp,2);
            result += (tileScore/(2*size + (size-4)*3))*750;
            double shortestPathPossible = (2*dimTemp)-2;
            result += 250*((Math.abs(shortestPath1-shortestPath2))/shortestPathPossible);

        }

        System.out.print((result/10)+",");





    }
}
