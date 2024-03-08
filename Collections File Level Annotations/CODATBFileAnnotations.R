########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in CODA TB Study
# Author: Solveig Sieberts
# email: sieberts@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn20681023
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# Did not include annotations for Sample Data files, as these should be excluded from the Portal
# I did add annotations to the individual files in syn20681036, however these should not be indexed
# in the Portal
#
#

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'CODA TB DREAM Challenge'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")



##############
# List of tables and related annotations
##############
tables.annotations = list(
  ## Clinical Data Main
  'syn41604915' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1105), 
                       dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataType=c('clinical'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),
  
  ## Clinical Data Extra
  'syn52357041' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1105), 
                       dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataType=c('clinical'),
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),
  
  ## Cough Metadata Solicited
  'syn41604939' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1082), 
                       dataCollectionMethod= c('sensor'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataCollectionMethod= c('active'),
                       digitalAssessmentCategory="cough",
                       digitalAssessmentDetails = c("solicited cough"),
                       deviceType = c('handheld'),
                       sensorType = 'microphone',
                       devicePlatform = c('Android'),
                       dataType=c('sensor'),
                       dataSubtype=c('metadata'),
                       metadataType = 'sensor',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),
  
  ## Cough Metadata Longitudinal
  'syn41604935' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(565), 
                       dataCollectionMethod= c('sensor'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataCollectionMethod= c('passive'),
                       digitalAssessmentCategory="cough",
                       digitalAssessmentDetails = c("natural cough"),
                       deviceType = c('handheld'),
                       sensorType = 'microphone',
                       devicePlatform = c('Android'),
                       dataType=c('sensor'),
                       dataSubtype=c('metadata'),
                       metadataType = 'sensor',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),
  
  ## Cough Solicited
  'syn41833327' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1082), 
                       dataCollectionMethod= c('sensor'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataCollectionMethod= c('active'),
                       digitalAssessmentCategory="cough",
                       digitalAssessmentDetails = c("solicited cough"),
                       deviceType = c('handheld'),
                       sensorType = 'microphone',
                       devicePlatform = c('Android'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),  
  
  ## Cough Longitudinal
  'syn41833579' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(565), 
                       dataCollectionMethod= c('sensor'),
                       diagnosis= c("tuberculosis", "control"), 
                       dataCollectionMethod= c('passive'),
                       digitalAssessmentCategory="cough",
                       digitalAssessmentDetails = c("natural cough"),
                       deviceType = c('handheld'),
                       sensorType = 'microphone',
                       devicePlatform = c('Android'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540'),

  ## Data Dictionary
  'syn41743692' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataType=c('clinical', 'sensor'),
                       dataSubtype='metadata',
                       metadataType='data dictionary',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn31472953/wiki/619711',
                       dataAccessInstructions = 'syn31472953/wiki/622540')

)

#################
# Now set annotations
#################
for(proj.id in names(tables.annotations)){

  #### Uncomment this before updating for real
  proj<-synGet(proj.id)
  proj$annotations<-tables.annotations[[proj.id]]
  proj<-synStore(proj)
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}


