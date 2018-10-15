

public class NonUseFunc_Or_UseFunc {

	static int useFunc(int n) {
		int sum = 0;

		for (int i = 1; i <= n; i++)
			sum += i;

		return sum;
	}

	public static void main(String[] args) {
		int nonUseFunc = 0;

		for (int i = 1; i <= 10; i++)
			nonUseFunc += i;

		System.out.println("useFunc : " + useFunc(10));
		// useFunc : 55

		System.out.println("nonUseFunc : " + nonUseFunc);
		// nonUseFunc : 55

	}

}
