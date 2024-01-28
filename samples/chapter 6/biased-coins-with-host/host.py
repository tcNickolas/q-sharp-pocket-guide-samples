import qsharp

qsharp.init(project_root="./")

# Define the number of bits to generate.
n_bits = 10
# Define the probability to generate true.
p_true = 0.3

# Run the quantum code and get the results.
generatedBits = qsharp.eval(f"BiasedCoins.FlipBiasedCoinN({n_bits}, {p_true})")

# Print the results.
print(generatedBits)
