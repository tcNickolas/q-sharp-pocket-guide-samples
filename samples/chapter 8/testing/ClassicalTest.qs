namespace TestExamples {
    open Microsoft.Quantum.Diagnostics;

    /// # Summary
    /// Returns the square of the input.
    function Squared(n : Int) : Int {
        return n^2;
    }


    /// # Summary
    /// A classical test that checks whether the function Squared 
    /// evaluates the classical function correctly.
    @Test("QuantumSimulator")
    function TestSquared() : Unit {
        for i in -10 .. 10 {
            let expected = i * i;
            let actual = Squared(i);
            if actual != expected {
                fail "Incorrect return for input {i}: expected {expected}, got {actual}";
            }
        }
    }
}
