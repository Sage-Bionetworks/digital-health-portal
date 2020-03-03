########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Projects
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to all the following
# mhealth projects
## Not considering gravity as a sensor, as it is a derived measures


### Ideas-needed:
## How do we distingush between kinetic tremor and rest tremor at the project level?
# Do we have a task annotation? for eg., like hand in lap, hand at shoulder, finger to nose etc.,
## How do we mention manufacturer for wearables/phones?
# How do we represent fitbit/Nonin/Apple watch etc., iOS vs Android?
# Because if we just say PPG, fitbit also has some sleep quality measures which
# are derived by their own proprietary algorithms, which people might want to use
# as endpoint measures. 
## How do we distinguish between different types of surveys?
# For eg., in Asthma Health public researcher portal we have different types of surveys
# like Asthma history, medication history etc., How do we distinguish between these as
# we do for say kinetic and rest tremor via Assay?


### To-Dos:
## Keep the Excel sheet of all metadata possibilities for each metadata type
# For eg., sensor - accelerometer, PPG, gyroscope, camera, touchscreen etc.,

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
  
  ## mPower 1.0 (check anno - Larsson)
  'syn4993293' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                        'touchscreen', 'microphone'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('parkinsons', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  ## MoleMapper Public Researcher Portal (check anno - Dan)
  'syn5576734' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  ## Asthma Health Public Researcher Portal (check anno - Larsson)
  'syn8361748' = list('Data collection method' = c('survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('touchscreen'),
                      'Device location' = c('hand'),
                      'Diagnosis' = c('asthma', 'control'),
                      'Assay' = c('')),
  
  ## elevateMS (check anno - Abhi)
  'syn9746170' = list('Data collection method' = c('active', 'passive', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                        'touchscreen'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('multiple sclerosis', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'visual/digit symbol substitution task(vsst/dsst)')),
  
  ## Parkinsons Disease Digital Biomarker DREAM Challenge (check anno - Solly)
  'syn8717496' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('parkinsons', 'control'),
                      'Assay' = c('tremor', 'walking', 'dyskinesia','bradykinesia')),
  
  ## CRF Module (check anno - Dan/Megha)
  'syn10837149' = list('Data collection method' = c('active', 'survey'),
                       'Device type' = c('phone', 'wearable'),
                       'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                         'camera', 'gps', 'fitbit', 'nonin'),
                       'Device location' = c('hand'),
                       'Diagnosis' = c('control'),
                       'Assay' = c('heartrate', 'walking')),
  
  ## MyHeart Counts Public Researcher Portal (check anno - Larsson)
  'syn11269541' = list('Data collection method' = c('active', 'survey'),
                       'Device type' = c('phone'),
                       'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer'),
                       'Device location' = c('pocket', 'wrist'),
                       'Diagnosis' = c('control'),
                       'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  ## PKU Study Project (check anno - Dan/Megha)
  'syn20486872' = list('Data collection method' = c('active', 'passive', 'survey'),
                       'Device type' = c('phone', 'wearable'),
                       'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                         'fitbit'),
                       'Device location' = c('pocket', 'wrist'),
                       'Diagnosis' = c('phenylketonuria', 'control'),
                       'Assay' = c('tremor', 'tap', 'sleep', 'heartrate')),
  
  ## MJFF Levodopa Response Study (check anno - solly)
  'syn20681023' = list('Data collection method' = c('active', 'survey'),
                       'Device type' = c('wearable'),
                       'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                         'pebble','GeneAcvtiv'),
                       'Device location' = c('wrist'),
                       'Diagnosis' = c('parkinsons', 'control'),
                       'Assay' = c('tremor', 'bradykinesia','dyskinesia')))

##############
# Update Annotations in Synapse
##############  
# Download digital health view table
digital.health.view.id <- 'syn21585666'
digital.health.view.syn <- synTableQuery(paste('select * from', digital.health.view.id))
digital.health.view <- digital.health.view.syn$asDataFrame()

# Get list of projects from table
projects.list <- digital.health.view$projectId %>% 
  unique()

# Update annotations
for(proj.id in projects.list){
  proj.syn <- synGet(proj.id)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = projects.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(projects.annotations[[proj.id]])
}