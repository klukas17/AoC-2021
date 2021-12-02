arr = []
open("day02.txt") do f
    while ! eof(f)
        push!(arr, readline(f))
    end
end

for i in 1:length(arr)
    direction, parameter = split(arr[i])
    arr[i] = [direction, parse(Int, parameter)]
end

function part1()
    horizontal = 0
    depth = 0
    for i in 1:length(arr)
        instruction, parameter = arr[i][1], arr[i][2]
        if instruction == "forward" 
            horizontal += parameter
        elseif instruction == "up"
            depth -= parameter
        elseif instruction == "down" 
            depth += parameter
        end
    end
    println(horizontal * depth)
end

function part2()
    horizontal = 0
    depth = 0
    aim = 0
    for i in 1:length(arr)
        instruction, parameter = arr[i][1], arr[i][2]
        if instruction == "forward" 
            horizontal += parameter
            depth += aim * parameter
        elseif instruction == "up"
            aim -= parameter
        elseif instruction == "down" 
            aim += parameter
        end
    end
    println(horizontal * depth)
end

part1()
part2()