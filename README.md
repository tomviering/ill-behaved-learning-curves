# Making Learners (More) Monotone
This repository contains the code to reproduce all the figures in our paper:

The Shape of Learning Curves: a Review

T J Viering, M Loog, 

arxiv 2021

If you found this code useful in your work, please cite our paper.

# Installation
1. Clone repository to your local PC: `git clone https://github.com/tomviering/ill-behaved-learning-curves.git`.
2. Optional: navigate to the root directory of the project and execute `download_dependencies('all')` to download all additional dependencies for all experiments and the author provided results. 
3. Optional: download and extract [export_fig](https://nl.mathworks.com/matlabcentral/fileexchange/23629-export_fig) in the directory 'export_fig' (only required for exporting PDF and PNG figures).
4. Optional: download and extract [panel-2.14](https://nl.mathworks.com/matlabcentral/fileexchange/20003-panel) (Matlab account required) in the directory 'panel-2.14' (only required for the pretty version of Fig 3). 

# Running the experiments

The experiments that produce the learning curves for the figures of the paper 
are sometimes time consuming because many repitions are required to obtain smooth learning curves. 
Therefore, we have prepared two versions of all the experiments:

1. run_experiments_fast.m - total running time about 10 minutes. all the results are saved to the folder 'results_fast'.
2. run_experiments_long.m - total running time about 6 hours. all the results are saved to the folder 'results_long'.

These scripts also generate the (bare bones) learning curve figures.
We have also performed these computations for you and we provide them with this repository. To download the results, execute `download_dependencies('author_results')`. 
They are automatically placed in the folders 'results_fast' and 'results_long'. 

# The plots

## plots_learning_curves.m 

A simplified script that shows all ill-behaved learning curves (Fig 3) and the surface plot (Fig 2) with minimal styling. Requires all result files. 

![Learning curve vehicles realizeable](https://raw.githubusercontent.com/tomviering/NuclearDiscrepancy/master/learning_curve_vehicles_realizeable.png)

## figure1_crossing_curves.m

The crossing learning curves of Fig 1 (not based on actual data).

## figure2_surface_plot.m 

The pretty version of the surface plot of Figure 2, requires the result file `2_peaking.mat'. 

## figure3_ill_behaved_curves.m 

The pretty version of all ill-behaved learning curves of Figure 3, requires all result files and dependencies. Install them using `download_dependencies('all')`.

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

