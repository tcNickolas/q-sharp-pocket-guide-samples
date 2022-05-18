' Namespace in which quantum simulator resides
Imports Microsoft.Quantum.Simulation.Simulators
' Namespace in which QArray resides
Imports Microsoft.Quantum.Simulation.Core

Module VBNetDriver
    Sub Main(args As String())
        ' Create a full-state simulator
        Using simulator As QuantumSimulator = New QuantumSimulator
            ' Run the quantum code and get the results.
            Dim ret As QArray(Of Boolean)
            ret = BiasedCoins.FlipBiasedCoinN.Run(simulator, 10, 0.3).Result
            ' Print the results.
            Console.WriteLine(ret)
        End Using
    End Sub
End Module
