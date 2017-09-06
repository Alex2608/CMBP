bits(Int16(12607))
ns = map(s -> parse(Int8, s), collect(reverse(bits(12607))))

mapreduce((i, ni) -> 0.1*(i-3.5) * ni, +, enumerate(ns))

E = 0
for (i, ni) in enumerate(ns)
    E += 0.1*(i-3.5) * ni
end

E



#############
### Below this
############

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

H = HamiltonMatrix(10)


# Other crap

H[64, 64]
minimum(H)

using PyPlot
N = 10
plot(0:2^N-1, map(i -> H[i, i], 1:2^N))
plot(0:2^N-1, sort(map(i -> H[i, i], 1:2^N)))
ylabel("E")
xlabel("Zustand")



map(i -> H[i, i], 1:2^N)


imshow(H)
colorbar()
