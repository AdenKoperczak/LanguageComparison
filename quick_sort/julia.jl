MOD_VALUE = 2147483647

function swap(A, i, j)
    temp = A[i]
    A[i] = A[j]
    A[j] = temp
end

function partition(A, lo, hi)
    pivot = A[hi]
    i = lo - 1
    for j in lo : hi - 1
        if A[j] <= pivot
            i += 1
            swap(A, i, j)
        end
    end

    i += 1
    swap(A, i, hi)
    return i
end

function quick_sort(A, lo, hi)
    if lo >= hi || lo < 0
        return
    end

    p = partition(A, lo, hi)
    quick_sort(A, lo, p - 1)
    quick_sort(A, p + 1, hi)
end

function main(args)
    if length(args) != 4
        println(stderr, "Needs 4 arguments: len, mult, add, init.")
        exit(1)
    end

    len     = parse(Int64, args[1])
    toSort  = zeros(Int64, len)

    mult    = parse(Float64, args[2])
    add     = parse(Float64, args[3])
    current = parse(Float64, args[4])

    for i in 1:len
        current = current * mult + add
        while current > MOD_VALUE
            current -= MOD_VALUE
        end

        toSort[i] = floor(Int32, (current - floor(current)) * 256)
    end

    quick_sort(toSort, 1, len)


    print("Julia")
    if len < 11
        print(":")
        for item in toSort
            print(" $(item)")
        end
    end
    println()
end


main(ARGS)
