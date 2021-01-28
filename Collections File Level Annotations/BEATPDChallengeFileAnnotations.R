########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data & Results in PDDB Challenge
# Author: Solveig Sieberts
# email: sieberts@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn8717496
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
#
#

##############
# Required libraries
##############
#library(plyr)
#library(tidyverse)
library(synapser)
synLogin()

study = 'BEAT-PD DREAM Challenge'
projectlink = paste("[", study, "](/Explore/Collections/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")


##############
# List of tables and related annotations
##############
tables.annotations = list(
  ## BEAT-PD SC1 (on-off medication) Results
  'syn22153783' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('passive', 'patient reported outcome'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('Android', 'iOS'), 
                       deviceLocation = c('wrist', 'pocket'),
                       diagnosis=  c("Parkinson's disease"), 
                       reportedOutcome =c('medication report'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/596118'),  
  
  ## BEAT PD SC2 (Dyskinesia) Results
  'syn22153785' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('passive', 'patient reported outcome'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('Android', 'iOS'), 
                       deviceLocation = c('wrist', 'pocket'),
                       diagnosis=  c("Parkinson's disease"), 
                       reportedOutcome =c('dyskinesia'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/596118'),  

  
  ## BEAT PD SC3 (Tremor) Results
  'syn22153788' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('passive', 'patient reported outcome'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('Android', 'iOS'), 
                       deviceLocation = c('wrist', 'pocket'),
                       diagnosis=  c("Parkinson's disease"), 
                       reportedOutcome =c('tremor'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/596118')  
  
  
)

#################
# Now set annotations
#################
for(proj.id in names(tables.annotations)){

  #### Uncomment this before updating for real
   synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}


