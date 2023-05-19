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
                       dataDescriptionLocation = 'syn20825169/wiki/596118'),  
  
  ## REAL-PD Sensor Table
  'syn26427282' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('Android'), 
                       deviceLocation = c('wrist', 'pocket'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('sensor'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
                       ),
  
  ## CIS-PD Sensor Table
  'syn26427281' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(21), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('accelerometer'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('wrist'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('sensor'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  )
  
)



files.annotations = list(
  ## REAL-PD Sensor File Zip
  'syn26435216' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('Android'), 
                       deviceLocation = c('wrist', 'pocket'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('sensor'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
                      ),

  ## CIS-PD Sensor Files Zip
  'syn26435215' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(21), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('accelerometer'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('wrist'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('sensor'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
                      ),
  
  ## REAL-PD Training Labels
  'syn21292049' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c("Parkinson's disease"), 
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 

  ## REAL-PD Test Labels
  'syn21292051' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(12), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('surveyData'),
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 

  ## REAL-PD Ancillary Labels
  'syn21292053' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(10), 
                       dataCollectionMethod= c('patient reported outcome'),
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## REAL-PD Demographics
  'syn21296212' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       diagnosis=  c("Parkinson's disease"), 
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dataType=c('clinical'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## REAL-PD UPDRS Parts 1,2,4
  'syn21298920' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       dataCollectionMethod= c('clinical assessment'),
                       diagnosis=  c("Parkinson's disease"),
                       reportedOutcome =c('MDS-UPDRS'),
                       dataType=c('clinical'),
                       dataSubtype=c('processed'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ),   
  
  ## REAL-PD UPDRS Part 3
  'syn21295765' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       dataCollectionMethod= c('clinical assessment'),
                       diagnosis=  c("Parkinson's disease"),
                       reportedOutcome =c('MDS-UPDRS'),
                       dataType=c('clinical'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ),   
  
  # REAL-PD Sensor Metadata
  'syn21295825' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(22), 
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('sensor'),
                       dataSubtype=c('metadata'),
                       metadataType = 'sensor',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ),    
  
  
  
  
  
  ## CIS-PD Training Labels
  'syn21291578' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(16), 
                       dataCollectionMethod= c('patient reported outcome'),
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## CIS-PD Test Labels
  'syn21291582' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(16), 
                       dataCollectionMethod= c('patient reported outcome'),
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## CIS-PD Ancillary Labels
  'syn21291583' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(5), 
                       dataCollectionMethod= c('patient reported outcome'),
                       reportedOutcome =c('medication report', 'tremor', 'dyskinesia'),
                       diagnosis=  c("Parkinson's disease"), 
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## CIS-PD Demographics
  'syn21291808' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(21), 
                       diagnosis=  c("Parkinson's disease"), 
                       dataSubtype='metadata',
                       metadataType=c('individual'), 
                       dataType=c('clinical'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ), 
  
  ## CIS-PD UPDRS Parts 1,2,4
  'syn21298335' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(21), 
                       dataCollectionMethod= c('clinical assessment'),
                       diagnosis=  c("Parkinson's disease"),
                       reportedOutcome =c('MDS-UPDRS'),
                       dataType=c('clinical'),
                       dataSubtype=c('processed'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  ),   
  
  ## CIS-PD UPDRS Part 3
  'syn21291805' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(21), 
                       dataCollectionMethod= c('clinical assessment'),
                       diagnosis=  c("Parkinson's disease"),
                       reportedOutcome =c('MDS-UPDRS'),
                       dataType=c('clinical'),
                       dataSubtype=c('raw'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn20825169/wiki/600898',
                       dataAccessInstructions = 'syn20825169/wiki/600903'
  )
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

for(proj.id in names(files.annotations)){
  
  #### Uncomment this before updating for real
  synSetAnnotations(proj.id, annotations = files.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(files.annotations[[proj.id]])
}

