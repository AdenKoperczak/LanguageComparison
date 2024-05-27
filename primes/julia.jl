function main(args)
    if length(args) != 1
        println(stderr, "Needs one argument: numberOfPrime.")
        exit(1)
    end

    numberOfPrime = parse(Int64, args[1])


    primes = [2, 3]

    current = 4
    while length(primes) < numberOfPrime
        prime = true
        for i in primes
            if current % i == 0
                prime = false
                break
            end
        end
        
        if prime
            push!(primes, current)
        end

        current += 1
    end

    println("Julia: $(primes[numberOfPrime])")
end

main(ARGS)
