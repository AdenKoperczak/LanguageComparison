function main(args)
    if length(args) != 1
        println(stderr, "Needs one argument: iterations.")
        exit(1)
    end

    count = parse(Int64, args[1])
    PI = 0.0;

    for i = 1:count
        PI += 1 / (i * i)
    end

    PI = sqrt(PI * 6)
    println("Julia: $(PI)")
end

main(ARGS)
