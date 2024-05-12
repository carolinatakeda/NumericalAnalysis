function steffensen(f::Function, p0::Float64, tol::Float64, max_iter::Int64)
    h(x)=f(x)+x
    for i = 1:max_iter
        p1 = h(p0)
        p2 = h(p1)
        p = p0 - (p1 - p0)^2 / (p2 - 2 * p1 + p0)
        if abs(p - p0) < tol
            return p
        end
        p0 = p
    end
    println("Falhou após ", max_iter, " iterações")
end
