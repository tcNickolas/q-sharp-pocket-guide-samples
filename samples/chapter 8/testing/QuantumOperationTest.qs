namespace TestExamples {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    /// # Summary
    /// A test that checks whether the Ry gate with the fixed argument 
    /// is equivalent to the identity gate.
    @Test("QuantumSimulator")
    operation TestQuantumOperation() : Unit {
        let theta = 2.0 * PI();
        AssertOperationsEqualReferenced(1, ApplyToHead(Ry(theta, _), _), NoOp);
    }
}
