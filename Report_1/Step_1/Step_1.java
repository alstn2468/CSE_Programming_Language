import java.util.Scanner;

public class MatrixMul {

   public static void main(String[] args) {
       Scanner s = new Scanner(System.in);

       System.out.print("A의 열을 입력하세요 >> ");
       int rowsInA = s.nextInt();

       System.out.print("A의 행과 B의 열을 입력하세요 >> ");
       int columnsInA = s.nextInt();

       System.out.print("B의 행을 입력하세요 >> ");
       int columnsInB = s.nextInt();1

       int[][] a = new int[rowsInA][columnsInA];
       int[][] b = new int[columnsInA][columnsInB];

       System.out.println("A 매트릭스를 입력하세요 " + columnsInA + " by " + rowsInA);
       for (int i = 0; i < a.length; i++) {
           for (int j = 0; j < a[0].length; j++) {
               a[i][j] = s.nextInt();
           }
       }

       System.out.println("B 매트릭스를 입력하세요 " + columnsInB + " by " + columnsInA);

       for (int i = 0; i < b.length; i++) {
           for (int j = 0; j < b[0].length; j++) {
               b[i][j] = s.nextInt();
           }
       }

       int[][] c = multiply(a, b);

       System.out.println("A행렬과 B행렬의 곱셈 결과");
       for (int i = 0; i < c.length; i++) {
           for (int j = 0; j < c[0].length; j++) {
               System.out.print(c[i][j] + " ");
           }
           System.out.println();
       }

   }

   public static int[][] multiply(int[][] a, int[][] b) {
       int rowsInA = a.length;
       int columnsInA = a[0].length;
       int columnsInB = b[0].length;
       int[][] c = new int[rowsInA][columnsInB];

       for (int i = 0; i < rowsInA; i++) {
           for (int j = 0; j < columnsInB; j++) {
               for (int k = 0; k < columnsInA; k++) {
                   c[i][j] = c[i][j] + a[i][k] * b[k][j];
               }
           }
       }

       return c;
   }
}
