# How to optimize the parameters of a classification algorithm using a meta-heuristic algorithm
Parameter optimization of classification algorithms has always been a challenge. We propose a useful meta-heuristic to improve this challenge.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Contact](#contact)

## Installation

Provide step-by-step instructions on how to install and set up your project. Include any dependencies or prerequisites that need to be installed. For example:

Install the required dependencies: `Matlab 2021b or higher and enable machine learning and deep learning features when installing the Matlab program `

## Usage

Explain how to use your project. Provide examples, code snippets, or screenshots to demonstrate the functionality. For example:

1. Open the application: `Matlab`
2. Run the project: `main.m`
3. [Configure your deep neural network in `deepLearning.m` and ` deepLearning2.m`]

## Documentation
The aim of this small project is to improve two parameters of deep neural networks. Normally, you can set parameter values by random search or grid search. These methods often do not work because the possibilities for a combination of parameters are very large. It is therefore recommended to use other methods such as Bayesian optimization, evolutionary algorithm, meta-heuristics, and gradient-based optimization. Here we talk about the meta-heuristic algorithm that can solve this challenge as an optimization problem. The Crow Search Algorithm (CSA) is a relatively new, efficient meta-heuristic algorithm, and we select two parameters for optimization of deep neural networks. The first parameter is Learning Rate and the second parameter is Momentum. The following parameters are explained. 

**Learning Rate:** The learning rate is a hyper parameter that controls the step size or the rate at which a deep neural network adjusts its parameters during training. It determines the magnitude of the updates made to the parameters based on the gradient of the loss function. A high learning rate can result in faster convergence but may cause overshooting, while a low learning rate may slow down training or get stuck in suboptimal solutions.

**Momentum:** Momentum is a parameter used in optimization algorithms, such as stochastic gradient descent (SGD) with momentum. It introduces a notion of inertia to the parameter updates. It accumulates a fraction of the previous update and adds it to the current update, allowing the optimization process to have momentum and accelerate in the relevant directions. This helps to overcome small local optima and results in faster convergence and more stable training.
In the following, we explain CSA for understanding better. The Crow Search Algorithm (CSA) is a metaheuristic optimization algorithm inspired by the social behavior of crows. It mimics the foraging behavior of crows, which involves collaboration and information sharing within a group. 

In CSA, a population of candidate solutions, referred to as crows, is initialized randomly in the search space. Each crow represents a potential solution to the optimization problem. The algorithm iteratively updates the positions of the crows based on their fitness values. During each iteration, the crows communicate and share information with each other. This collaboration is done through two main behaviors: local search and global search. In the local search behavior, crows explore their local neighborhoods by adjusting their positions using a local search operator. This allows them to exploit the local search space efficiently. In the global search behavior, crows exchange information globally by sharing their best solutions with each other. This helps in exploring promising regions of the search space. The movement of crows is guided by a set of mathematical equations that mimic the social interaction and movement patterns observed in crow flocks. These equations consider factors such as the position of other crows, the fitness values of the crows, and the influence of random perturbations. The algorithm continues to iterate until a termination criterion is met, typically a predefined number of iterations or reaching a satisfactory solution. At the end of the optimization process, the best solution found by the crows represents the optimal or near-optimal solution to the given problem. The Crow Search Algorithm is a population-based optimization method that offers a balance between exploration and exploitation of the search space. It has been applied to various optimization problems and has shown promising results in terms of finding good solutions efficiently.

**Crow Search Algorithm for optimizing learning rate and momentum:**

1.**Initialization:** Define the number of crows (population size), the number of iterations, and the search space for the learning rate and momentum. Initialize the positions of the crows randomly within the search space.

2.**Fitness evaluation:** For each crow, create a DNN using the corresponding learning rate and momentum. Train the network on the training data and evaluate its performance on the validation data. The fitness of a crow is inversely proportional to the validation error.

3.**Memory update:** For each crow, update its memory if its current position has better fitness than its previous best position.

4.**Crows' positions update:** Update the position of each crow using the following rules:

a. _Awareness phase_: Select a random crow and calculate the distance between the current crow and the selected one. If the distance is less than a predefined threshold, move the crow away from the selected one.

b. _Search phase_: If the distance is greater than the threshold, update the crow's position considering its memory and the global best position found so far.

5.**Termination:** Repeat steps 2-4 for the predefined number of iterations. The best solution found during the iterations corresponds to the optimal learning rate and momentum for the DNN.

Using the Crow Search Algorithm for optimizing the learning rate and momentum can help find the best hyper parameter values that lead to better performance and faster convergence of the DNN. However, it is essential to consider that the search process can be computationally expensive, especially when dealing with large DNNs and extensive search spaces.

**Files Description:**
The following text refers to a description of the project files:

_main.m_: Project is run by this file. Loading dataset, call CSA for parameter optimization and classification by deep neural network are the most important commands that there are in the main file.

_CSA.m_: The edited version of crow search algorithm that work for parameter optimization.

_fitness.m_: This function calls deep neural network classifier to measure the quality of production.

_deepLearning.m_: The file is prepared for a deep neural network classification and runs at the final step.

_deepLearning2.m_: As with the previous file, the file is prepared to be classified as a deep neural network, but there are some differences. The fitness function requires this to check the quality of production.

_calculateAccuracy.m_: This function calculates the accuracy criterion by obtaining label data and forecast data.

_ init.m_: This function generates random values for the Learning Rate and Momentum parameters, which will be used by CSA later.

_ divideData.m_: The function separates data for training sets and test sets before evaluation. This process is based on the cross validation of the K-Fold.

## Contributing

We welcome contributions from the community! If you'd like to contribute to the project, please follow these guidelines:
1. Fork the repository and create a new branch.
2. Make your changes and test them thoroughly.
3. Submit a pull request describing your changes and their purpose.

For bug reports, feature requests, or general feedback, please open an issue on the [issue tracker](https://github.com/kay2kay/your-project/issues).

## License

This project is licensed under the [MIT License](LICENSE.md). Please see the `LICENSE.md` file for more details.

## Acknowledgments

We would like to thank the following libraries and resources for their contributions to this project:
- [MATLAB official site]( https://www.mathworks.com)
- [Maternal Health Risk Data (Predicting health risks for pregnant patients)]( https://www.kaggle.com/datasets/csafrit2/maternal-health-risk-data) , In our repository, dataset is presented with improving features.

## Contact

For any questions or inquiries, feel free to reach out to us at k1kayhani@gmail.com.

