import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Step_1 {
	static int FMROW = 1000, FMCOL = 1000;
	static int SMROW = 1000, SMCOL = 1000;

   public static void main(String[] args) {
       int[][] fm = new int[FMROW][FMCOL];
       int[][] sm = new int[SMROW][SMCOL];
       int[][] result;

       try {

           File file = new File("./Data01.txt");
           FileReader filereader = new FileReader(file);

           for (int i = 0; i < FMCOL; i++) {
               for (int j = 0; j < FMROW; j++)
            	   fm[i][j] = filereader.read();
           }

           filereader.close();

           file = new File("./Data02.txt");
           filereader = new FileReader(file);

           for (int i = 0; i < SMCOL; i++) {
               for (int j = 0; j < SMROW; j++)
            	  sm[i][j] = filereader.read();
           }

           filereader.close();

           long startTime = System.currentTimeMillis();

           result = multiply(fm, sm);

           long endTime = System.currentTimeMillis();

           long lTime = endTime - startTime;
           System.out.println("TIME : " + lTime / 1000.0 + "(ms)");

       } catch (IOException e) {

    	   System.out.println(e);

       }
   }

   public static int[][] multiply(int[][] a, int[][] b) {
       int[][] c = new int[FMROW][SMCOL];

       for (int i = 0; i < FMROW; i++) {
           for (int j = 0; j < SMCOL; j++) {
               for (int k = 0; k < FMCOL; k++) {
                   c[i][j] = c[i][j] + a[i][k] * b[k][j];
               }
           }
       }

       return c;
   }
}
