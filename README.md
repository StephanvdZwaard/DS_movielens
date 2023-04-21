# DS_movielens

 <hr>
 
 <h2> Capstone project: MovieLens  </h2>
 
  <hr>
  
### Overview 

For this project, you will be creating a movie recommendation system using the [MovieLens](https://movielens.org/) dataset. The version of movielens included in the dslabs package is just a small subset of a much larger dataset with millions of ratings. You can find the entire latest MovieLens dataset [here](https://grouplens.org/datasets/movielens/latest/). You will be creating your own recommendation system using all the tools we have shown you throughout the courses in this series. We will use the [10M version](http://grouplens.org/datasets/movielens/10m/) of the MovieLens dataset to make the computation a little easier.

You will download the MovieLens data and run code we will provide to generate your datasets.

First, there will be a short quiz on the MovieLens data. You can view this quiz as an opportunity to familiarize yourself with the data in order to prepare for your project submission.

Second, you will train a machine learning algorithm using the inputs in one subset to predict movie ratings in the final hold-out test set. Your project itself will be assessed by peer grading.

<br>

<img src="https://movielens.org/images/site/main-screen.png" width="50%" height="30%">

**MovieLens recommendation system**


<hr>
 
 <h2> Project documentation </h2>
 
<hr>

### 

The submission for the MovieLens project will be three files: a report in the form of an Rmd file, a report in the form of a PDF document knit from your Rmd file, and an R script that generates your predicted movie ratings and calculates RMSE. The R script should contain all of the code and comments for your project. Your grade for the project will be based on two factors:

- Your report and script (75%)
The RMSE returned by testing your algorithm on the final_holdout_test set (25%)

This project is part of the Capstone module in the [Data Science program from Harvard University](https://www.edx.org/professional-certificate/harvardx-data-science?index=product&queryID=61f151b59a7e48c99440992ac5425bc9&position=3&results_level=second-level-results&search_index=product&term=data+scienc&campaign=Data++Science&source=edX&product_category=professional-certificate&placement_url=https%3A%2F%2Fwww.edx.org%2Fsearch). 


 <hr>
 
 <h2> Archive </h2>
 
 <hr>
 
<h3> Main script </h3>

The main script is used to run the entire analysis used to obtain the results in this course. This script calls other subfunctions and scripts that are located within the `code` subdirectory.

 <hr>
 
 **Description**:    Creating a movie recommendation system based on the MovieLens dataset
                          
 **Authors**:        Stephan van der Zwaard [stephan_vanderzwaard@live.nl]                                                      
 **Date:**         21-04-2023                                                                                                 
 **Version:**      1.0                                                                                                        
 **R.version:**    4.2.2 (2022-10-31)                                                                                         

 <hr>      
 
<h3> RStudio project </h3>

The RStudio project that is associated with the analysis of this MovieLens project.
                                                                                                                          
<h3> data/ </h3>

The `data` subdirectory contains the processed data from MovieLens dataset.

<h3> code/ </h3>

The `code` subdirectory contains all the necessary scripts for performing the analysis. 

<h3> results/ </h3>

The `results` subdirectory contains all figures and tables associated with the analysis.

<hr>
