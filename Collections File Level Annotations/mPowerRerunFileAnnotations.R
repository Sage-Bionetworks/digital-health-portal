########################################################
#' This file is used for annotating mPowerRerun project
#' with the required annotations used for the
#' the dHealth portal
#' @author: aryton.tediarjo@sagebase.org
########################################################

###################
# Required libraries
####################
library(plyr)
library(tidyverse)
library(synapser)
library(glue)

synLogin()

############################
# Global Variables
############################
STUDY <- 'mPower - Features, model and analysis for Omberg et al (2021)'
URL <- URLencode(STUDY,  reserved = FALSE, repeated = FALSE)
PROJECT_ID <- 'syn23277418'
FILE_VIEW_ID <- "syn23545224"
PROJECT_LINK <- glue::glue("[{STUDY}](/Explore/Studies/DetailsPage?study={URL})")
INDEX <- 'TRUE'

############################
# Tables for dHealth
############################

#' all resource used for the mPower rerun project
#' which will index all data used for analysis
#' both for the 6 months and the public data
tables.annotations <- list(
    "syn23545224" = list(consortium = 'mHealth',
                         study = STUDY,
                         studyOrProject = PROJECT_LINK,
                         dataCollectionMethod= c('active'),
                         deviceType = c('handheld'),
                         sensorType = c('accelerometer', 'gyroscope', 'magnetometer', "microphone"),
                         devicePlatform = c('iOS'), 
                         deviceLocation = c('hand', 'pocket', "flat surface"),
                         diagnosis= c("Parkinson's Disease", 'control'),
                         reportedOutcome = c('medication report'),
                         digitalAssessmentCategory= c('gait', 
                                                      'phonation',
                                                      'motor coordination'),
                         digitalAssessmentDetails = c('walking (flat)', 
                                                      'standing', 
                                                      'phonation',
                                                      'tapping'),
                         dataType=c('sensor'),
                         dataSubtype=c('raw', 'processed'),
                         metadataType= c('assessment'),
                         dhPortalIndex = INDEX,
                         dataDescriptionLocation = 'syn23277418/wiki/607307',
                         dataAccessInstructions = 'syn23277418/wiki/607032')
)

#' store synapse annotation for the table
tables.list <- names(tables.annotations) %>% 
    purrr::map(., function(synId){
        synSetAnnotations(synId, annotations = tables.annotations[[synId]])
    }
)

########################################################
#' Set annotations of individual files
#' Note: Instead of annotating each files by using 
#' individual synapseIDs (too many repetitive input),
#' I will be annotating each files by querying
#' preexisting annotations used for interacting
#' with the mPower pipeline
#######################################################
resource <- synTableQuery(
    glue::glue("SELECT * FROM {FILE_VIEW_ID}"))$asDataFrame()

resource_public <- resource %>% 
    dplyr::filter(userSubset == 'public data')

# Index only the Figures from the 6 months study on the dHealth portal
resource_months <- resource %>% 
    dplyr::filter(userSubset == '6 months study') %>% 
    dplyr::filter(pipelineStep == "figures")

resource <- resource_public %>% 
    dplyr::full_join(resource_months)

################################################
# Sensor Features
################################################
feature_annot_list <- list(
    "tapping" = list(consortium = 'mHealth',
                     study = STUDY,
                     studyOrProject = PROJECT_LINK,
                     dataCollectionMethod= c('active'),
                     deviceType = c('handheld'),
                     sensorType = c('touchscreen'),
                     devicePlatform = c('iOS'), 
                     deviceLocation = c('flat surface'),
                     diagnosis= c("Parkinson's Disease", 'control'), 
                     reportedOutcome = c('medication report'),
                     digitalAssessmentCategory= c('motor coordination'),
                     digitalAssessmentDetails = c('tapping'),
                     dataType=c('sensor', 'surveyData'),
                     dataSubtype=c('raw','metadata'),
                     metadataType='assessment',
                     dhPortalIndex = INDEX,
                     dataDescriptionLocation = 'syn23277418/wiki/607308',
                     dataAccessInstructions = 'syn23277418/wiki/607032'),
    "walking" = list(consortium = 'mHealth',
                     study = STUDY,
                     studyOrProject = PROJECT_LINK,
                     dataCollectionMethod= c('active'),
                     deviceType = c('handheld'),
                     sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                     devicePlatform = c('iOS'), 
                     deviceLocation = c('pocket'),
                     diagnosis= c("Parkinson's Disease", 'control'),
                     reportedOutcome = c('medication report'),
                     digitalAssessmentCategory= c('gait'),
                     digitalAssessmentDetails = c('walking (flat)'),
                     dataType=c('sensor', 'surveyData'),
                     dataSubtype=c('raw', 'metadata'),
                     metadataType= c('assessment'),
                     dhPortalIndex = INDEX,
                     dataDescriptionLocation = 'syn23277418/wiki/607308',
                     dataAccessInstructions = 'syn23277418/wiki/607032'),
    "voice" = list(consortium = 'mHealth',
                   study = STUDY,
                   studyOrProject = PROJECT_LINK,
                   dataCollectionMethod= c('active'),
                   deviceType = c('handheld'),
                   sensorType = c('microphone'),
                   devicePlatform = c('iOS'), 
                   deviceLocation = c('flat surface', 'hand'),
                   diagnosis= c("Parkinson's Disease", 'control'), 
                   reportedOutcome = c('medication report'),
                   digitalAssessmentCategory= c('phonation'),
                   digitalAssessmentDetails = c('phonation'),
                   dataType=c('sensor', 'surveyData'),
                   metadataType='assessment',
                   dhPortalIndex = INDEX,
                   dataDescriptionLocation = 'syn23277418/wiki/607308',
                   dataAccessInstructions = 'syn23277418/wiki/607032'),
    "resting" = list(consortium = 'mHealth',
                     study = STUDY,
                     studyOrProject = PROJECT_LINK,
                     dataCollectionMethod= c('active'),
                     deviceType = c('handheld'),
                     sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                     devicePlatform = c('iOS'), 
                     deviceLocation = c('hand', 'pocket'),
                     diagnosis= c("Parkinson's Disease", 'control'),
                     reportedOutcome = c('medication report'),
                     digitalAssessmentCategory= c('gait'),
                     digitalAssessmentDetails = c('standing'),
                     dataType=c('sensor', 'surveyData'),
                     metadataType= c('assessment'),
                     dhPortalIndex = INDEX,
                     dataDescriptionLocation = 'syn23277418/wiki/607308',
                     dataAccessInstructions = 'syn23277418/wiki/607032')
)

################################################
# Filtered healthcodes
################################################
healthcode_annot_list <- list(
    "n of 1 analysis" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'),
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607307',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "case vs controls" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'),
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607307',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "identity confounding" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'),
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607307',
        dataAccessInstructions = 'syn23277418/wiki/607032')
)

################################################
# Intermediate files
################################################
intermediate_annot_list <- list(
    "n of 1 analysis" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607032',
        dataAccessInstructions = 'syn23277418/wiki/607314'),
    "repeated measurements" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607320',
        dataAccessInstructions = 'syn23277418/wiki/607032',
        analysisType = 'case vs controls',
        analysisSubtype = 'repeated measurements'),
    "collapsed measurements" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607316',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "feature variability comparison" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607322',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "identity confounding" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607317',
        dataAccessInstructions = 'syn23277418/wiki/607032',
        analysisSubtype = 'identity confounding'),
    "walking task adherence" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607318',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "combined model" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607434',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "correlation test" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607321',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "distance correlation test" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dataSubtype=c('processed'), 
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/607315',
        dataAccessInstructions = 'syn23277418/wiki/607032')
)

################################################
# Figures Annotations
################################################
figure_annot_list <- list(
    "n of 1 analysis" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/606925',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "case vs controls" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "retention analysis" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "retention analysis",
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "records per mpower tasks" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "records per mpower tasks",
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "identity confounding" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "identity confounding",
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "walking task adherence" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "walking task adherence",
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "combined model" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "combined model",
        dataDescriptionLocation = 'syn23277418/wiki/606925',
        dataAccessInstructions = 'syn23277418/wiki/607032'),
    "demographics confounders" = list(
        consortium = 'mHealth',
        study = STUDY,
        studyOrProject = PROJECT_LINK,
        deviceType = c('handheld'),
        sensorType = c('accelerometer', 
                       'gyroscope', 
                       'magnetometer', 
                       "microphone",
                       "touchscreen"),
        devicePlatform = c('iOS'), 
        dataCollectionMethod= c('active'),
        deviceLocation = c('flat surface', 'pocket'),
        diagnosis= c("Parkinson's Disease", 
                     'control'), 
        reportedOutcome = c('medication report'),
        digitalAssessmentCategory= c('gait', 
                                     'phonation',
                                     'motor coordination'),
        digitalAssessmentDetails = c('walking (flat)', 
                                     'standing', 
                                     'phonation',
                                     'tapping'),
        dataType=c('analysis'),
        dhPortalIndex = INDEX,
        analysisType = "demographics confounders",
        dataDescriptionLocation = 'syn23277418/wiki/606926',
        dataAccessInstructions = 'syn23277418/wiki/607032')
)




#' annotate raw features for both public and 6 months data
raw_features <- resource %>%
    dplyr::filter(pipelineStep == "raw")
set_raw_features_annotations <- purrr::map(names(feature_annot_list), function(activity){
    filter_data <- raw_features %>% 
        dplyr::filter(task == activity) %>%
        dplyr::select(id, userSubset, pipelineStep)
    filter_data %>% 
        split(.$id) %>%
        purrr::map(., function(tbl){
            append(list(
                "userSubset" = tbl$userSubset,
                "pipelineStep" = tbl$pipelineStep,
                "task" = activity),
                feature_annot_list[[activity]])
        })}) %>% unlist(., recursive = FALSE)

#' annotate cleaned features for both public and 6 months data
processed_features <- resource %>%
    dplyr::filter(pipelineStep == "processed")
set_processed_features_annotations <- purrr::map(names(feature_annot_list), function(activity){
    filter_data <- processed_features %>% 
        dplyr::filter(task == activity)  %>%
        dplyr::select(id, userSubset, pipelineStep)
    filter_data %>% 
        split(.$id) %>%
        purrr::map(., function(tbl){
            append(list(
                "userSubset" = tbl$userSubset,
                "pipelineStep" = tbl$pipelineStep,
                "task" = activity),
                feature_annot_list[[activity]])
        })}) %>% unlist(., recursive = FALSE)

#' annotate healthcodes for both public and 6 months data
filtered_healthcodes <- resource %>%
    dplyr::filter(pipelineStep == "healthcode subsampling")
set_filtered_healthcodes_annotations <- purrr::map(names(healthcode_annot_list), 
                                                   function(analysis){
                                                       filter_data <- filtered_healthcodes %>% 
                                                           dplyr::filter(analysisType == analysis) %>%
                                                           dplyr::select(id, userSubset, pipelineStep, analysisType)
                                                       filter_data %>% 
                                                           split(.$id) %>%
                                                           purrr::map(., function(tbl){
                                                               append(list(
                                                                   "userSubset" = tbl$userSubset,
                                                                   "pipelineStep" = tbl$pipelineStep,
                                                                   "analysisType" = tbl$analysisType),
                                                                   healthcode_annot_list[[analysis]])
                                                           })}) %>% unlist(., recursive = FALSE)

### annotate raw features for both public and 6 months data
intermediary_data <- resource %>%
    dplyr::filter(pipelineStep == "intermediary data")
set_intermediate_data_annotations <- purrr::map(names(intermediate_annot_list), 
                                                function(analysis){
                                                    if(nrow(filter_data <- intermediary_data %>% 
                                                            dplyr::filter(analysisType == analysis)) == 0){
                                                        filter_data <- intermediary_data %>% 
                                                            dplyr::filter(analysisSubtype == analysis)
                                                    }else{
                                                        filter_data <- intermediary_data %>% 
                                                            dplyr::filter(analysisType == analysis)
                                                    }
                                                    filter_data <- filter_data %>%
                                                        dplyr::select(id, userSubset, 
                                                                      pipelineStep, 
                                                                      analysisType,
                                                                      analysisSubtype)
                                                    filter_data %>% 
                                                        split(.$id) %>%
                                                        purrr::map(., function(tbl){
                                                            append(list("userSubset" = tbl$userSubset,
                                                                        "pipelineStep" = tbl$pipelineStep,
                                                                        "analysisType" = tbl$analysisType,
                                                                        "analysisSubtype" = tbl$analysisSubtype),
                                                                   intermediate_annot_list[[analysis]])
                                                        })}) %>% unlist(., recursive = FALSE)

#' annotate healthcodes for both public and 6 months data
figures <- resource %>%
    dplyr::filter(pipelineStep == "figures")
set_figure_annotations <- purrr::map(names(figure_annot_list), 
                                     function(analysis){
                                         filter_data <- figures %>% 
                                             dplyr::filter(analysisType == analysis) %>%
                                             dplyr::select(id, userSubset, 
                                                           pipelineStep, 
                                                           analysisType,
                                                           analysisSubtype)
                                         filter_data %>% 
                                             split(.$id) %>%
                                             purrr::map(., function(tbl){
                                                 append(list(
                                                     "userSubset" = tbl$userSubset,
                                                     "pipelineStep" = tbl$pipelineStep,
                                                     "analysisType" = tbl$analysisType,
                                                     "analysisSubtype" = tbl$analysisSubtype),
                                                     figure_annot_list[[analysis]])
                                             })}) %>% unlist(., recursive = FALSE)

#' Combine all files annotation into one
combined_files_annotation_list <- c(
    set_raw_features_annotations,
    set_processed_features_annotations,
    set_figure_annotations, 
    set_filtered_healthcodes_annotations,
    set_intermediate_data_annotations) 

#' store annotations into synapse
names(combined_files_annotation_list) %>% 
    purrr::map(., function(synId){
        synSetAnnotations(
            synId, annotations = combined_files_annotation_list[[synId]])
    }
)







