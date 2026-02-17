# EBA3.0
Evolutionary Breakpoint Analyer ⚡ Tool 
for analyzing breakpoints in evolutionary algorithms

## Installation

### Requirements

- Python 3.10 or higher
- pip

### Installation

```bash
pip install git+https://github.com/alexander-volkov/EBA3.0.git
```

## Usage

### Example

```python
import numpy as np
from eba3 import EBA3

# Define the objective function
def objective_function(x):
    return np.sum(x**2)

# Define the search space
search_space = np.array([[-5.12, 5.12], [-5.12, 5.12]])

# Define the parameters for the evolutionary algorithm
params = {
    "population_size": 100,
    "max_iterations": 100,
    "mutation_rate": 0.1,
    "crossover_rate": 0.9,
    "selection_rate": 0.5,
    "elitism_rate": 0.1,
    "tournament_size": 3,
    "mutation_strength": 0.5,
    "crossover_strength": 0.5,
    "selection_strength": 0.5,
    "elit