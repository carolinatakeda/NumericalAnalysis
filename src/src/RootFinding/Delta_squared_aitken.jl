function delta_squared_aitken(
    f::Function,
    inicial_value::Float64,
    tol::Float64,
    max_iter::Int64,
)
    h(x)=f(x)+x
    x_0 = inicial_value
    for i = 1:max_iter
        x_1 = h(x_0)
        x_2 = h(x_1)

        denominator = (x_2 - x_1) - (x_1 - x_0)

        if abs(denominator) < 1e-10
            println("Erro: denominador muito pequeno!")
            break
        end

        aitkenX = x_2 - ((x_2 - x_1)^2) / denominator

        if abs(aitkenX - x_2) < tol
            return aitkenX
        end
        x_0 = aitkenX
    end
    println("Método falhou!")
end
