function secant(f,p_0, p_1,tol,max_iter)
    if f(p_0)==f(p_1) 
        return "f(p_0) e f(p_1) estão próximos"
    end
        p = p_1
        p_i=p_1
        q_i = p_0
        f_pi = f(p_i)
        f_qi = f(q_i)
        for i in 1:max_iter
            if f_qi==f_pi
                return "Erro, pois f(p_i) muito próximo de f(q_i)"
            end
            p= p_i - f_pi * (p_i-q_i)/f_pi-f_qis
            if abs(p_i-q_i) < tol
                return p
            end
            q_i = p_i 
            p_i = p
            f_pi = f(p_i)
            f_qi = f(q_i)
        end
    
end