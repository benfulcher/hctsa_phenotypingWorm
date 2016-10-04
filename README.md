# hctsa_phenotypingWorm
Running [hctsa](github.com/benfulcher/hctsa) analysis on movement speed data of five strains of the nematode worm *Caenorhabditis elegans*: the CB4856 (Hawaiian wild isolate), and N2 (lab) strains, and the mutants *dpy-20* (morphological mutant), *unc-9* (neural mutant), and *unc-38* (neural mutant).
Data were very kindly provided by Andre Brown and Bertalan Gyenes, Imperial College London.
See [wormbase](wormbase.org) for more information.
Note that the Hawaiian strain CB4856 is labeled as `H` in this dataset.

Requires [hctsa](github.com/benfulcher/hctsa) to be installed and paths to this package added (through the `startup.m` script in hctsa).
Also requires the data file, HCTSA.mat, containing the results of *hctsa* feature extraction (on figshare).

* `wormAnal` contains the main steps for processing and analysis
* `worm_TopFeatures` allows more in-depth plotting for individual features
* `doFilter` contains a script for filtering different sets of features and normalizing
* `paperMainTextFigures` reproduces the figures in the main text of the implementation paper
