arr = []
open("day03.txt") do f
    while ! eof(f)
        push!(arr, readline(f))
    end
end

bit_length = length(arr[1])
bits = [0 for _ in 1:bit_length]
input_length = length(arr)

function part1()

    for i in 1:length(arr)
        curr = arr[i]
        for j in 1:length(curr)
            if curr[j] == '1'
                bits[j] += 1
            end
        end
    end

    gamma_arr = []
    epsilon_arr = []

    for i in 1:bit_length
        if bits[i] > input_length / 2
            push!(gamma_arr, 1)
            push!(epsilon_arr, 0)
        else
            push!(gamma_arr, 0)
            push!(epsilon_arr, 1)
        end
    end

    gamma = 0
    epsilon = 0
    base = 0

    for i in 0:bit_length-1
        gamma += gamma_arr[end-i] * 2^base
        epsilon += epsilon_arr[end-i] * 2^base
        base += 1
    end

    println(gamma * epsilon)
end

function part2()

    O2_arr = copy(arr)
    CO2_arr = copy(arr)

    O2_bit = 1
    CO2_bit = 1

    while length(O2_arr) > 1
        zeros = 0
        ones = 0
        for i in 1:length(O2_arr)
            if O2_arr[i][O2_bit] == '0' zeros += 1
            else ones += 1
            end
        end

        new_arr = []

        if ones >= zeros
            for i in 1:length(O2_arr)
                if O2_arr[i][O2_bit] == '1' push!(new_arr, O2_arr[i]) end
            end

        else
            for i in 1:length(O2_arr)
                if O2_arr[i][O2_bit] == '0' push!(new_arr, O2_arr[i]) end
            end

        end

        O2_arr = new_arr
        O2_bit += 1
    end

    while length(CO2_arr) > 1
        zeros = 0
        ones = 0
        for i in 1:length(CO2_arr)
            if CO2_arr[i][CO2_bit] == '0' zeros += 1
            else ones += 1
            end
        end

        new_arr = []

        if ones < zeros
            for i in 1:length(CO2_arr)
                if CO2_arr[i][CO2_bit] == '1' push!(new_arr, CO2_arr[i]) end
            end

        else
            for i in 1:length(CO2_arr)
                if CO2_arr[i][CO2_bit] == '0' push!(new_arr, CO2_arr[i]) end
            end

        end

        CO2_arr = new_arr
        CO2_bit += 1
    end

    O2 = 0
    CO2 = 0
    base = 0

    for i in 0:bit_length-1
        O2 += parse(Int, O2_arr[1][end-i]) * 2^base
        CO2 += parse(Int, CO2_arr[1][end-i]) * 2^base
        base += 1
    end

    println(O2 * CO2)
end

part1()
part2()