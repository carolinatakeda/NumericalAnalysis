function newton(approx,tol,max_iter, f, d_f)
    p_i = approx
    p= approx
    for i in 1:max_iter
        if isapprox(d_f(p), 0, atol = 1e-8)
        return "Método falhou, pois f' anulou"
        end
        if abs(p-p_i)<tol
            return p
        end
        p_i=p
    end
    return ("O método falhou após o máximo de iterações")
end