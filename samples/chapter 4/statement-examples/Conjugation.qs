namespace StatementsExamples {
    /// # Summary
    /// The collection of conjugation examples.
    @EntryPoint()
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
        ApplyControlledOnInt(2 ^ n - 1, X, qs, aux);
    }
}
