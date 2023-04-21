# Examine quiz questions for MovieLens project

# ---- Quiz Movielens -----

# Q1. How many rows and columns are there in the edx dataset?
print('Q1:')
nrow(edx) %>% print()
ncol(edx) %>% print()

# Q2. How many zeros or threes were given as ratings in the edx dataset?
print('Q2:')
edx %>% filter(rating==0) %>% nrow() %>% print()
edx %>% filter(rating==3) %>% nrow() %>% print()

# Q3. How many different movies are in the edx dataset?
print('Q3:')
unique(edx$movieId) %>% length() %>% print()

# Q4. How many different users are in the edx dataset?
print('Q4:')
unique(edx$userId) %>% length() %>% print()

# Q5. How many movie ratings are in each of the following genres in the edx dataset?
print('Q5:')
edx %>% filter(str_detect(genres,'Drama')) %>% nrow() %>% print()
edx %>% filter(str_detect(genres,'Comedy')) %>% nrow() %>% print()
edx %>% filter(str_detect(genres,'Thriller')) %>% nrow() %>% print()
edx %>% filter(str_detect(genres,'Romance')) %>% nrow() %>% print()

# Q6. Which movie has the greatest number of ratings?
print('Q6:')
edx %>% group_by(movieId,title) %>% summarise(n=n()) %>% arrange(desc(n)) %>% top_n(3) %>% print()

# Q7. What are the five most given ratings in order from most to least?
print('Q7:')
edx %>% group_by(rating) %>% summarise(n=n()) %>% arrange(desc(n)) %>% print()

# Q8. In general, half star ratings are less common than whole star ratings (e.g., there are fewer ratings of 3.5 than there are ratings of 3 or 4, etc.).
print('Q8:')
edx %>% group_by(rating) %>% summarise(n=n()) %>% arrange(desc(n)) %>% print()
