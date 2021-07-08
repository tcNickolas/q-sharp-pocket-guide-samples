import qsharp
from BiasedCoins import FlipBiasedCoinN

# Define the number of bits to generate.
nBits = 10
# Define the probability to generate true.
pTrue = 0.3

# Run the quantum code and get the results.
generatedBits = FlipBiasedCoinN.simulate(n=nBits, pTrue=pTrue)

# Print the results.
print(generatedBits)
