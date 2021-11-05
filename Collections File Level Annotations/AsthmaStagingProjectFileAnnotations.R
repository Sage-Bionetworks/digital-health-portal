########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Asthma Staging Project (Asthma Health HealthKit Public data release)
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn23560210
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'Asthma Staging Project'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # HealthKit Data
  'syn23584969' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1907), 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'pedometer', 'gps'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket', 'wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       # digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('raw','processed', 'metadata'),
                       metadataType= c('individual', 'assessment'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  # HealthKit Sleep
  'syn23567895' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(187), 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'wrist'),
                       diagnosis= c('control'),  
                       digitalAssessmentCategory= c('sleep'),
                       # digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  # HealthKit Workout
  'syn23567943' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(89), 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'pedometer', 'gps'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket', 'wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       # digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'FALSEs',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = '')
)

#################
# Now set annotations
#################
projects.list =  names(tables.annotations)
for(proj.id in projects.list){
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}

##################
# Set annotations of individual files
##################
## There are NO INDIVIDUAL FILES in this study