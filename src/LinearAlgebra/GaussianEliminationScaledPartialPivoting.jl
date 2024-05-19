function solve_system_with_scaled_partial_pivoting(matriz_A::Matrix{Float64}, vetor_b::Vector{Float64})
    n = length(vetor_b)
    
    dimention_failure(matriz_A, n) && return
    
    A = [copy(matriz_A) copy(vetor_b)]

    for i = 1:n-1
        pivo = A[i, i]
        linhaPivo = i
        for k = i:n-1
            if abs(A[k, i]) > pivo
                pivo = abs(A[k, i])
                linhaPivo = k
            end
        end

        if pivo == 0
            return ("Sistema não admite solução única",)
        end

        if linhaPivo != i
            linhaAuxiliar = copy(A[linhaPivo, :])
            A[linhaPivo, :] = A[i, :]
            A[i, :] = linhaAuxiliar
        end

        for j = i+1:n
            m = A[j, i] / A[i, i]
            A[j, :] = A[j, :] - m * A[i, :]
        end
    end

    if round(A[n, n], digits=n) == 0
        println("Sistema não admite única solução")
        return
    end

    x = zeros(Float64, n)
    x[n] = A[n, n+1] / A[n, n]

    for i = n-1:-1:1
        soma = 0
        for j = i+1:n
            soma += A[i, j] * x[j]
        end
        x[i] = (A[i, n+1] - soma) / A[i, i]
    end
    return x
end