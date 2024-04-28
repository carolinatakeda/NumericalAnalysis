function delta_squared_aitken(f::Function, inicial_value::Float64, tol:: Float64, max_iter::Int64)
    x_0=inicial_value
    for i = 1:max_iter
        x_1 = f(x_0)
        x_2 = f(x_1)

        denominator = (x_2-x_1)/(x_1-x_0)
    
        if abs(denominator)< 1e-8
            println("Erro: denominador muito pequeno!")
            break
        end
        aitkenX = x_2 - ( (x_2 - x_1)^2 )/denominator

        if abs(aitkenX - x_2) < tol
            println("O ponto fixo é", aitkenX)
            break
        end
         x_0 = aitkenX
    end
   println("Warning: Not able to find solution to within the desired tolerance of ", tol)
   println("The last computed extrapolate was ", aitkenX)
end
