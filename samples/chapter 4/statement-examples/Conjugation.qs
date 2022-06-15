namespace StatementsExamples {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;


    /// # Summary
    /// The collection of conjugation examples.
    operation ConjugationExamples() : Unit {
        Message("============================== Q# statements: conjugation ==============================");

        // Example: the three code blocks below are equivalent.
        let n = 3;
        use (qs, aux) = (Qubit[n], Qubit());

        // Method 1: spell out uncomputation manually.
        ApplyToEachA(X, qs);
        Controlled X(qs, aux);
        Adjoint ApplyToEachA(X, qs);

        // Method 2: use the conjugation statement.
        within {
            ApplyToEachA(X, qs);
        } apply {
            Controlled X(qs, aux);
        }

        // Method 3: use the library operation.
        ControlledOnInt(2 ^ n - 1, X)(qs, aux);
    }
}
