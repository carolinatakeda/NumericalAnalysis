module NumericalAnalysis

include("Includes.jl")


export round_sum,
    round_mul,
    trunc_sum,
    trunc_mul,
    absolute_error,
    relative_error,
    approximated_value_interval_given_relative_error,
    bisection_method,
    fixed_point,
    newton,
    secant,
    solve_system,
    delta_squared_aitken,
    solve_system_with_scaled_partial_pivoting,
    dimention_failure,
    solve_system, 
    invert_matrix
end

