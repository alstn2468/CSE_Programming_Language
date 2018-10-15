
class useRecord {
	int a;
	char b;

	void setValue(int a, char b) {
		this.a = a;
		this.b = b;
	}

	void display() {
		System.out.println("useRecord : " + this.a + " "+ this.b);
	}
}

public class Solution {

	public static void main(String[] args) {
		int[] a = new int[10];

		for (int i = 0; i < a.length; i++) {
			a[i] = i + 1;
		}

		System.out.print("Use Array : ");

		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i] + " ");
		}

		System.out.println();

		useRecord[] record = new useRecord[10];

		for (int i = 0; i < record.length; i++) {
			record[i] = new useRecord();
			record[i].setValue(i + 1, (char)('a' + i));
			record[i].display();
		}

	}

}
