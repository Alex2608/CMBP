function generate_T(w, N=10, xs=(2*rand(N) - 1))
    T = zeros(N, N)
    for i in 1:N
        T[i, i] = w * xs[i]
        (i < N) && (T[i, i+1] = 1)
        (i > 1) && (T[i, i-1] = 1)
        # > (cond) && (something)
        # is equivalent to
        # > if cond
        # >     something
        # > end
    end
    T
end



using PyPlot

begin
    N = 10
    ws = 0.0:0.5:5.0
    xs = (2*rand(N) - 1)

    eigenvals = [
        eigvals(generate_T(w, N, xs)) for w in ws
    ]

    figure()
    for i in 1:N
        plot(ws, map(x -> x[i], eigenvals), label=string(i))
    end
    # legend can be moved (more precisely) with bbox_to_anchor
    legend(bbox_to_anchor=(1.0, 1.))
end


begin
    N = 10
    ws = 0.0:0.5:5.0
    xs = (2*rand(N) - 1)

    min_vecs = Array(Float64, length(ws), N)
    for (i, w) in enumerate(ws)
        T = generate_T(w, N, xs)
        eigenvals = eigvals(T)

        # sortperm(x) will give a set of indices which would sort x
        indices = sortperm(eigenvals)

        # sort eigenvecs according to eigenvals
        eigenvecs = eigvecs(T)[:, indices]
        min_vecs[i, :] = eigenvecs[:, 1]

        # this prints a formated version of the first eigenvector
        println(
            "v = [" * mapreduce(
                x -> (@sprintf "%0.2f" x),      # generate string with 2 digits after the comma from x
                (s1, s2) -> s1 * ", " * s2,     # join two string with ", " inbetween
                eigenvecs[:, 1]                 # get the first eigenvector
            ) * "]"
        )
    end

    figure()
    imshow(min_vecs, interpolation="None")
    xlabel("w")
    ylabel("Vector indices")
    colorbar()
end
