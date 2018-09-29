public class MatrixMultiplier {
    public static int[][] A = {{1, 2, 3},
                               {4, 5, 6},
                               {7, 8, 9}};
    public static int[][] B = {{1, 2, 3, 4, 5},
                               {6, 7, 8, 9, 10},
                               {11, 12, 13, 14, 15}};
    public static int[][] C = new int[A.length][B[0].length];

    public static void main(String[] args) {
        int count = 0;

        for(int x = 0; x < A.length; x++) {

            for(int y = 0; y < B[0].length; y++) {
                count++;
                String threads = "thread".concat(Integer.toString(count));
                Thread thread = new Thread(new WorkerThread(x, y, A, B, C), threads);

                thread.start();
                try {
                    thread.join();
                } catch (InterruptedException ex) {}

            }

        }

        for(int x = 0; x < A.length; x++) {

            for(int y = 0; y < B[0].length; y++) {
                System.out.printf("%5d"+"\t",C[x][y]);
            }

            System.out.println("");
        }
        
    }
}

class WorkerThread implements Runnable
{
    private int row;
    private int col;
    private int[][] A;
    private int[][] B;
    private int[][] C;

    public WorkerThread(int row, int col, int [][] A, int [][] B, int [][] C) {
        this.row = row;
        this.col = col;
        this.A = A;
        this.B = B;
        this.C = C;
    }

    public void run() {
        int total = 0;

        for(int y = 0; y < (A[row].length); y++) {
            total += A[row][y] * B[y][col];
        }

        C[row][col] = total;
    }
}
