# how to convert a standard R data.frame() object into a shapefile and export.

require(shapefiles)

# step 1: Read in the x,y table with a read.*() command
soils <- read.csv("")

# here we are setting the lon, lat cols and an id variable to a new3 data.frame colnames("id", "lon", "lat")
soil.dd <-cbind(1:nrow(soil),soil[,1:2])

# here we set the column names
colnames(soil.dd) <- c("id", "lon", "lat")

# now all of the columns need to be placed into another new data.frame "id" vars are used as identifiers
soil.table <- cbind(1:nrow(soil),soil)

# now lets set the colnames to match the ones created in the last data.frame() and have names for each of the other columns
colnames(soil.table)<-c("id", "lon", "lat", "variable_name", "land_area","pct_sand","pct_silt","pct_clay", "data_source", "IGBP", "continent")

# here we are going to link the 2 data.frame() objects into a new shapefile (list of lists) object.
soil.shape <- convert.to.shapefile(soil.dd, soil.table, "id", 1) # not sure what the 1 is...  I think it means points

# here we will turn that shapefile R object into an output format that is readable by ArcMap
write.shapefile(soil.shape, "/workspace/Shared/IEM/Data/Input/soil_texture/output_maps/soiltxt_igbp_panarctic_HD", arcgis=T)

# voila a new output shapefile for you to exploit!  created completely open source.