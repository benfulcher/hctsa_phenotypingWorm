# hctsa_phenotypingWorm

A Matlab code package for running [_hctsa_](github.com/benfulcher/hctsa) analysis on movement speed data of five strains of the nematode worm _Caenorhabditis elegans_: the CB4856 (Hawaiian wild isolate), and N2 (lab) strains, and the mutants _dpy-20(e1282)_ (morphological mutant), _unc-9(e101)_ (neural mutant), and _unc-38(e264)_ (neural mutant).

The analysis results are published in this open-access article: [&#x1F4D7; Fulcher and Jones, _Cell Systems_ (2017)](https://doi.org/10.1016/j.cels.2017.10.001).

## The data

The data were very kindly provided by Andre Brown and Bertalan Gyenes, Imperial College London, and can be downloaded, along with all of the *hctsa* calculations, either by running `downloadComputedData`, or [from figshare](https://dx.doi.org/10.4225/03/580478f951263).
See [wormbase](wormbase.org) for more information about the data, including gene knockouts.
Note that the Hawaiian strain, CB4856, is labeled as `H` here.

## _hctsa_ feature extraction

In addition to the data file, `HCTSA.mat`, containing the results of *hctsa* feature extraction ([on figshare](https://dx.doi.org/10.4225/03/580478f951263)), this repository also requires [hctsa](github.com/benfulcher/hctsa) to be installed and paths to this package added (through the `startup.m` script in the *hctsa* package).

- `wormAnalysis` contains the main steps for processing and analysis.
- `worm_TopFeatures` allows more in-depth plotting for individual features.
- `paperMainTextFigures` reproduces the figures in the main text of the [Cell Systems paper](https://doi.org/10.1016/j.cels.2017.10.001).
- `doFilter` is a function for filtering different sets of features and normalizing.

## python analysis

[Luiz Gustavo](https://github.com/lgaalves) has worked up an analysis of the _hctsa_ data using [scikit-learn](https://scikit-learn.org) in python in [this repository](https://github.com/lgaalves/hctsa_phenotypingWorm_python).
