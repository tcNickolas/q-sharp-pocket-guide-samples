import qsharp

qsharp.init(project_root=".")

def test_classical_qsharp():
    qsharp.eval("TestExamples.TestSquared()")

def test_quantum_state():
    qsharp.eval("TestExamples.TestSingleQubitState()")
    qsharp.eval("TestExamples.TestMultiQubitState()")

def test_quantum_operation():
    qsharp.eval("TestExamples.TestQuantumOperation()")
