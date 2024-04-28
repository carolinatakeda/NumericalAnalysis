function steffensen(f::Function, p0::Float64, tol::Float64, max_iter::Int64)
    for i in 1:max_iter
        p1 = f(p0)
        p2 = f(p1)
        p = p0 - (p1 - p0)^2 / (p2 - 2*p1 + p0)
        if abs(p - p0) < tol
            println(p)
            return
        end
        p0 = p
    end
    println("Falhou após ", max_iter, " iterações")
end
