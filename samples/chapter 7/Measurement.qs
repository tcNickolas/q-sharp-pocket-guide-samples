namespace LibraryExamples {
    open Microsoft.Quantum.Measurement;

    /// # Summary
    /// The collection of usage examples of Microsoft.Quantum.Measurement library.
    @EntryPoint()
    operation MeasurementExamples() : Unit {
        Message("============================== Q# libraries: Microsoft.Quantum.Measurement ==============================");

        // Operations of the Microsoft.Quantum.Measurement library implement an extended set of measurements.

        // Example 1: Single-qubit measurements in Pauli bases.
        Message("\nExample 1: Single-qubit measurements in Pauli bases.");
        {
            use q = Qubit();
            H(q);
            Message($"{MResetX(q)}");
            // The qubit is returned to the |0⟩ state.

            X(q);
            Message($"{MResetZ(q)}");
        }

        // Example 2: Parity measurement.
        Message("\nExample 2: Parity measurement.");
        {
            use qs = Qubit[2];
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let parity = MeasureAllZ(qs);
            // Yields Zero with probability 100%.
            Message($"{parity}");
            // The qubits are NOT returned to the |0⟩ state.
            ResetAll(qs);
        }

        // Example 3: Measuring each qubit in the array.
        Message("\nExample 3: Measuring each qubit in the array.");
        {
            use qs = Qubit[2];
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            let ms = MeasureEachZ(qs);
            // Yields [Zero, Zero] with probability 50%
            // and [One, One] with probability 50%.
            Message($"{ms}");
        }
    }
}
