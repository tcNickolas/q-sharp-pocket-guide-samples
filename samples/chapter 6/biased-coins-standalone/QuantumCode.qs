namespace BiasedCoins {
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    

    /// # Summary
    /// Generates a single random bit that represents an outcome of a biased coin flip.
    /// # Input
    /// ## pTrue
    /// The probability to generate true.
    operation FlipBiasedCoinOnce(pTrue : Double) : Bool {
        use q = Qubit();
        Ry(2.0 * ArcSin(Sqrt(pTrue)), q);
        return M(q) == One;
    }


    @EntryPoint()
    /// # Summary
    /// Generates a series of random bits that represent outcomes of a biased coin flip.
    /// # Input
    /// ## n
    /// The number of bits to generate.
    /// ## pTrue
    /// The probability to generate true.
    operation FlipBiasedCoinN(n : Int, pTrue : Double) : Bool[] {
        return DrawMany(FlipBiasedCoinOnce, n, pTrue);
    }
}
