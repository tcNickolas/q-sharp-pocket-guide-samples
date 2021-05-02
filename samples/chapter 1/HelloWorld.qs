namespace HelloQuantumWorld {
    open Microsoft.Quantum.Intrinsic; // To use Message
    
    /// # Summary
    /// Prints a message to the console.
    @EntryPoint()
    operation SayHello() : Unit {
        Message("Hello quantum world!");
    }
}
