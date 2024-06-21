########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data & Results in MindKind
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

study = 'MindKind Study'
projectlink = paste("[", study, "](/Explore/Collections/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")


##############
# List of tables and related annotations
##############
files.annotations = list(
  #########
  # Engagement data
  #########  

  ## MindKind App Engagement MindKind Data README.rtf
  'syn51233385' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
#                       numberParticipants= as.integer(1945), 
#                       dataCollectionMethod= c('patient reported outcome'),
                       #                       deviceType = c(''),
                       #                       sensorType = c(''),
                       #                       devicePlatform = c('Android'), 
                       #                       deviceLocation = c(''),
                       #  diagnosis=  c("control"),  # Think about this
#                       reportedOutcome =c('demographics survey'),
                       dataType=c('surveyData'),
                       dataSubtype=c('metadata'), 
                       metadataType=c('experiment'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn26067631/wiki/621694',
                       dataAccessInstructions = 'syn26067631/wiki/621696'
  ),
  
  ## MindKind App Engagement Participant Demographics
  'syn51233082' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(1945), 
                       dataCollectionMethod= c('patient reported outcome'),
#                       deviceType = c(''),
#                       sensorType = c(''),
#                       devicePlatform = c('Android'), 
#                       deviceLocation = c(''),
                       #  diagnosis=  c("control"),  # Think about this
                       reportedOutcome =c('demographics survey'),
                       dataType=c('surveyData'),
                       dataSubtype=c('metadata'), 
                        metadataType=c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn26067631/wiki/621694',
                       dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement BaselineIN.csv
  'syn51233402' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(237), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c('control'),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement BaselineSA.csv
  'syn51233403' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(201), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement BaselineUK.csv
  'syn51233404' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(545), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement Baseline_EnvironmentAll.csv
  'syn51233393' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(1023), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('USDA Food insecurity survey',
                                        'PhenX Neighborhood Safety survey',
                                        'PhenX Neighborhood Collective Efficacy survey',
                                        'exposure to violence survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement Baseline_HabitsAll.csv
  'syn51233400' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
                      numberParticipants= as.integer(1018), 
                      dataCollectionMethod= c('patient reported outcome'),
                      #                       deviceType = c(''),
                      #                       sensorType = c(''),
                      #                       devicePlatform = c('Android'), 
                      #                       deviceLocation = c(''),
#                      diagnosis=  c("control"),  # Think about this
                      reportedOutcome =c('habits survey',
                                         'physical activity',
                                         'phone usage'),
                      dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn26067631/wiki/621694',
                      dataAccessInstructions = 'syn26067631/wiki/621696'
  ) ,

  ## MindKind App Engagement Baseline_HealthAll.csv
  'syn51233401' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(977), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('WHODAS',
                                        'PHQ-9',
                                        'GAD-7',
                                        'mental health history'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement BodyMovementDaily.csv
  'syn51233405' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(213), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'physical activity'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement BodyMovementWeekly.csv
  'syn51233406' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(125), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
#                     diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('International Physical Activity Questionnaire',
                                        'physical activity',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day7_BodyMovementDaily.csv
  'syn51233413' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(19), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('International Physical Activity Questionnaire',
                                        'physical activity',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement PositiveExperiencesDaily.csvv
  'syn51233417' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(217), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement PositiveExperiencesWeekly.csv
  'syn51233418' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(109), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Behavioural Activation for Depression Scale (BADS)',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day7_PositiveExperiencesDaily.csv
  'syn51233414' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(23), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Behavioural Activation for Depression Scale (BADS)',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement SleepDaily.csv
  'syn51233420' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(339), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'sleep report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement SleepWeekly.csv
  'syn51233421' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(167), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Insomnia Severity Index',
                                        'sleep report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day7_SleepDaily.csv
  'syn51233415' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(15), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Insomnia Severity Index',
                                        'sleep report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement SocialDaily.csv
  'syn51233424' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(389), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement SocialWeekly.csv
  'syn51233427' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(199), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('UCLA Loneliness Scale',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day7_SocialDaily.csv
  'syn51233416' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(11), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('UCLA Loneliness Scale',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day1Daily.csv
  'syn51233407' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(65), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day2Daily.csv
  'syn51233408' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(63), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day3Daily.csv
  'syn51233409' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(55), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day4Daily.csv
  'syn51233410' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(70), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day5Daily.csv
  'syn51233411' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(67), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind App Engagement FinalWeek_Day6Daily.csv
  'syn51233412' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(61), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),


  ## MindKind App Engagement WithdrawalSurvey.csv
  'syn51233429' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(2), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('assessment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),


#########
# Survey data
#########
## MindKind App Survey MindKind Data README.rtf
'syn51233433' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     numberParticipants= as.integer(1945), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
#                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('experiment'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
) ,

  ## MindKind App Survey Participant Demographics
  'syn51233084' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(1945), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                     metadataType=c('individual'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ) ,

  ## MindKind App Survey BaselineIN.csv
  'syn51233437' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(237), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey BaselineSA.csv
  'syn51233438' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(201), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey BaselineUK.csv
  'syn51233439' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(545), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey Baseline_EnvironmentAll.csv
  'syn51233434' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(1023), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('USDA Food insecurity survey',
                                        'PhenX Neighborhood Safety survey',
                                        'PhenX Neighborhood Collective Efficacy survey',
                                        'exposure to violence survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey Baseline_HabitsAll.csv
  'syn51233435' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(1018), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('habits survey',
                                        'physical activity',
                                        'phone usage'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey Baseline_HealthAll.csv
  'syn51233436' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(977), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('WHODAS',
                                        'PHQ-9',
                                        'GAD-7',
                                        'mental health history'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey BodyMovementDaily.csv
  'syn51233443' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(213), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'physical activity'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey BodyMovementWeekly.csv
  'syn51233444' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(125), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('International Physical Activity Questionnaire',
                                        'physical activity',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day7_BodyMovementDaily.csv
  'syn51233451' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(19), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('International Physical Activity Questionnaire',
                                        'physical activity',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey PositiveExperiencesDaily.csv
  'syn51233455' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(217), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey PositiveExperiencesWeekly.csv
  'syn51233456' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(109), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Behavioural Activation for Depression Scale (BADS)',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day7_PositiveExperiencesDaily.csv
  'syn51233452' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(23), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Behavioural Activation for Depression Scale (BADS)',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey SleepDaily.csv
  'syn51233463' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(339), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'sleep report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey SleepWeekly.csv
  'syn51233464' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(167), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Insomnia Severity Index',
                                        'sleep report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day7_SleepDaily.csv
  'syn51233453' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(15), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('Insomnia Severity Index',
                                        'sleep report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey SocialDaily.csv
  'syn51233465' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(389), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey SocialWeekly.csv
  'syn51233473' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(199), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('UCLA Loneliness Scale',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day7_SocialDaily.csv
  'syn51233454' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(11), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('UCLA Loneliness Scale',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day1Daily.csv
  'syn51233445' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(65), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day2Daily.csv
  'syn51233446' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(63), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day3Daily.csv
  'syn51233447' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(55), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day4Daily.csv
  'syn51233448' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(70), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day5Daily.csv
  'syn51233449' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(67), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),

  ## MindKind App Survey FinalWeek_Day6Daily.csv
  'syn51233450' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(61), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),


  ## MindKind App Survey WithdrawalSurvey.csv
  'syn51233474' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     numberParticipants= as.integer(2), 
                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694',
                     dataAccessInstructions = 'syn26067631/wiki/621698'
  ),


#########
# Survey Data Dictionaries
#########  

## MindKind Data Dictionary BaselineIN.csv
  'syn51233372' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                     metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary BaselineSA.csv
  'syn51233373' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary BaselineUK.csv
  'syn51233374' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('demographics survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary Baseline_EnvironmentAll.csv
  'syn51233369' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('USDA Food insecurity survey',
                                        'PhenX Neighborhood Safety survey',
                                        'PhenX Neighborhood Collective Efficacy survey',
                                        'exposure to violence survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary Baseline_HabitsAll.csv
  'syn51233370' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('habits survey',
                                        'physical activity',
                                        'phone usage'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary Baseline_HealthAll.csv
  'syn51233371' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('WHODAS',
                                        'PHQ-9',
                                        'GAD-7',
                                        'mental health history'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary BodyMovementDaily.csv
  'syn51233375' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'physical activity'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary BodyMovementWeekly.csv
  'syn51233376' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('International Physical Activity Questionnaire',
                                        'physical activity',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary PositiveExperiencesDaily.csvv
  'syn51233383' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary PositiveExperiencesWeekly.csv
  'syn51233384' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('Behavioural Activation for Depression Scale (BADS)',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ) ,

  ## MindKind Data Dictionary SleepDaily.csv
  'syn51238596' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'sleep report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary SleepWeekly.csv
  'syn51238597' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('Insomnia Severity Index',
                                        'sleep report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary SocialDaily.csv
  'syn51238598' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'activity report'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary SocialWeekly.csv
  'syn51238599' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('UCLA Loneliness Scale',
                                        'activity report',
                                        'PHQ-9',
                                        'GAD-7'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day1Daily.csv
  'syn51233377' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day2Daily.csv
  'syn51233378' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day3Daily.csv
  'syn51233379' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'),
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day4Daily.csv
  'syn51233380' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day5Daily.csv
  'syn51233381' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

  ## MindKind Data Dictionary FinalWeek_Day6Daily.csv
  'syn51233382' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('mood',
                                        'feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),


  ## MindKind Data Dictionary WithdrawalSurvey.csv
  'syn51238775' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('patient reported outcome'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     #  diagnosis=  c(""),  # Think about this
                     reportedOutcome =c('feedback survey'),
                     dataType=c('surveyData'),
                     dataSubtype=c('metadata'), 
                      metadataType=c('data dictionary'),
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621694'
#                     dataAccessInstructions = 'syn26067631/wiki/621696'
  ),

#####################
# Enrollment Data
#####################


  ## MindKind Enrollment MindKind_counts_consented_unconsented.csv
  'syn51225253' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
                     dataCollectionMethod= c('active'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     numberParticipants = as.integer(6739), 
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('informed consent'),
                     dataType=c('surveyData'),
                     dataSubtype=c('processed'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621695',
                     dataAccessInstructions = 'syn26067631/wiki/621697'
  ),

  ## MindKind Enrollment MindKind_enrollment_voting_choices.csv
  'syn51225260' = list(consortium = 'mHealth',
                      study = study,
                      studyOrProject = projectlink,
#                      dataCollectionMethod= c('active'),
                      #                       deviceType = c(''),
                      #                       sensorType = c(''),
                      #                       devicePlatform = c('Android'), 
                      #                       deviceLocation = c(''),
                      numberParticipants = as.integer(2175), 
                      #  diagnosis=  c("control"),  # Think about this
                      reportedOutcome =c('data governance preferences'),
                      dataType=c('surveyData'),
                      dataSubtype=c('raw'), 
                      dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn26067631/wiki/621695',
                      dataAccessInstructions = 'syn26067631/wiki/621697'
  ),

  ## MindKind Enrollment MindKind_enrollment_groupA_participantChoice_choices.csv
  'syn51225257' = list(consortium = 'mHealth',
                     study = study,
                     studyOrProject = projectlink,
#                     dataCollectionMethod= c('active'),
                     #                       deviceType = c(''),
                     #                       sensorType = c(''),
                     #                       devicePlatform = c('Android'), 
                     #                       deviceLocation = c(''),
                     numberParticipants = as.integer(902), 
                     #  diagnosis=  c("control"),  # Think about this
                     reportedOutcome =c('data governance preferences'),
                     dataType=c('surveyData'),
                     dataSubtype=c('raw'), 
                     dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn26067631/wiki/621695',
                     dataAccessInstructions = 'syn26067631/wiki/621697'
  )

)


#
# Get lists of annotations
#

annlist<-unique(unlist(lapply(files.annotations, function(x) { return(names(x))} )))
annots<-lapply(annlist, function(x, annotations=unlist(files.annotations)){
  return(unique(annotations[grepl(x, names(annotations))]))
})
names(annots)<-annlist

#################
# Now set annotations
#################

for(proj.id in names(files.annotations)){
  
  #### Uncomment this before updating for real
  #  synSetAnnotations(proj.id, annotations = files.annotations[[proj.id]])
  
  proj<-synGet(proj.id)
  proj$annotations<-files.annotations[[proj.id]]
  proj<-synStore(proj)
  ####
  
  print(proj.id)
  print(files.annotations[[proj.id]])
}
