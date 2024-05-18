function newton(f::Function,d_f::Function,approx::Float64, tol::Float64, max_iter::Int64)
    p_i = approx
    p = approx
    for i = 1:max_iter
        if isapprox(d_f(p), 0)
            return "Método falhou, pois f' anulou"
        end
        p = p_i - (f(p_i) / d_f(p_i))
        if abs(p - p_i) < tol
            return p
        end
        p_i = p
    end
    return ("O método falhou após o máximo de iterações")
end
