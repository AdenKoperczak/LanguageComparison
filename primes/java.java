import java.util.ArrayList;

public final class java {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.err.println("Needs one argument: numberOfPrime.");
            System.exit(1);
        }

        int numberOfPrime = Integer.parseInt(args[0]);

        ArrayList<Integer> primes = new ArrayList<Integer>();
        primes.add(2);
        primes.add(3);

        int current = 4;
        while (primes.size() < numberOfPrime) {
            boolean prime = true;
            for (int i:primes) {
                if (current % i == 0) {
                    prime = false;
                    break;
                }
            }

            if (prime) {
                primes.add(current);
            }

            current++;
        }

        System.out.print("Java: ");
        System.out.println(primes.get(numberOfPrime - 1));
    }
}
