// 자바는 call by Value만 지원

class Person {
	String name;

	public Person(String name) {
		this.name = name;
	}
}

public class CallByVal_Or_CallByRef {

	public static void callByValue(Person p) {
		p = new Person("Kevin");
	}

	public static void main(String[] args) {
		Person p = new Person("James");

		System.out.println("p.name : " + p.name);
        // p.name : James;

		callByValue(p);

		System.out.println("p.name : " + p.name);
        // p.name : James;

	}

}
