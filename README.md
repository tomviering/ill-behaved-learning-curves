# The Shape of Learning Curves
This repository contains the code to reproduce all the figures in our paper:

The Shape of Learning Curves: a Review

T J Viering, M Loog, 

unpublished

If you found this code useful in your work, please cite our paper.

This code has been tested with Matlab (R2019b).

# Installation
1. Clone repository to your local PC: 
```
git clone https://github.com/tomviering/ill-behaved-learning-curves.git
```
2. **Optional:** navigate to the root directory of the project and execute in Matlab
```
download_dependencies('all')
``` 
to download all additional dependencies for all experiments and the author provided results. 

3. **Optional:** download and extract [export_fig](https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig) in the directory 'export_fig' (only required for exporting figures).

4. **Optional:** download and extract [panel-2.14](https://nl.mathworks.com/matlabcentral/fileexchange/20003-panel) in the directory 'panel-2.14' (for pretty version of Fig 3). 

# Running the experiments

The experiments that produce the learning curves for the figures of the paper 
are sometimes time consuming because many repitions are required to obtain smooth learning curves. 
Therefore, we have prepared two versions of all the experiments:

1. run_experiments_fast.m - total running time about 10 minutes. all the results are saved to the folder 'results_fast'.
2. run_experiments_long.m - total running time about **6 hours**. all the results are saved to the folder 'results_long'.

Besides saving the results to disk, these scripts also make all plots.
We have performed these computations for you and we provide them with this repository. To download the results, execute 
```
download_dependencies('author_results')
```
They are automatically placed in the folders 'results_fast' and 'results_long'. 

# The plots

## all_plots_simple.m 

A simplified script that shows all ill-behaved learning curves (Fig 3) and the surface plot (Fig 2) with minimal styling. Requires all result files in the folders 'results_fast' or 'results_long'. 

![1_phasetransition](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/1_phasetransition.png)
![2_peaking](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/2_peaking.png)
![2_peaking_surface](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/2_peaking_surface.png)
![3_dipping](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/3_dipping.png)
![4_monotonicity_squared](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/4_monotonicity_squared.png)
![4_monotonicity_absolute](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/4_monotonicity_absolute.png)
![5_GP_regression](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/5_GP_regression.png)
![6_bayesian_regression](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/6_bayesian_regression.png)
![7_perfect_prior](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/7_perfect_prior.png)
![8_making_monotone](https://raw.githubusercontent.com/tomviering/ill-behaved-learning-curves/main/figures/8_making_monotone.png)

## figure1_crossing_curves.m

The crossing learning curves of Fig 1 (not based on actual data).

## figure2_surface_plot.m 

The pretty version of the surface plot of Figure 2, requires the result file `2_peaking.mat'. 

## figure3_ill_behaved_curves.m 

The pretty version of all ill-behaved learning curves of Figure 3.

## figure4_dipping_distribution 

Visualizes the distribution for the dipping learning curve. 

# Contact

If you run into any issues, you can email me: t.j.my_surname_here AT tudelft DOT nl

# License

MIT License

Copyright (c) 2021 T J Viering

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

