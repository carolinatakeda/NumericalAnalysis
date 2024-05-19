using LinearAlgebra

function invert_matrix(A::Matrix{Float64})
    n = size(A, 1)
    if n != size(A,2)
        return ("A matriz precisa ser quadrada!")
    end
    if  det(A) == 0
        return ("A matriz não é inversível")
    end

    I = zeros(Float64,n,n)
    for i =1:n 
        I[i,i] += 1
    end 
    B = zeros(Float64,n,n)

    for i = 1:n
        B[:,i]+=solve_system_with_scaled_partial_pivoting(A,I[:,i])
    end

    return(B)
end
