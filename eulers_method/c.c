#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double deriv(double x, double y) {
    return pow(x, 2) + 3 * pow(y, 2) - 5;
}

double improved_eulers_method(double (* deriv)(double, double), double delta_x, double x_start, double x_end, double y_start) {
    double y = y_start;

    for (double x = x_start; x < x_end; x += delta_x) {
        double k1 = deriv(x, y);
        double u  = y + delta_x * k1;
        double k2 = deriv(x + delta_x, u);
        y = y + delta_x * (k1 + k2) / 2;
    }

    return y;
}

int main(int argc, char ** argv) {
    if (argc != 2) {
        fprintf(stderr, "Needs one argument: delta_x.\n");
        return 1;
    }


    double x_start = 0;
    double x_end   = 2;
    double y_start = 0;

    double delta_x = atof(argv[1]);
    if (delta_x <= 0) {
        fprintf(stderr, "Argument delta_x should be greater than 0.\n");
        return 1;
    }

    double approx  = improved_eulers_method(deriv, delta_x, x_start, x_end, y_start);

    printf("C " OPTIMIZATION ": %.16lf\n", approx);
    return 0;
}
