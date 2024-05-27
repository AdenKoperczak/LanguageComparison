
public final class java {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.err.println("Needs one argument: iterations.");
            System.exit(1);
        }

        int count = Integer.parseInt(args[0]);

        double pi = 0;

        for (double i = 1; i <= count; i++) {
            pi += 1 / (i * i);
        }

        pi = Math.sqrt(pi * 6);

        System.out.print("Java: ");
        System.out.println(pi);
    }
}
