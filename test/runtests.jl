using Test
using LinearAlgebra: norm
using Integrals
DIGITS = 10

include("../src/Includes.jl")
include("src/LinearAlgebra/test_inverse.jl")
#include("src/LinearAlgebra/test_GaussianEliminationScaledPartialPivoting.jl")
#include("src/LinearAlgebra/test_GaussianElimination.jl")
#include("src/ErrorAnalysis/test_RoundOffErrors.jl")
#include("src/ErrorAnalysis/test_RoundArithmetics.jl")
#include("src/Integrals/test_CompositeSimpson.jl")
#include("src/RootFinding/test_RootFinding.jl")
"""
Use this to test all!


for (root, dirs, files) in walkdir(joinpath(pwd(), "src"))
    for file in files
        include(joinpath(root, file))
    end
end
"""
