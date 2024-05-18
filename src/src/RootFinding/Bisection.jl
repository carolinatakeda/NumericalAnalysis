function bisection_method(
    f::Function,
    a::Float64,
    b::Float64,
    tol::Float64,
    max_iter::Int64,
)
    a_i = a
    b_i = b
    for i = 1:max_iter
        p = a_i + (b_i - a_i) / 2
        if isapprox(f(p), 0, atol = 1e-8) || (b_i - a_i) / 2 < tol
            return p
        end
        if sign(f(a_i)) * sign(f(p)) > 0
            a_i = p
        else
            b_i = p
        end
    end
    print("Método Falhou")

end
