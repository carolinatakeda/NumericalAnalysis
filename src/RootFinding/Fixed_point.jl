function fixed_point(g, p_0, tol, max_iter)
    p = p_0
    p_i=p_0
    for i in 1:max_iter
        p=g(o_i)
        if abs(p-p_i) < tol
            return p
        end
        p_i=p
    end
    return "Método Falhou"

end