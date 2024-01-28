namespace StatementsExamples {
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    /// # Summary
    /// The collection of qubit allocation examples.
    @EntryPoint()
    operation QubitAllocationExamples() : Unit {
        Message("============================== Q# statements: qubit allocation ==============================");

        // Example 1: allocate a qubit and use it to generate a random bit.
        Message("\nExample 1: Allocate a qubit and use it to generate a random bit.");
        use q = Qubit();
        H(q);
        let rndBit = MResetZ(q);
        Message($"Random bit = {rndBit}");

        // Example 2: allocate a qubit array and use it to generate a random n-bit integer.
        Message("\nExample 2: Allocate a qubit array and use it to generate a random n-bit integer.");
        let n = 3;
        use qs = Qubit[n];
        ApplyToEach(H, qs);
        let rndInt = MeasureInteger(qs);
        ResetAll(qs);
        Message($"Random integer = {rndInt}");

        // Example 3: allocate a mix of qubit arrays and individual qubits 
        // and use them in a defined scope.
        use (input, output) = (Qubit[3], Qubit()) {
            ApplyControlledOnInt(0, X, input, output);
            X(output);
            ResetAll(input + [output]);
        }
    }
}
