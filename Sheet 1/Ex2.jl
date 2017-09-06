E(l) = sqrt(l)
diff()


function S(Ts, L=10, k_B=1)
    Zs = zeros(Ts)
    for (i, T) in enumerate(Ts)
        beta = 1/(k_B * T)
        Zs[i] = mapreduce(l -> exp(-beta * sqrt(l)), +, 1:L)
    end
    Fs = -k_B * Ts .* log(Zs)
    (Fs[2:end] - Fs[1:end-1]) ./ (Ts[1:end-1] - Ts[2:end])
end

function get_xs(xs)
    0.5 * (xs[1:end-1] + xs[2:end])
end

ys = S(0.1:0.1:1.0)


using PyPlot

begin
    Ts = logspace(-3, 1, 100)
    plot(get_xs(Ts), S(Ts), "k.-")
    plot(get_xs(Ts), S(Ts), "b.-")
    plot(get_xs(Ts), S(Ts), "r.-")
    xlim(0, 10)
    ylabel("S")
    xlabel("T")
end
