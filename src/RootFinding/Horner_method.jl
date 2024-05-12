function horner(coeficientes::Vector{Float64}, x::Float64)
    if n == 0
        return [coeficientes[1], 0]
    end
    if n == 1
        return [coeficientes[2] * x + a[1], a[2]]
    end
    n = length(coeficientes)-1
    y = coeficientes[n+1]
    z = coeficientes[n+1]
    for i = n:-1:2
        y = x * y + coeficientes[i]
        z= x * z + y
    end
    y = coeficientes[1] + x*y
    return [y,z]
end
