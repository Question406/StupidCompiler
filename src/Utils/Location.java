package Utils;

import org.antlr.v4.runtime.Token;

public class Location {
    int row, col;
    public Location (int row, int col) {
        this.row = row;
        this.col = col;
    }

    public Location (Token token) {
        row = token.getLine();
        col = token.getCharPositionInLine();
    }
    public String toString() {
        return("(" + row + "," + col + ")");
    }
}