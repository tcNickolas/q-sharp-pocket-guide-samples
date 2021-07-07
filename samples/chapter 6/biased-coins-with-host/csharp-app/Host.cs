namespace BiasedCoins 
{
    using System;
    using Microsoft.Quantum.Simulation.Simulators;

    /// <summary>
    /// The classical driver for the quantum computation.
    /// </summary>
    public class ClassicalHost
    {
        static void Main(string[] args) 
        {
            // Define the number of bits to generate.
            var nBits = 10;
            // Define the probability to generate true.
            var pTrue = 0.3;

            // Run the quantum code and get the results.
            using var simulator = new QuantumSimulator();
            var generatedBits = FlipBiasedCoinN.Run(simulator, nBits, pTrue).Result;

            // Print the results.
            Console.Out.WriteLine($"{generatedBits}");
        }
    }
}