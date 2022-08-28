namespace LibraryExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Preparation;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Preparation library.
    operation PreparationExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Preparation ==============================");

        // Operations of the Microsoft.Quantum.Preparation library offer a variety of state preparation routines.

        // Example 1: Preparing uniform superpositions.
        Message("\nExample 1: Preparing uniform superpositions.");
        use qs = Qubit[3] {
            PrepareUniformSuperposition(5, LittleEndian(qs));
            DumpMachine();
            ResetAll(qs);
        }

        // Example 2: Preparing arbitrary states with real non-negative amplitudes.
        Message("\nExample 2: Preparing arbitrary states with real non-negative amplitudes.");
        use qs = Qubit[2] {
            PrepareArbitraryStateD([1.0, 2.0, 0.0, 2.0], LittleEndian(qs));
            DumpMachine();
            ResetAll(qs);
        }

        // Example 3: Preparing arbitrary states with complex amplitudes.
        Message("\nExample 3: Preparing arbitrary states with complex amplitudes.");
        use qs = Qubit[2] {
            PrepareArbitraryStateCP([
                    ComplexPolar(1., 0.),
                    ComplexPolar(0., 0.),
                    ComplexPolar(2., PI()/2.0),
                    ComplexPolar(-2., 0.)
                ],
                LittleEndian(qs));
            DumpMachine();
            ResetAll(qs);
        }
    }
}
