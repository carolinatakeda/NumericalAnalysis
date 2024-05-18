function solve_system_with_scaled_partial_pivoting(matrix_A::Matrix{Float64}, vector_b::Vector{Float64})
    n = length(vector_b)
    dimention_failure(matrix_A, n) && return
    A = [copy(matrix_A) copy(vector_b)]
    for i in 1:n-1
        s = zeros(Float64, n)
        M_i = zeros(Float64,n)
        for k in i:n
            s[k] = maximum(abs,A[k,:])
            if s == zeros(Float64, n)
                return ("Sistema não admite solução")
            end 
            M_i[k] = abs(A[k, i]) / s[k]         
        end
          
        M=maximum(M_i)
        p=i
        for p = i:n 
            if abs(A[p,i])/s[p] != M
                p = p+1
            else 
                break
            end
        end
        if p != i
            w=copy(A[p,:])
            A[p,:] = A[i,:]
            A[i,:]=w
        else 
            for j in i+1:n
                m_ji = A[j,i]/A[i,i]
                A[j, :] = A[j, :] - m * A[i, :]
            end
        end
        
    end
    if A[n,n]==0
        return("Não há solução única")
    end
    x = zeros(Float64,n)
    x[n]= A[n,n+1]/A[n,n]

    for i in n-1:-1:1
        S=0
        for j in i+1:n
            S += A[i,j]*x[j]
        end
        x[i] = (A[i,n+1]-S)/A[i,i]
    end
    return x
end