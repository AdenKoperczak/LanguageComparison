function main(args)
    if length(args) != 1
        println(stderr, "Needs one argument: iterations.")
        exit(1)
    end

    count = parse(Int64, args[1])
    file = open("test.txt", "w")

    for i in 0 : count - 1
        println(file, i)
    end

    close(file)

    println("Julia")
end
main(ARGS)

