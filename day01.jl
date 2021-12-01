arr = []
open("day01.txt") do f
    while ! eof(f)
        push!(arr, parse(Int, readline(f)))
    end
end

function part1()
    counter = 0
    prev = nothing
    for i in eachindex(arr)
        x = arr[i]
        if !isnothing(prev) && prev < x
            counter += 1
        end
        prev = arr[i]
    end
    println(counter)
end

function part2()
    counter = 0
    elements = [arr[1], arr[2], arr[3]]
    for i in 4:length(arr)
        if elements[1] + elements[2] + elements[3] < elements[2] + elements[3] + arr[i]
            counter += 1
        end
        elements = [elements[2], elements[3], arr[i]]
    end
    println(counter)
end

part1()
part2()