@testset "Test invert_matrix " begin

    tol = 1e-10

    A = [2/3 0;0 5/7]
    B = [3/2 0; 0 7/5]

    x_calc = invert_matrix(A)
    @test norm(B - x_calc, Inf) ≈ 0 atol = tol

    tol = 1e-10

    A = [2.0 3.0 4.0; 1.0 5.0 6.0; 4.0 7.0 9.0]
    B= [-3.0 -1.0 2.0; -15.0 -2.0 8.0; 13.0 2.0 -7.0]
    

    x_calc = invert_matrix(A)
    @test norm(B - x_calc, Inf) ≈ 0 atol = tol

end