#required packages

require(raster)
require(usdm)
require(rgdal)
require(viridis)
require(glue)
require(kuenm)

#kuenm - Boana leptolineata

setwd("kuenm_frogs/Boana_leptolineata")

#M shp

M_shp <- shapefile("ecor_Ms/polygon_selection.shp")

#preparation of climatic layer

#M variables from tif to asc

#First, you should save the .tif raster of current worldclim variable in a
#subfolder entitled "Current_tif

list.current<-paste("Current_tif/", 
                    list.files(path="Current_tif/"), sep="")
list.current

st.current<-stack(list.current)

names(st.current) <- c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                       "bio18", "bio19")

writeRaster(st.current, paste(names(st.current), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#The created .asc rasters should be saved in a subfolder entitled "Current"

#G shp - we will project the calibrated models to a region of interest (G)
#in our case the G is the Araucaria Forest

#Please copy all "araucaria_forest" files (available in /Data/ecoregios)
#in the "ecor_Ms" subfolder

G_shp <- shapefile("ecor_Ms/araucaria_forest.shp")

#G variables current (current variable in the G)

G_current <- mask(crop(st.current, G_shp), G_shp)

writeRaster(G_current, paste(names(G_current), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#For the next step, you should download Woldclim variables for the future
#scenarios - we selected the GCMs: FIO-ESM-2-0, HadGEM3-GC31-LL, MPI-ESM1-2-HR
#and the SSP126 and SSP585 as shared pathways for 2041-2060 and 2061-2080 scenarios

#All .tif rasters of future scenarios must be saved in a subfolder entitled
#"Clima"

#In the following steps the projections varibles for future scenarios will be
#prepared. The .asc rasters will be created in the repository, so you should
#save the files in a subfolder - for each scenario separatedly

#FIO_126_50
FIO_126_50<-stack("Clima/wc2.1_30s_bioc_FIO-ESM-2-0_ssp126_2041-2060.tif")

names(FIO_126_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                       "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                       "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

FIO_126_50<-FIO_126_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

FIO_126_50m<-mask(crop(FIO_126_50, G_shp), G_shp)

writeRaster(FIO_126_50m, paste(names(FIO_126_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T) #here I saved the files in a subfolder for "FIO_126_50

#repeat the process for all other used scenarios

#FIO_585_50

FIO_585_50<-stack("Clima/wc2.1_30s_bioc_FIO-ESM-2-0_ssp585_2041-2060.tif")

names(FIO_585_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

FIO_585_50<-FIO_585_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

FIO_585_50m<-mask(crop(FIO_585_50, G_shp), G_shp)

writeRaster(FIO_585_50m, paste(names(FIO_585_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#Had_126_50

Had_126_50<-stack("Clima/wc2.1_30s_bioc_HadGEM3-GC31-LL_ssp126_2041-2060.tif")

names(Had_126_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

Had_126_50<-Had_126_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

Had_126_50m<-mask(crop(Had_126_50, G_shp), G_shp)

writeRaster(Had_126_50m, paste(names(Had_126_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#Had_585_50

Had_585_50<-stack("Clima/wc2.1_30s_bioc_HadGEM3-GC31-LL_ssp585_2041-2060.tif")

names(Had_585_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

Had_585_50<-Had_585_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

Had_585_50m<-mask(crop(Had_585_50, G_shp), G_shp)

writeRaster(Had_585_50m, paste(names(Had_585_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#MPI_126_50

MPI_126_50<-stack("Clima/wc2.1_30s_bioc_MPI-ESM1-2-HR_ssp126_2041-2060.tif")

names(MPI_126_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

MPI_126_50<-MPI_126_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

MPI_126_50m<-mask(crop(MPI_126_50, G_shp), G_shp)

writeRaster(MPI_126_50m, paste(names(MPI_126_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#MPI_585_50

MPI_585_50<-stack("Clima/wc2.1_30s_bioc_MPI-ESM1-2-HR_ssp585_2041-2060.tif")

names(MPI_585_50)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

MPI_585_50<-MPI_585_50[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

MPI_585_50m<-mask(crop(MPI_585_50, G_shp), G_shp)

writeRaster(MPI_585_50m, paste(names(MPI_585_50m), ".asc", sep=""), bylayer=T, 
            overwrite=T)


#proj 70

#proj

#FIO_126_70
FIO_126_70<-stack("Clima/wc2.1_30s_bioc_FIO-ESM-2-0_ssp126_2061-2080.tif")

names(FIO_126_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

FIO_126_70<-FIO_126_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

FIO_126_70m<-mask(crop(FIO_126_70, G_shp), G_shp)

writeRaster(FIO_126_70m, paste(names(FIO_126_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#FIO_585_70

FIO_585_70<-stack("Clima/wc2.1_30s_bioc_FIO-ESM-2-0_ssp585_2061-2080.tif")

names(FIO_585_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

FIO_585_70<-FIO_585_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

FIO_585_70m<-mask(crop(FIO_585_70, G_shp), G_shp)

writeRaster(FIO_585_70m, paste(names(FIO_585_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#Had_126_70

Had_126_70<-stack("Clima/wc2.1_30s_bioc_HadGEM3-GC31-LL_ssp126_2061-2080.tif")

names(Had_126_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

Had_126_70<-Had_126_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

Had_126_70m<-mask(crop(Had_126_70, G_shp), G_shp)

writeRaster(Had_126_70m, paste(names(Had_126_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#Had_585_70

Had_585_70<-stack("Clima/wc2.1_30s_bioc_HadGEM3-GC31-LL_ssp585_2061-2080.tif")

names(Had_585_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

Had_585_70<-Had_585_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

Had_585_70m<-mask(crop(Had_585_70, G_shp), G_shp)

writeRaster(Had_585_70m, paste(names(Had_585_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#MPI_126_70

MPI_126_70<-stack("Clima/wc2.1_30s_bioc_MPI-ESM1-2-HR_ssp126_2061-2080.tif")

names(MPI_126_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

MPI_126_70<-MPI_126_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

MPI_126_70m<-mask(crop(MPI_126_70, G_shp), G_shp)

writeRaster(MPI_126_70m, paste(names(MPI_126_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)

#MPI_585_70

MPI_585_70<-stack("Clima/wc2.1_30s_bioc_MPI-ESM1-2-HR_ssp585_2061-2080.tif")

names(MPI_585_70)<-c("bio01", "bio02", "bio03", "bio04", "bio05", "bio06",
                     "bio07", "bio08", "bio09", "bio10", "bio11", "bio12",
                     "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

MPI_585_70<-MPI_585_70[[c("bio01", "bio02", "bio05", "bio07", "bio12", "bio15", 
                          "bio18", "bio19")]]

MPI_585_70m<-mask(crop(MPI_585_70, G_shp), G_shp)

writeRaster(MPI_585_70m, paste(names(MPI_585_70m), ".asc", sep=""), bylayer=T, 
            overwrite=T)