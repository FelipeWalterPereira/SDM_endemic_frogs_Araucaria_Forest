
# SDMs for endemic frogs in the Araucaria Forest using kuenm R package

This project aimed to model the potential distribution for seven frog
species endemic to the Araucaria Forest. The SDMs were performed in the
‘kuenm’ R package (Cobos et al. 2019).

Originally, I did all the SDMs processes in my own computer with some
manual data preparation steps (not easily replicable). Here, I provide
all the occurrence data and files to carry out all the modeling
processes. Unfortunatly, I cannot upload the Worldclim layers in GitHub
due to storage limits. However, I’ve provided the necessary steps for
bioclimatic variables preparation in the Rmarkdown files.

## In detail here you will find:

- All occurrences data for the seven endemic frog species
  (Data/occurrences/);
- The shapefiles (Data/ecoregions/) for the WwF ecoregions (for M
  selection - the calibraion areas for the models) and for Araucaria
  Forest (to mask the rasters for G - the region of interest for
  projections)
- Rmarkdown for required packages;
- Rmarkdown for data preparation and spatial rarefaction;
- Rmarkdown for M selection for all the species
- R script for an example of bioclimatic variables preparations for
  kuenm analysis
  (kuenm_frogs/Boana_leptolineata/kuenm_variables_prep.R);
- Rmarkdown with the workflow for all kuenm processes (data preparation,
  calibration and evaluation of the candidate models, final models and
  post-modelling analysis)

For the directory in its current state, I ran the first two Rmarkdown
files and create the subdirectories for each species with thinned data.
Then, I’ve added the workflow for kuenm analysis only for *Boana
leptolineata* (the same workflow should be followed for the other
species).

**I strongly recommend to check the [kuenm
repository](https://github.com/marlonecobos/kuenm#references) to
understand how the kuenm package works.**

# References

Cobos ME, Peterson AT, Barve N, Osorio-Olvera L. 2019. kuenm: an R
package for detailed development of ecological niche models using
Maxent. PeerJ 7:e6281 <https://doi.org/10.7717/peerj.6281>
