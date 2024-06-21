########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in mPower 1.0 Public Researcher Portal
# Author: Solly Sieberts
# email: solly.sieberts@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn4993293
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# Did not include annotations for Sample Data files, as these should be excluded from the Portal
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'Multi-Ethnic Study of Atherosclerosis (MESA) Sleep Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Actigraphy
  'syn53761793' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(2159), 
                      dataCollectionMethod= c('passive'),
                      deviceType = c('wearable'),
                      sensorType = c('accelerometer', 'photosensor'),
                      devicePlatform = c('Philips Respironics'), 
                      deviceLocation = c('wrist'),
                      diagnosis= c('control'),
#                      reportedOutcome = c('medication report'),
                      digitalAssessmentCategory= c('sleep'),
                      digitalAssessmentDetails = c('sleep scoring'),
                      dataType=c('sensor'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn53711082/wiki/626337',
                      dataAccessInstructions = 'syn53711082/wiki/626338'),

# Datasets
  'syn53761795' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(2237), 
                     dataCollectionMethod= c('passive', 'patient reported outcome',
                                             'clinical assessment'),
                     deviceType = c('wearable'),
                     sensorType = c('accelerometer', 'photosensor',
                                    'polysomnography'),
                     devicePlatform = c('Philips Respironics', 
                                        'Compumedics Ltd.'), 
                     deviceLocation = c('wrist', 'various'),
                     diagnosis= c('control'),
                     reportedOutcome = c('sleep report'),
                     digitalAssessmentCategory= c('sleep'),
                     digitalAssessmentDetails = c('sleep scoring', 'heart rate variability'),
                     dataType=c('sensor', 'clinical', 'surveyData', 'analysis'),
                     dataSubtype=c('processed', 'metadata'),
                     metadataType= c('individual', 'data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn53711082/wiki/626337',
                     dataAccessInstructions = 'syn53711082/wiki/626338'),

  # Documentation
  'syn53761796' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     numberParticipants= as.integer(2237), 
                     dataCollectionMethod= c('passive', 'patient reported outcome',
                                             'clinical assessment'),
#                     deviceType = c('wearable'),
#                     sensorType = c('accelerometer', 'photosensor',
#                                    'polysomnography'),
#                     devicePlatform = c('Philips Respironics', 
#                                        'Compumedics Ltd.'), 
#                     deviceLocation = c('wrist', 'various'),
                     diagnosis= c('control'),
#                     reportedOutcome = c('sleep report'),
                     digitalAssessmentCategory= c('sleep'),
                     digitalAssessmentDetails = c('sleep scoring', 'heart rate variability'),
                     dataType=c('sensor', 'clinical', 'surveyData', 'analysis'),
                     dataSubtype=c('metadata'),
                     metadataType= c('experiment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn53711082/wiki/626337',
                     dataAccessInstructions = 'syn53711082/wiki/626338'),

  # Forms
  'syn53761798' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     numberParticipants= as.integer(2237), 
                     dataCollectionMethod= c('passive', 'patient reported outcome',
                                             'clinical assessment'),
#                     deviceType = c('wearable'),
#                     sensorType = c('accelerometer', 'photosensor',
#                                    'polysomnography'),
#                     devicePlatform = c('Philips Respironics', 
#                                        'Compumedics Ltd.'), 
#                     deviceLocation = c('wrist', 'various'),
                     diagnosis= c('control'),
                     reportedOutcome = c('sleep report'),
                     digitalAssessmentCategory= c('sleep'),
#                     digitalAssessmentDetails = c('sleep scoring', 'heart rate variability'),
                     dataType=c('surveyData', 'clinical'),
                     dataSubtype=c('metadata'),
                     metadataType= c('assessment', 'experiment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn53711082/wiki/626337',
                     dataAccessInstructions = 'syn53711082/wiki/626338'),

  # Overlap
  'syn53761800' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(1976), 
                     dataCollectionMethod= c('passive'),
                     deviceType = c('wearable'),
                     sensorType = c('accelerometer', 'photosensor',
                                    'polysomnography'),
                     devicePlatform = c('Philips Respironics', 
                                        'Compumedics Ltd.'), 
                     deviceLocation = c('wrist', 'various'),
                     diagnosis= c('control'),
#                     reportedOutcome = c('sleep report'),
                     digitalAssessmentCategory= c('sleep'),
                     digitalAssessmentDetails = c('sleep scoring'),
                     dataType=c('sensor'),
                     dataSubtype=c('metadata'),
                     metadataType= c('sensor'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn53711082/wiki/626337',
                     dataAccessInstructions = 'syn53711082/wiki/626338'),

  # Polysomnography
  'syn53761807' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(2060), 
                     dataCollectionMethod= c('passive', 'clinical assessment'),
                     deviceType = c('wearable'),
                     sensorType = c('polysomnography'),
                     devicePlatform = c('Compumedics Ltd.'), 
                     deviceLocation = c('various'),
                     diagnosis= c('control'),
                     #                      reportedOutcome = c('medication report'),
                     digitalAssessmentCategory= c('sleep'),
                     digitalAssessmentDetails = c('sleep scoring'),
                     dataType=c('sensor'),
                     dataSubtype=c('raw', 'metadata'),
                     metadataType= c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn53711082/wiki/626337',
                     dataAccessInstructions = 'syn53711082/wiki/626338')
)
#################
# Now set annotations
#################
projects.list =  names(tables.annotations)
for(proj.id in projects.list){
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  proj<-synGet(proj.id)
  proj$annotations<-tables.annotations[[proj.id]]
  proj<-synStore(proj)
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}

