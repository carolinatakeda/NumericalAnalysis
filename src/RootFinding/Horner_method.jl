function horner(coeficientes::Vector{Float64}, x::Float64)
    n = length(coeficientes)
    b = coeficientes[n]
    for i in n-1:-1:1
        b = x*b + coeficientes[i]
    end
    return b
end
