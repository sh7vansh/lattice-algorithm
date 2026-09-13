# Lattice Theory Ontological Machine

This repository contains a Lean 4 formalization of the **Basis Discovery Algorithm** and **Algorithmic Friction** in abstract complete lattices. It models how greedy generator extraction operates within closure systems and explores the structural constraints (such as geometric and semimodular friction) that dictate algorithmic performance beyond discrete combinatorial boundaries.

## Overview

In abstract complete lattices, traditional metrics for algorithmic efficiency (like counting operations or set cardinality) dissolve. Instead, this project models algorithmic friction as a geometric defect in the structure of the space itself. 

This formalization covers:

* **Basis Discovery**: Greedily extracting a generating set in closure systems using transfinite induction.
* **Geometric Friction**: The structural resistance that arises when a space lacks the Mac Lane-Steinitz Exchange Property (i.e., when it is not a matroid or geometric lattice). 
* **Semimodular Friction (Rank Collapse)**: The vulnerability of non-semimodular lattices to adversarial rank traps, where an algorithm traverses deep chains of minimal rank increase.

For detailed theoretical breakdowns, read:
* [`BasisDiscovery.md`](BasisDiscovery.md) - Generator extraction in closure systems and its failure modes.
* [`friction.md`](friction.md) - Algorithmic friction, rank collapse, and the geometric absence of matroids.

## Requirements

* [Lean 4](https://leanprover.github.io/)
* [Lake](https://github.com/leanprover/lake) (Lean's package manager)

## Building the Project

To build the project and verify the formal proofs, run:

```bash
lake build
```

## Project Structure

* `LatticeTheory.lean`: The root module.
* `LatticeTheory/Basic.lean`: Foundational lattice theory definitions.
* `LatticeTheory/BasisDiscovery.lean`: Formalization of the discovery operator and closure systems.
* `LatticeTheory/Friction.lean`: Formalization of the Mac Lane-Steinitz exchange property, semimodularity, and rank collapse tautologies.

## License

This project is released under the [Apache 2.0 License](LICENSE).
