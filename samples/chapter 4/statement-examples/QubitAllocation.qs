namespace StatementsExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;


    /// # Summary
    /// The collection of qubit allocation examples.
    operation QubitAllocationExamples() : Unit {
        Message("============================== Q# statements: qubit allocation ==============================");

        // Example 1: allocate a qubit and use it to generate a random bit.
        Message("\nExample 1: Allocate a qubit and use it to generate a random bit.");
        use q = Qubit();
        H(q);
        let rndBit = M(q);
        Message($"Random bit = {rndBit}");

        // Example 2: allocate a qubit array and use it to generate a random n-bit integer.
        Message("\nExample 2: Allocate a qubit array and use it to generate a random n-bit integer.");
        let n = 3;
        use qs = Qubit[n];
        ApplyToEach(H, qs);
        let rndInt = MeasureInteger(LittleEndian(qs));
        Message($"Random integer = {rndInt}");

        // Example 3: allocate a mix of qubit arrays and individual qubits 
        // and use them in a defined scope.
        use (input, output) = (Qubit[3], Qubit()) {
            ControlledOnInt(0, X)(input, output);
            AssertQubit(One, output);
            X(output);
        }
    }
}
