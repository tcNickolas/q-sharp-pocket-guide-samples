open System.Diagnostics
// Namespace in which quantum simulator resides
open Microsoft.Quantum.Simulation.Simulators

[<EntryPoint>]
let main argv =
    // Define the number of bits to generate.
    let nBits = 10
    // Define the probability to generate true.
    let pTrue = 0.3

    // Run the quantum code and get the results.
    use simulator = new QuantumSimulator()
    let ret = Seq.toArray(BiasedCoins.FlipBiasedCoinN.Run(simulator, nBits, pTrue).Result)
    // Print the results.
    printfn "%A" ret

    // Return an integer exit code
    0