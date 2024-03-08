# ~/.virtualenvs/r-reticulate/bin/python
########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Projects
# Author: Solly Sieberts
# email: solly.sieberts@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## Projects are analyses of one or more studies. Studies are annotated in
# projectStudyLevelAnnotations.R.
## To successfully run this code, you need write permissions to all the following
# mhealth projects
## All projects have a template annotation list assigned. Any annotation classes 
# from that list can be edited/removed. 

### To-Dos(continous update):
## Keep the Excel sheet of all metadata possibilities for each metadata type
# For eg., sensor - accelerometer, PPG, gyroscope, camera, touchscreen etc.,

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
#library(githubr)
synLogin()

## Projects covered (with their studyOrProject URLs)
## Studies
mjffurl=paste('[MJFF Levodopa Response Study](/Explore/Collections/DetailsPage?study=',
              URLencode('MJFF Levodopa Response Study',  reserved = FALSE, repeated = FALSE),
              ')', sep="")

mpowerurl=paste('[mPower Mobile Parkinson Disease Study](/Explore/Collections/DetailsPage?study=',
                URLencode('mPower Mobile Parkinson Disease Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")

mpowerurlshort=paste('[mPower](/Explore/Collections/DetailsPage?study=',
                URLencode('mPower', reserved = FALSE, repeated = FALSE),
                ')', sep = "")

asthmaurl=paste('[Asthma Mobile Health Study](/Explore/Collections/DetailsPage?study=',
                URLencode('Asthma Mobile Health Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")
#elevatemsurl=paste('[elevateMS Study](/Explore/Collections/DetailsPage?study=',
#                   URLencode('elevateMS Study', reserved = FALSE, repeated = FALSE),
#                   ')', sep = "")
#myhearturl=paste('[MyHeart Counts Cardiovascular Health Study](/Explore/Collections/DetailsPage?study=',
#                 URLencode('MyHeart Counts Cardiovascular Health Study', reserved = FALSE, repeated = FALSE),
#                 ')', sep = "")
#brightenurl=paste('[Brighten Study](/Explore/Collections/DetailsPage?study=',
#                  URLencode('Brighten Study', reserved = FALSE, repeated = FALSE),
#                  ')', sep = "")
#sleepurl=paste('[SleepHealth](/Explore/Collections/DetailsPage?study=',
#               URLencode('SleepHealth', reserved = FALSE, repeated = FALSE),
#               ')', sep = "")


elevatemsurl=paste('[elevateMS](/Explore/Collections/DetailsPage?study=',
                   URLencode('ElevateMS', reserved = FALSE, repeated = FALSE),
                   ')', sep = "")
myhearturl=paste('[MyHeart Counts](/Explore/Collections/DetailsPage?study=',
                 URLencode('MyHeart Counts', reserved = FALSE, repeated = FALSE),
                 ')', sep = "")
brightenurl=paste('[Brighten](/Explore/Collections/DetailsPage?study=',
                  URLencode('Brighten', reserved = FALSE, repeated = FALSE),
                  ')', sep = "")
sleepurl=paste('[SleepHealth](/Explore/Collections/DetailsPage?study=',
               URLencode('SleepHealth', reserved = FALSE, repeated = FALSE),
               ')', sep = "")

# mPower, elevateMS, MyHeart Counts, Brighten and SleepHealth links shortened here for the purposes of keeping
# list of links less than 500 characters



molemapperurl = paste('[Mole Mapper Study](/Explore/Collections/DetailsPage?study=',
                      URLencode('Mole Mapper Study', reserved = FALSE, repeated = FALSE),
                      ')', sep = "")

heartsnapshoturl = paste('[Heart Snapshot Study](/Explore/Collections/DetailsPage?study=',
                         URLencode('Heart Snapshot Study', reserved = FALSE, repeated = FALSE),
                         ')', sep = "")

mindkindurl = paste('[MindKind Study](/Explore/Collections/DetailsPage?study=',
                         URLencode('MindKind Study', reserved = FALSE, repeated = FALSE),
                         ')', sep = "")

mesaurl = paste("[Multi-Ethnic Study of Atherosclerosis (MESA) Sleep Study](/Explore/Collections/DetailsPage?study=",
                URLencode('Multi-Ethnic Study of Atherosclerosis (MESA) Sleep Study',  reserved = FALSE, repeated = FALSE), 
                ")", sep = "")

mesashorturl = paste("[MESA Sleep Study](/Explore/Collections/DetailsPage?study=",
                URLencode('MESA Sleep Study',  reserved = FALSE, repeated = FALSE), 
                ")", sep = "")

## Projects
participantretentionurl = paste('[Participant Retention in Digital Health Studies](/Explore/Collections/DetailsPage?study=',
                                URLencode('Participant Retention in Digital Health Studies', reserved = FALSE, repeated = FALSE),
                                ')', sep = "")

pddbdreamurl = paste('[Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge](/Explore/Collections/DetailsPage?study=',
                     URLencode('Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge', reserved = FALSE, repeated = FALSE),
                     ')', sep = "")


beatpddreamurl = paste('[BEAT-PD DREAM Challenge](/Explore/Collections/DetailsPage?study=',
                       URLencode('BEAT-PD DREAM Challenge', reserved = FALSE, repeated = FALSE),
                       ')', sep = "")

codatburl = paste('[CODA TB DREAM Challenge](/Explore/Collections/DetailsPage?study=',
                       URLencode('CODA TB DREAM Challenge', reserved = FALSE, repeated = FALSE),
                       ')', sep = "")


##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
# ## Parkinsons Disease Digital Biomarker DREAM Challenge 
'syn8717496' = list(consortium = 'mHealth',
                    collectionType = 'Challenge',
                    study = 'Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge',
                    dataCollectionMethod= c('active', 'patient reported outcome', 'clinical assessment'),
                    deviceType = c('handheld', 'wearable'),
                    sensorType = c('accelerometer', 'gyroscope'),
                    devicePlatform = c('GENEActiv', 'Pebble OS', 'iOS'),
                    deviceLocation = c('wrist', 'pocket'),
                    diagnosis=  c("Parkinson's disease", "control"),
                    reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia',
                                      'medication report'),
                    digitalAssessmentCategory= c('resting tremor', 'action tremor', 'gait'),
                    digitalAssessmentDetails = c('walking (flat)',
                                                 'standing', 'alternating hand movements',
                                                 'opening a water bottle and pouring',
                                                 'arranging paper','assembling nuts and bolts',
                                                 'folding towels'),
                    # investigator= '',
                    resourceType = c('analysis', 'challenge'),
                    keywords = c('neurodegeneration', 'neurology', "Parkinson's", 'DREAM Challenge'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn22017473',
#                    dataUsed = c('syn20681023', 'syn4993293'),
                    #MJFF l-dopa & mPower
                    dataUsed = c(mjffurl, mpowerurl),
                    studyDescription = "The Parkinson’s Disease Digital Biomarker DREAM Challenge was a first of its kind challenge, designed to benchmark methods for the processing of sensor data for development of digital signatures reflective of Parkinson's Disease.",
                    # dataAccessInstructions = '',
                    isDHProject='TRUE'),

## Participant Retention in Digital Health Studies
'syn20715364' = list(consortium = 'mHealth',
                     collectionType = 'Analysis',
                    study = 'Participant Retention in Digital Health Studies',
                    dataCollectionMethod= c('active', 'passive', 'patient reported outcome'),
                    deviceType = c('handheld'),
                    # sensorType = '',
                    devicePlatform = c('iOS', 'Android'),
                    # deviceLocation = '',
                    diagnosis=  c('depression', 'endometriosis', 'multiple sclerosis', "Parkinson's disease", 'sleep related disorder', "control"),
                    # reportedOutcome ='',
                    digitalAssessmentCategory= c('participant engagement'),
                    # digitalAssessmentDetails = c(''),
                    investigator= 'Sage Bionetworks',
                    resourceType = c('analysis'),
                    keywords = c('participant engagement', 'remote studies'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn22123360',
                    #dataUsed = c('syn4993293', 'syn8361748', 'syn21140362', 'syn11269541', 'syn10848316', 'syn18492837'),
                    # syn21140362 = unknown
                    dataUsed = c(mpowerurlshort, asthmaurl, elevatemsurl, myhearturl, brightenurl, sleepurl,
                                 '[Phendo](http://citizenendo.org/phendo/)', '[START](https://www.goodrx.com/)'
                    ),
#                    externalDataUsed = c('[Phendo](http://citizenendo.org/phendo/)', '[START](https://www.goodrx.com/)'),
                    studyDescription = "Analysis of participant engagement from 8 remote, app-based studies including more than 100,000 participants.",
                    dataAccessInstructions = 'syn20715364/wiki/596144',
                    isDHProject='TRUE'),

## BEAT-PD DREAM Challenge
'syn20825169' = list(consortium = 'mHealth',
                    collectionType = 'Challenge',
                    study = 'BEAT-PD DREAM Challenge',
                    dataCollectionMethod= c('passive', 'patient reported outcome'),
                    deviceType = c('handheld', 'wearable'),
                    sensorType = c('accelerometer', 'gyroscope'),
                    devicePlatform = c('Android', 'iOS'),
                    deviceLocation = c('wrist', 'pocket'),
                    diagnosis=  c("Parkinson's disease"),
                    reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia',
                                       'medication report'),
                    # investigator= '',
                    resourceType = c('analysis', 'challenge'),
                    keywords = c('neurodegeneration', 'neurology', "Parkinson's", 'DREAM Challenge'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn20825169/wiki/596118',
#                    dataUsed = c(),
                    studyDescription = "The Biomarker & Endpoints to Track Parkinson's Disease (BEAT-PD) DREAM Challenge was a first of its kind challenge, designed to assess whether passively collected mobile sensor data could be used to predict Parkinson's Disease symptom severity.",
                    dataAccessInstructions = 'syn20825169/wiki/600903',
                    sensorDataType = 'raw',
                    studyDataDescriptionLocation = 'syn20825169/wiki/600898',
                    numberParticipants=as.integer(43),
                    isDHProject='TRUE'),

  ## mPower Study (Rerun Analysis)
  'syn23277418' = list(consortium = 'mHealth',
                     collectionType = 'Analysis',
                     numberParticipants=as.integer(960),
                     dataUsed = c(mpowerurl),
                     study = 'mPower - Features, model and analysis for Omberg et al (2021)',
                     dataCollectionMethod= c('active',
                                             'patient reported outcome',
                                             'clinical assessment'),
                     deviceType = c('handheld'),
                     sensorType = c('touchscreen', 'accelerometer', 'microphone',
                                    'gyroscope', 'magnetometer'),
                     devicePlatform = c('iOS'),
                     deviceLocation = c('hand', 'pocket', 'flat surface'),
                     diagnosis=  c("Parkinson's Disease", 'control'),
                     reportedOutcome = c('medication report', 'PDQ-8', 'MDS-UPDRS',
                                         'demographics survey'),
                     digitalAssessmentCategory= c('phonation', 'gait',
                                                  'motor coordination',
                                                  'cognition'),
                     digitalAssessmentDetails = c('walking (flat)', 'standing',
                                                  'phonation', 'tapping'),
                     sensorDataType = c('processed'),
                     investigator= c('Sage Bionetworks'),
                     resourceType='analysis',
                     isDHProject = 'TRUE',
                     keywords = c('neurodegeneration', 'neurology', "Parkinson's"),
                     dhPortalIndex = 'TRUE', # Change after filling annotations
                     studyDescriptionLocation = 'syn23277418',
                     studyDataDescriptionLocation = 'syn23277418/wiki/607307',
                     studyDescription = 'This project represents the outputs and intermediate results of the analysis presented in mPower Nature Biotech Submission.',
                     dataAccessInstructions = 'syn23277418/wiki/607032'),


## CODA DREAM Challenge 
'syn31472953' = list(consortium = 'mHealth',
                     collectionType = 'Challenge',
                     study = 'CODA TB DREAM Challenge',
                     dataCollectionMethod= c('active', 'passive', 'clinical assessment'),
                     deviceType = c('handheld'),
                     sensorType = c('microphone'),
                     devicePlatform = c('Android'), 
#                     deviceLocation = c('wrist', 'pocket'),
                     diagnosis=  c("tuberculosis", "control"), 
                     investigator= c('CODA TB Consortium', 'R2D2 Network'),
                     resourceType = c('analysis', 'challenge', 'curatedData'),
                    sensorDataType = 'raw',
                    studyDataDescriptionLocation = 'syn31472953/wiki/619711',
                    digitalAssessmentCategory = 'cough',
                    digitalAssessmentDetails = c("solicited cough", "natural cough"),
                    numberParticipants=as.integer(1105),
                     keywords = c('tuberculosis', 'TB', 'infectious disease', 'cough', 'DREAM Challenge'),
                     dhPortalIndex = 'TRUE', # Change after filling annotations
                     studyDescriptionLocation = 'syn31472953/wiki/617828', 
                     #                    dataUsed = c(),
                     studyDescription = "The COugh Diagnostic Algorithm for Tuberculosis (CODA TB) DREAM Challenge was a first of its kind challenge, designed to assess whether cough audio recordings could be used as a diagnostic for tuberculosis.",
                     dataAccessInstructions = 'syn31472953/wiki/622540',
                     isDHProject='TRUE')

)



##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations

for(proj.id in names(projects.annotations)){
  
    #### Uncomment this before updating for real
#    synSetAnnotations(projects, annotations = projects.annotations[[projects]])
  proj<-synGet(proj.id)
  proj$annotations<-projects.annotations[[proj.id]]
  proj<-synStore(proj)
    ####
    
    print(proj.id)
    print(projects.annotations[[proj.id]])
}

