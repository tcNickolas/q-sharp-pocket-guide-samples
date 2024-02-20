namespace LibraryExamples {
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Unstable.StatePreparation;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Unstable.StatePreparation library.
    @EntryPoint()
    operation PreparationExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Unstable.StatePreparation ==============================");

        // Operations of the Microsoft.Quantum.Unstable.StatePreparation library offer a variety of state preparation routines.

        // Example 1: Preparing arbitrary states with real non-negative amplitudes.
        Message("\nExample 1: Preparing arbitrary states with real non-negative amplitudes.");
        {
            use qs = Qubit[2];
            PreparePureStateD([1.0, 2.0, 0.0, 2.0], qs);
            DumpMachine();
            ResetAll(qs);
        }

        // Example 3: Preparing arbitrary states with complex amplitudes.
        Message("\nExample 3: Preparing arbitrary states with complex amplitudes.");
        {
            use qs = Qubit[2];
            ApproximatelyPreparePureStateCP(0.000001, [
                    ComplexPolar(1., 0.),
                    ComplexPolar(0., 0.),
                    ComplexPolar(2., PI()/2.0),
                    ComplexPolar(-2., 0.)
                ], qs);
            DumpMachine();
            ResetAll(qs);
        }
    }
}
