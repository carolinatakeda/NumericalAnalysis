@testset begin
    tol = 1e-6
    N = 100

    f(x) = cos(x)
    Df(x) = -sin(x)
    f0 = Float64(pi / 2)
    g(x) = sin(x)
    Dg(x) = cos(x)
    g0 = Float64(pi)
    w(x) = (x^3) - 1
    Dw(x) = 3 * (x^2)
    w0 = 1.0
    y(x) = x^2
    Dy(x) = 2 * x
    y0 = 0.0
    z(x) = log(x)
    Dz(x) = 1 / x
    z0 = 1.0

   #bisection_method
    x_calc = bisection_method(f, 0.0, Float64(pi), tol, N)
    @test norm(f0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = bisection_method(g, Float64(pi / 2), Float64(3 * pi / 2), tol, N)
    @test norm(g0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = bisection_method(w, 0.0, 2.0, tol, N)
    @test norm(w0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = bisection_method(y, -1.0, 1.0, tol, N)
    @test norm(y0 - x_calc, Inf) ≈ 0 atol = tol

    #x_calc = bisection_method(z, 0.1, 2.0, tol, N)
    #@test norm(z0 - x_calc, Inf) ≈ 0 atol = tol

    # Fixed Point (só funciona com funções que são contrações, logo apenas com f e g)

    x_calc = fixed_point(f, 1.0, tol, N)
    @test norm(f0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = fixed_point(g, 2.5, tol, N)
    @test norm(g0 - x_calc, Inf) ≈ 0 atol = tol

    #x_calc = fixed_point(w,0.7,tol,N)
    #@test norm(w0-x_calc, Inf) ≈ 0 atol = tol

    #x_calc = fixed_point(y,0.2,tol,N)
    #@test norm(y0-x_calc, Inf) ≈ 0 atol = tol

    #x_calc = fixed_point(z,0.7,tol,N)
    #@test norm(z0-x_calc, Inf) ≈ 0 atol = tol

    # Newton

    x_calc = newton(f, Df, 1.0, tol, N)
    @test norm(f0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = newton(g, Dg, 2.5, tol, N)
    @test norm(g0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = newton(w, Dw, 0.7, tol, N)
    @test norm(w0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = newton(y, Dy, 0.2, tol, N)
    @test norm(y0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = newton(z, Dz, 0.7, tol, N)
    @test norm(z0 - x_calc, Inf) ≈ 0 atol = tol

    # Secant

    x_calc = secant(f, 0.0, 1.0, tol, N)
    @test norm(f0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = secant(g, 3.0, 3.5, tol, N)
    @test norm(g0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = secant(w, 0.0, 2.0, tol, N)
    @test norm(w0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = secant(y, -0.5, 2.0, tol, N)
    @test norm(y0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = secant(z, 0.1, 2.0, tol, N)
    @test norm(z0 - x_calc, Inf) ≈ 0 atol = tol

    #delta squared aitiken
    x_calc = delta_squared_aitken(f,1.0,tol,N)
    @test norm(f0- x_calc, Inf) ≈ 0 atol = tol

    x_calc = delta_squared_aitken(g,Float64(pi/2),tol,N)
    @test norm(g0- x_calc, Inf) ≈ 0 atol = tol

    x_calc = delta_squared_aitken(w,0.8,tol,N)
    @test norm(w0- x_calc, Inf) ≈ 0 atol = tol

    x_calc = delta_squared_aitken(z,0.7,tol,N)
    @test norm(z0- x_calc, Inf) ≈ 0 atol     = tol

    #steffensen
    x_calc = steffensen(f,1.0,tol,N)
    @test norm(f0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = steffensen(g,2.5,tol,N)
    @test norm(g0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = steffensen(w,0.7,tol,N)
    @test norm(w0 - x_calc, Inf) ≈ 0 atol = tol

    x_calc = steffensen(z,0.7,tol,N)
    @test norm(z0 - x_calc, Inf) ≈ 0 atol = tol
end