# Course on Unix and work with genomic data - Prague, November 2020
## Final exercise
### Task 6
Create an executable shell script that carries the data processing on vcf file (/data-shared/vcf_examples/luscinia_vars.vcf.gz). 
Count proportion of transitions (A -> G, G -> A, C -> T, T -> C) and transversions (A -> C/T, C -> A/G, G -> C/T, T -> A/G) in total and by type of nucleotide.
Create .R script that prepares the graph visualising the results.

### Solution
I made a shell script which analyzes /data-shared/vcf_examples/luscinia_vars.vcf.gz file and prints on standard output total number and proportion of transitions and transversion in total and also transitions and transversion for each nucleotide.

#### Run the solution
To run the solution clone this repository with
~~~~
git clone https://github.com/CalounovaT/ngs-course-2020.git
~~~~
Then move to this directory with
~~~~
cd ngs-course-2020
~~~~

#### Shell script
To get the results run this command
~~~~
./trans_script.sh
~~~~
You should see the results printed
~~~~
transitions =  206468 (0.61%)
transversions = 131944 (0.39%)
A -> C = 11758 (0.03%)
A -> G = 54261 (0.16%)
A -> T = 23421 (0.07%)
C -> A = 10824 (0.03%)
C -> G = 18966 (0.06%)
C -> T = 50124 (0.15%)
G -> A = 50969 (0.15%)
G -> C = 18091 (0.05%)
G -> T = 10951 (0.03%)
T -> A = 26219 (0.08%)
T -> C = 51114 (0.15%)
T -> G = 11714 (0.03%)
~~~~
`trans_script.sh` also creates summary csv file in your home directory `substitutions_results.csv` with these results.

#### R script
Then you can visualize the data with provided R script `plot_script.R`.
You can run the script with
~~~~
Rscript plot_script.R
~~~~
This will generate file `Rplots.pdf` in your home directory containing the plots.

Alternatively you can view them in Rstudio.

##### Main overview (p1)
![Overview](./plots/p1.png)

##### Transitions histogram (p2)
![Transitions](./plots/p2.png)

##### Transversions histogram (p3)
![Overview](./plots/p3.png)

##### Adenin overview (p4)
![Overview](./plots/p4.png)

##### Adenin histogram (p5)
![Overview](./plots/p5.png)

##### Cytosin overview (p6)
![Overview](./plots/p6.png)

##### Cytosin histogram (p7)
![Overview](./plots/p7.png)

##### Guanin overview (p8)
![Overview](./plots/p8.png)

##### Guanin histogram (p9)
![Overview](./plots/p9.png)

##### Thymin overview (p10)
![Overview](./plots/p10.png)

##### Thymin histogram p(11)
![Overview](./plots/p11.png)


