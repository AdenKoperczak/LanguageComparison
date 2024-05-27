interface Derivative {
    public double derive(double x, double y);
}

class derivative implements Derivative {
    public double derive(double x, double y) {
        return Math.pow(x, 2) + 3 * Math.pow(y, 2) - 5;
    }
}

public final class java {

    public static double improved_eulers_method(Derivative deriv, double delta_x, double x_start, double x_end, double y_start) {
        double y = y_start;

        for (double x = x_start; x < x_end; x += delta_x) {
            double k1 = deriv.derive(x, y);
            double u  = y + delta_x * k1;
            double k2 = deriv.derive(x + delta_x, u);

            y = y + delta_x * (k1 + k2) / 2;
        }

        return y;
    }

    public static void main(String[] args) {
        if (args.length != 1) {
            System.err.println("Needs one argument: iterations.");
            System.exit(1);
        }
        
        double delta_x = Double.parseDouble(args[0]);
        if (delta_x <= 0) {
            System.err.println("Argument delta_x should be greater than 0.");
            System.exit(1);
        }

        double x_start = 0;
        double x_end   = 2;
        double y_start = 0;

        double approx = improved_eulers_method(new derivative(), delta_x, x_start, x_end, y_start);

        System.out.print("Java: ");
        System.out.println(approx);
    }
}
