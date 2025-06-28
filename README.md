# 🤖 Gaussian Process Regression for Robotic Arm Modeling

> A simulation-based investigation of Gaussian Process Regression (GPR) applied to a robotic arm control task, exploring kernel effects and uncertainty estimation.

## 📌 Project Overview

This project explores **Gaussian Process Regression (GPR)**—a non-parametric Bayesian approach to regression—applied to a **robotic arm modeling problem** with an 8-dimensional input space. Through simulation, it demonstrates how different kernel choices and dataset sizes affect prediction accuracy and uncertainty quantification.

Key highlights:
- Simulates a robotic arm with 4 joints and segment lengths.
- Predicts the tip distance of the arm from the origin.
- Implements and compares GPR with **squared exponential**, **linear**, and **indicator kernels**.
- Visualizes results using slice plots and reports uncertainty bounds.

## 💡 Motivation

GPR offers a principled way to estimate predictive uncertainty, which is a valuable information in predictive models. This project showcases the ability to:
- Work with complex data structures,
- Implement core machine learning algorithms from scratch,
- Perform comparative kernel evaluations, and
- Communicate uncertainty via intuitive visualizations.

## 📊 Dataset & Problem Setup

- **Input**: 8-dimensional vector `[θ1, θ2, θ3, θ4, L1, L2, L3, L4]` where angles θᵢ ∈ [0, 2π] and lengths Lᵢ ∈ [0, 1].
- **Output**: Euclidean distance of the robotic arm tip from the origin.
- **Generated synthetically** based on trigonometric formulations simulating real robotic configurations.

## 🧠 Key Features

- **Bayesian Modeling**: Posterior predictive distributions are computed without explicit parameter tuning.
- **Kernel Comparison**: GPR is evaluated under three kernels:
  - **Squared Exponential** – best performance on nonlinear data.
  - **Linear** – suitable for linear patterns.
  - **Indicator** – behaves like a nearest-neighbor method.
- **Visualization**: Slice plots used to show 1D variable effects with fixed others.
- **Hyperparameter Tuning**: Impact of length scale on performance is systematically analyzed.
- **Performance Metric**: Mean Squared Error (MSE) across different kernels and data sizes.

## 🗞️ General Results

- Squared exponential kernel shows superior prediction and narrower uncertainty bounds.
- Performance improves with more training data, showcasing GPR’s data efficiency.

## 📁 Project Structure

```
.
├── code/                  # MATLAB code for GPR simulation
├── report/                # PDF version of the full technical report
├── plots/                 # Visualizations and figures
└── README.md              # You're here!
```

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/saeedmohseni97/gpr-robotic-arm.git
   cd gpr-robotic-arm
   ```
2. To run the GPR simulation, execute the `main.m` file located in the `code/` folder
3. View the output plots in the `plots/` folder.

## 📈 Results Summary

| Kernel Type        | MSE (N=100) | MSE (N=500) |
|--------------------|-------------|-------------|
| Squared Exponential| **0.166**   | **0.089**   |
| Linear             | 0.211       | 0.215       |
| Indicator          | 1.214       | 1.350       |

## 📄 Report

For a detailed discussion of theory, methodology, results, and analysis, see the [📑 full report (PDF)](./report/report.pdf).

## 👨‍💻 Author

**Saeed Mohseni seh deh**  
Graduate Researcher  
Institute for Advanced Computing, Virginia Tech, VA, USA  
🌐 [My Website]([https://your-website-link.com](https://saeedmohseni.netlify.app/) | 📫 saeedmohseni@vt.edu

---

## 🌟 If you like this project...

- ⭐ Star the repository
- 🍴 Fork it
- 🧠 Discuss ideas or improvements
