

function S(Ts, L=10, k_B=1)
    Zs = zeros(Ts)

    # partition functions
    for (i, T) in enumerate(Ts)
        beta = 1/(k_B * T)
        Zs[i] = mapreduce(l -> exp(-beta * sqrt(l)), +, 1:L)
    end

    # free energy
    Fs = -k_B * Ts .* log(Zs)

    # simple derivative
    (Fs[2:end] - Fs[1:end-1]) ./ (Ts[1:end-1] - Ts[2:end])
end


# creates x-values fitting the y-values from the derivative
function get_xs(xs)
    0.5 * (xs[1:end-1] + xs[2:end])
end


# Plotting
using PyPlot

begin
    # There is a lot of change at small T, so logarithmic scaling is nice
    Ts = logspace(-3, 1.5, 100)

    plot(get_xs(Ts), S(Ts, 10),   "k.-", label="L = 10")
    plot(get_xs(Ts), S(Ts, 100),  "b.-", label="L = 100")
    plot(get_xs(Ts), S(Ts, 1000), "r.-", label="L = 1000")

    xlim(0, maximum(Ts))
    ylabel("Entropy S")
    xlabel("Temperature T")
    legend(loc="lower right")
end
