########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in PKU Study
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to <<syn20486872>>
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
## HAVENT filled in table synIDs are there are many versions of tables and we might re-curate them

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  ## Demographics
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## DailyActivitySummary.activities
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Sleep.sleep
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## RestingKineticTremor
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## HeartRate.activities-heart
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## DailyActivitySummary.summary
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart-intraday
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Sleep.summary
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Sleep Check-In
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Daily Check-In
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Default Health Data Record Table
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Tapping
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## biomarin-pku-study-status
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
            dataDescriptionLocation = '',
            dataAccessInstructions = ''),
  
  ## Health Data Summary Table
  '' = list(consortium = 'mHealth',
            study = 'PKU study',
            numberParticipants= '', 
            dataCollectionMethod= c(''),
            deviceType = c(''),
            sensorType = '',
            devicePlatform = c(''), 
            deviceLocation = c(''),
            diagnosis=  c('phenylketonuria', 'control'), 
            digitalAssessmentCategory= c(''),
            digitalAssessmentDetails = c(''),
            dataType=c(''),
            dataSubtype=c(''),
            metadataType='',
            dhPortalIndex = 'TRUE',
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
# Should we include the following?
# - Clinops table
# - Identifiers table (link b/w healthCode, externalId, blockId)
# - Features?