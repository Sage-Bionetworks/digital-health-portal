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

study = 'Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge'
projectlink = paste("[", study, "](/Explore/Collections/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")


##############
# List of tables and related annotations
##############
tables.annotations = list(
  # mPower Walking Activity (PDDB Training Data)
  'syn10146553' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(2864), 
                      dataCollectionMethod= c('active'),
                      deviceType = c('handheld'),
                      sensorType = c('accelerometer', 'gyroscope'),
                      devicePlatform = c('iOS'), 
                      deviceLocation = c('hand', 'pocket'),
                      diagnosis= c("Parkinson's disease", 'control'),
                      reportedOutcome = c('medication report'),
                      digitalAssessmentCategory= c('gait'),
                      digitalAssessmentDetails = c('walking (flat)', 'standing'),
                      dataType=c('sensor', 'surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8717496/wiki/448355',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  # mPower Demographics (PDDB Training Data)
  'syn10146552' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(2864), 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= c("Parkinson's disease", 'control'), 
                      reportedOutcome = c('demographics survey'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw', 'metadata'),
                      metadataType= c('individual'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn8717496/wiki/448355',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  ## MJFF L-Dopa (PDDB Training Data)
  'syn10495809' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(19), 
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('resting tremor',
                                                    'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       dataType=c('clinical', 'sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType=c('sensor','experiment', 'assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/448356',
                       dataAccessInstructions = 'syn20681023/wiki/594679'),
  
  ## MJFF L-Dopa (PDDB Testing Data with Scores)
  'syn10518012' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(19), 
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('resting tremor',
                                                    'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       dataType=c('clinical', 'sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType=c('sensor','experiment', 'assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/448356',
                       dataAccessInstructions = 'syn20681023/wiki/594679'),

  
  ## MJFF L-Dopa (PDDB Testing Data without Scores)
  'syn10701954' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(19), 
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('resting tremor',
                                                    'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType=c('sensor','experiment', 'assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/448356',
                       dataAccessInstructions = 'syn20681023/wiki/594679'),
  
  ## PDDB_SC1_mPower_IndividualFeatureScores.csv
  'syn23019064' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c("Parkinson's disease", 'control'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'case vs control',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),  
  
  ## PDDB_SC2.1_Tremor_IndividualFeatureScores.csv
  'syn22962839' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),
  
  ## 	PDDB_SC2.3_Bradykinesia_IndividualFeatureScores.csv
  'syn23016780' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper',
                                                    'folding towels'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),

    
  ## 	PDDB_SC2.2_Dyskinesia_IndividualFeatureScores.csv
  'syn23016590' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('resting tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements'),
                       dataType=c('analysis'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),
  
  
  ## PDDB Subchallenge 1 Results
  'syn11445596' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c("Parkinson's disease", 'control'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('analysis', 'sensor'),
                       dataSubtype=c('processed'), 
                       analysisType = 'case vs control',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),  

  
  ## PDDB Subchallenge 2.1 (Tremor) Results
  'syn11559815' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       dataType=c('analysis', 'sensor'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),
  
  ## 	PDDB Subchallenge 2.3 (Bradykinesia) Results
  'syn11559823' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements', 
                                                    'opening a water bottle and pouring', 
                                                    'arranging paper',
                                                    'folding towels'),
                       dataType=c('analysis', 'sensor'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884'),
  
  
  ## 	PDDB Subchallenge 2.2 (Dyskinesia) Results
  'syn11559820' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       dataCollectionMethod= c('active', 'clinical assessment'),
                       deviceType = c('wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('GENEActiv', 'Pebble OS'), 
                       deviceLocation = c('wrist'),
                       diagnosis= "Parkinson's disease", 
                       digitalAssessmentCategory= c('resting tremor'),
                       digitalAssessmentDetails = c('finger-to-nose',  
                                                    'alternating hand movements'),
                       dataType=c('analysis', 'sensor'),
                       dataSubtype=c('processed'), 
                       analysisType = 'symptom severity',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn8717496/wiki/422884')
  
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


