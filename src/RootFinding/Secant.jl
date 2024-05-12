function secant(f::Function, p_0::Float64, p_1::Float64, tol::Float64, max_iter::Int64)
    if f(p_0) == f(p_1)
        println( "f(p_0) e f(p_1) estão próximos")
    end
    p = p_1
    p_i = p_1
    q_i = p_0
    f_pi = f(p_i)
    f_qi = f(q_i)

    for i = 1:max_iter
        
        if f_qi == f_pi
            return "Erro, pois f(p_i) está muito próximo de f(q_i)"
        end
        p = p_i - (f_pi * (p_i - q_i)) / (f_pi - f_qi)
        
        if abs(p_i - q_i) < tol
            return p
        end
        
        q_i = p_i
        p_i = p
        f_pi = f(p_i)
        f_qi = f(q_i)
    end
    return "Método falhou"
end
