function HamiltonMatrix(N)
    # E_i
    E(i) = 0.1 * (i - 3.5)
    H = spzeros(2^N, 2^N)

    # UInt so we can use the full bit-range
    # 2^N-1 because we N bits are filled by 2^N-1
    for k in UInt64(0):UInt64(2^N-1)

        # reverse to fit notation of exercise, Int8 is sufficient for (0, 1)
        ns = map(s -> parse(Int8, s), collect(reverse(bits(k))))
        y = 0
        for (i, ni) in enumerate(ns)
            y += E(i) * ni
        end
        H[k+1, k+1] = y
    end
    H
end


# Generate (sparse) Hamilton Matrix
N = 6
H = HamiltonMatrix(N)

# Array view
Es = map(i -> H[i, i], 1:2^N)



# Plots
using PyPlot

begin
    plot(0:2^N-1, Es, "b.-")
    xlabel("State as Integer")
    ylabel("Energy")
end

begin
    # This is sorted by energy
    plot(0:2^N-1, sort(Es), "g.-")
    xlabel("just a mess")
    ylabel("Energy")
end

begin
    # Matrix represented as image
    imshow(H)
    colorbar()
end
