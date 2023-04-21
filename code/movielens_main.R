# ..
library(tidyverse)
library(caret)
library(naniar)
library(lubridate)
library(stringr)
library(stringi)
library(syuzhet)
library(cluster)
library(fastDummies)

# Create edx dataset and holdout test set from movielens dataset
source('./code/create_datasets.R')

# Complete quiz about edx dataset for movielens project
source('./code/quiz_movielens.R')

#predict movie ratings (RMSE)

str(edx)
summary(edx)


#Check for missing data
colSums(is.na(edx))

#Check for outliers in rating
ggplot(edx, aes(x=1,y=rating)) + geom_boxplot()

# Data pre-processing
edx_processed <- edx %>% 
                 mutate(date_rated    = as_datetime(timestamp),
                        hour_rated    = hour(date_rated),
                        daypart_rated = ifelse(hour(date_rated) < 12, 'am','pm'),
                        month_rated   = month(date_rated),
                        season_rated  = case_when(month_rated %in% c(1,2,12)  ~ 'winter',
                                                  month_rated %in% c(3,4,5)   ~ 'spring',
                                                  month_rated %in% c(6,7,8)   ~ 'summer',
                                                  month_rated %in% c(9,10,11) ~ 'autumn'),
                        year_rated    = year(date_rated),
                        year_released = as.numeric(gsub('(.*)([0-9]{4})(.*)','\\2',title)),
                        age           = year_rated - year_released) #%>%
                 #separate_rows(genres, sep = "\\|")

# Check which movies have ratings before their release date and confirm whether the release data is correct
#Checked release dates at [Search - The Numbers](https://www.the-numbers.com/) 
edx_processed %>% filter(age<0) %>% pull(title) %>% unique()
edx_processed %>% filter(age>85)%>% pull(title) %>% unique()

edx_processed <- edx_processed %>% 
                 mutate(rating_incorrect_date = ifelse(age < 0, 1, 0),
                        title_short  = stri_sub(title,1,-8), 
                        title_length = nchar(title_short)) %>%
                 group_by(userId) %>%
                 mutate(user_ratings_avg = mean(rating),
                        user_ratings_sd  = sd(rating),
                        user_ratings_n   = n()) %>%
                 ungroup() 

edx_processed <- edx_cluster


edx_genres2 <-  edx_processed %>% separate_rows(genres,sep='\\|') 
genres     <-  unique(edx_genres2$genres)

edx_genres2[1:100,] %>% arrange(desc(genres)) %>% 
                dummy_cols(select_columns = c('genres'),
                           remove_most_frequent_dummy = T,
                           remove_selected_columns = T) %>% View()
  
  
#                pivot_wider(names_from = genres, values_from = genres) 
# %>%
#                mutate_at(.vars = vars(any_of(genres)),
#                          .funs = list(~ifelse(is.na(.),0,1)))
#     
#     View()

# Exploratory data analysis (EDA)

edx_processed %>% #group_by(rating) %>% summarise(age = mean(age)) %>%
    ggplot(aes(y=age,x=rating)) + geom_point()# + scale_x_log10()

ggplot(edx_processed, aes(x=factor(positive), y=rating)) + geom_boxplot() 

ggplot(edx_cluster, aes(x=factor(cluster), y=rating)) + geom_boxplot() 

# check sentiment vs ratings.

# Feature engineering

  # Title sentiment: add sentiment based on title names
  edx_processed <- add_title_sentiment(edx_processed)
  
  # User ratings: add k-means clusters based on user ratings
  edx_cluster <- add_user_clusters(edx_processed %>% select(-contains('cluster')))

  # Seasonality
  
  # Genres
  
  # Age of movie
  
  
# Split into train and validation set
trainIndex      <- createDataPartition(edx$rating, p = .8, list=F)
data_train      <- data[trainIndex,] 
data_validation <- data[-trainIndex,]

# Set up K-fold cross-validation characteristics (commonly use 5 or 10-fold cv)
fitControl <- trainControl(method = "cv", number=10) 

# Create model using caret
lm <- train(rating ~ ., #the dot means all other features in the data_train dataframe are used as predictors 
            data = data_train %>% select(-contains('Id'),-contains('title'),-date_rated,-timestamp), 
            method = "lm",
            metric = "RMSE", #select the preferred criteria to optimize your model on
            trControl = fitControl)

