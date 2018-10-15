

public class Iteration_Or_Recursion {

	static int recu(int n) {
		if (n == 0)
			return 0;

		else
			return n + recu(n - 1);
	}

	public static void main(String[] args) {
		int iter = 0;

		for (int i = 1; i <= 10; i++)
			iter += i;

		System.out.println("Recursion : " + recu(10));
		// Recursion : 55

		System.out.println("Iteration : " + iter);
		// Iteration : 55

	}

}
