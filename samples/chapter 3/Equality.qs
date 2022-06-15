namespace ExpressionsExamples {
    open Microsoft.Quantum.Intrinsic;

    /// # Summary
    /// The collection of examples of equality expressions.
    operation EqualityExamples() : Unit {
        Message("============================== Q# expressions: equality ==============================");

        // Equality and inequality operators check whether their operands are equal.
        // They are defined for types Int, BigInt, Double, String, Bool, Result, Pauli, and Qubit.
        Message($"intEquality = {42 == 10 * 4}");              // false
        Message($"bigIntEquality = {13L == 0b1101L}");         // true
        Message($"doubleInequality = {1. / 0. != 2. / 0.}");   // false - both are Infinity
        Message($"stringInequality = {"hi" != "HI"}");         // true
        Message($"boolEquality = {true == false}");            // false
        Message($"resultInequality = {Zero != One}");          // true
        Message($"pauliEquality = {PauliX == PauliZ}");        // false

        // Qubit variables equality compares the qubits they point to, rather than their states.
        // Allocate two qubits in the |0⟩ state.
        use (a, b) = (Qubit(), Qubit());
        Message($"sameStatesAreEqual = {a == b}"); // false
        // Copy variable b to variable c.
        let c = b;
        Message($"sameQubitsAreEqual = {b == c}"); // true
    }
}
