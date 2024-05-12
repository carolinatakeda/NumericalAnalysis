function fixed_point(g::Function, p_0::Float64, tol::Float64, max_iter::Int64)
    h(x)=g(x)+x
    p = p_0
    p_i = p_0
    for i = 1:max_iter
        p = h(p_i)
        if abs(p - p_i) < tol
            return p
        end
        p_i = p
    end
    return "Método Falhou"

end
