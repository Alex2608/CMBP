
# Creates T matrix for variable E (ϵ), t and N
function generate_T(E, t, N, periodic=true)
    # diagonal entries
    T = eye(Float64, N, N) * E

    # off-diagonal entries
    for i in 1:N-1
        T[i, i+1] = -t
        T[i+1, i] = -t
    end

    if periodic
        T[1, N] = -t
        T[N, 1] = -t
    end

    T
end



using PyPlot

begin
    N = 100
    ϵ = 1.0
    t = 2.0

    T = generate_T(ϵ, t, N)
    Energy = eigvals(T)

    plot(1:N, Energy, "k.-")
    plot(1:N, ϵ + 2t * cos(2pi * collect(1:N) / N), "r.-")
    ylabel("Energy E")
    xlabel("")
end
