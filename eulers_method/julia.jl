function deriv(x::Float64, y::Float64)
    return x ^ 2 + 3 * y ^ 2 - 5
end

function improved_eulers_method(deriv, delta_x, x_start, x_end, y_start)
    y::Float64 = y_start
    x::Float64 = x_start

    while (x < x_end)
        k1 = deriv(x, y)
        u  = y + delta_x * k1
        k2 = deriv(x + delta_x, u)
        y = y + delta_x * (k1 + k2) / 2
        x = x + delta_x
    end

    return y
end

function main(args)
    if length(args) != 1
        println(stderr, "Needs one argument: iterations.")
        exit(1)
    end

    delta_x = parse(Float64, args[1])

    x_start, x_end, y_start = 0, 2, 0

    approx = improved_eulers_method(deriv, delta_x, x_start, x_end, y_start)

    println("Julia: $(approx)")
end

main(ARGS)
