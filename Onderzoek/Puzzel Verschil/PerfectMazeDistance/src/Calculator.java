import org.jgrapht.UndirectedGraph;
import org.jgrapht.alg.DijkstraShortestPath;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.graph.SimpleGraph;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by Robin on 30/04/16.
 */
public class Calculator {

    public int calculateDistance(Tile tile, ArrayList<Tile> list) {
        int score = 0;
        int x = tile.getX();
        int y = tile.getY();
        int parentX = tile.getParentXShift();
        int parentY = tile.getParentYShift();

        int newX = x+parentX;
        int newY = y+parentY;

        int newParentX = -parentX;
        int newParentY = -parentY;

        for(Tile t : list) {
            if( ((t.getX() == x) && (t.getY() == y) && (t.getParentXShift() == parentX) && (t.getParentYShift() == parentY))
                    || ((t.getX() == newX) && (t.getY() == newY) && (t.getParentXShift() == newParentX) && (t.getParentYShift() == newParentY))) {
                score += 1;
            }
        }
        return score;
    }

    public int getDimension(ArrayList<Tile> list) {
        int dim = 0;
        for(Tile t : list) {
            if(dim < t.getX()) {
                dim = t.getX();
            }
        }
        return dim;
    }

    public int shortestPath(ArrayList<Tile> listOfTiles) {
        UndirectedGraph<String, DefaultEdge> graph = new SimpleGraph<String, DefaultEdge>(DefaultEdge.class);
        int dimension = getDimension(listOfTiles);
        String[] vertices = new String[(int)Math.pow(dimension, 2)];

        int position = 0;
        for(int i = 1; i<=dimension; i ++) {
            for(int j = 1; j<=dimension; j ++) {
                vertices[position] = Integer.toString(i) + Integer.toString(j);
                position++;
            }
        }

        for(String s : vertices) {
            graph.addVertex(s);
        }

        for(Tile t: listOfTiles) {
            String x = Integer.toString(t.getX());
            String y = Integer.toString(t.getY());
            String xNeighbor = Integer.toString(t.getX()+t .getParentXShift());
            String yNeighbor = Integer.toString(t.getY() + t.getParentYShift());
            graph.addEdge(x+y, xNeighbor+yNeighbor);
        }

        DijkstraShortestPath ds = new DijkstraShortestPath(graph, vertices[0], vertices[position-1]);
        return (int)ds.getPathLength();

    }

}
