
### Lesson 2 Worksheet

# Before we get into the meat and potatoes of this worksheet, let's do a warm-up exercise.

# Fantasy points formula for this worksheet is: yards/10 + td*6 + receptions*1

# Warmup answers are directly below the warmup. The main worksheet 2 exercises have answers at the bottom.



# Warmup:

# A friend of mine is a big Stefon Diggs and Kenny Golladay guy. Here's their receptions, yards, and touchdowns for 
# the first 8 games of last season.
diggs_rec <- c(2, 1, 3, 7, 3, 7, 7, 7)
diggs_yds <- c(37, 49, 15, 108, 44, 167, 143, 143)
diggs_tds <- c(0,1,0,0,0,3,0,0)

kenny_rec <- c(4,8,2,5,5,1,6,4)
kenny_yds <- c(42,117,17,67,121,21,123,132)
kenny_tds <- c(1,1,0,2,0,0,2,1)

# A) Create a matrix of 0s, that is 8 rows and 8 columns. Assign it to the name "wr_matrix"

# B) Assign the 1st row of the matrix to diggs_rec

# C) Now, assign row 2-3 to diggs yds and tds. Then, assign rows 4-6 to Golladay's rec, yds, td.

# D) Now, we'll use the final 2 rows for fantasy points calculations. Calculate Diggs' fantasy points
# in row 7, and Golladay's fantasy points in row 8.

# E) Now, run the 2 lines of code below to assign rownames and column names to this matrix. Who was the more
# consistent WR at scoring fantasy points during those first 8 games? I'd recommend standard deviation here.
rownames(wr_matrix) <- c('diggs_rec','diggs_yds','diggs_td','kenny_rec','kenny_yds','kenny_td','fpts_diggs',
                         'fpts_kenny')
colnames(wr_matrix) <- paste0('Game',1:8)
wr_matrix  

# F) Now, create a list with two entries. The first entry is Diggs' fantasy points, the second entry is Golladay's
# fantasy points. Label the first entry of this list "Diggs" and the 2nd entry as "Golladay"
# Assign this list to wr_list

# G) Extract all the entries that are Diggs from this list and display them like a vector (2 brackets)

# H) Extract Golladay's Game 7 fantasy points from the list, using double brackets, followed by single brackets.



# Warm-Up Answers:

# A) 
wr_matrix <- matrix(0,nrow=8,ncol=8)
wr_matrix

# B) 
wr_matrix[1,] <- diggs_rec
wr_matrix

# C) 
wr_matrix[2,] <- diggs_yds
wr_matrix[3,] <- diggs_tds
wr_matrix[4,] <- kenny_rec
wr_matrix[5,] <- kenny_yds
wr_matrix[6,] <- kenny_tds
wr_matrix  

# D) 
wr_matrix[7,] <- wr_matrix[1,] + wr_matrix[2,]/10 + wr_matrix[3,]*6
wr_matrix[8,] <- wr_matrix[4,] + wr_matrix[5,]/10 + wr_matrix[6,]*6
wr_matrix

# E)
sd(wr_matrix[7,])
sd(wr_matrix[8,])
# Golladay had a lower standard deviation (10 fantasy points), which is more consistent than Diggs (12 fantasy points).

# F) 
wr_list <- list(Diggs=wr_matrix[7,],Golladay=wr_matrix[8,])
wr_list  

# G) 
wr_list[[1]]

# H) 
wr_list[[2]][7]



  
# Leonard Fournette and Alvin Kamara are 2 of the top dual threat running backs from 2019, and we'll be digging into
# their 2019 numbers for the rest of this worksheet.

# I recommend referencing Lesson 2 frequently while working on this, but try to resist the urge to do any big copy/paste
# statements from Lesson 2 for this worksheet. Typing it out will further cement some of the matrix notation as you go through 
# the worksheet. This worksheet is supposed to be challenging. If you feel like you've spent more than 5 minutes at any 
# point without making any progress, you can always peek at the answers, located at the bottom of this worksheet, for help.



### Exercise 1:

# A) # We'll be combining a little football analytics and fantasy football when creating this Leonard Fournette matrix. 
# Below are 2019 stats for Leonard Fournette. Let's create a matrix for Leonard Fournette's 2019, much in the same way that
# we did for Chubb, Jacobs, and Mixon in Lesson 2. However, the rows will be changed slightly. Now, I want the rows to be
# carries, rushing yards, 1st downs from rushing, 1st downs per carry (1st downs/carries), rushing TDs, targets, receptions, 
# receiving yards, 1st downs from receiving, 1st downs per target (1st downs/targets), receiving touchdowns, and fantasy points.

# When doing the 1st down efficiency calculations, I recommend specifying round(  ,2) to avoid large decimals. While usually I 
# round to 1 decimal place, given how small 1st down/carries and 1st down/targets will be, at least 2 decimals is important. 
# Also, use nested ifelse() functions for the 1st down efficiency calculations, checking if carries or targets is 0, mark 0.0, if
# carries or targets is NA, then mark NA, else do the rounded (1st downs/carries) or (1st downs/targets) calculation. The columns should be
# Game1 through Game16, and then a Totals column after that. I count a matrix that will ultimately be 12 x 17. You'll want to
# use rowSums() when creating some of the Totals column, but remember to go back and fix efficiency stats like 1st downs per target
# since we want that Total to be a seasonal average, not a massive summation. My whole matrix is rounded to 2 decimals, by the way.

# Label your rows and columns appropriately using rownames() and colnames(). It may be easier to immediately label rows and 
# columns after making the matrix before putting all the data into it to help keep yourself organized.

fournette_carries <- c(13, 15, 15, 29, 23, 20, 29, 19, 11, 8, 24, 14, 15, 15, 15, NA)
fournette_rushyards <- c(66, 47, 66, 225, 108, 72, 131, 76, 40, 23, 97, 38, 50, 42, 71, NA)
fournette_rush1d <- c(3, 3, 2, 9, 6, 1, 8, 1, 3, 2, 7, 1, 4, 2, 3, NA)
fournette_rush_td <- c(rep(0,4), 1, rep(0,5), 2, rep(0,4), NA)
fournette_targets <- c(6, 6, 8, 3, 7, 6, 2, 7, 6, 7, 12, 11, 6, 7, 6, NA)
fournette_receptions <- c(4, 4, 6, 2, 4, 6, 2, 7, 5, 7, 9, 9, 3, 5, 3, NA)
fournette_recyards <- c(28, 40, 26, 20, 29, 46, 14, 60, 32, 34, 62, 53, 13, 31, 34, NA)
fournette_rec1d <- c(2, 2, 1, 1, 2, 4, 1, 3, 1, 1, 2, 1, 0, 1, 1, NA)
fournette_rec_td <- c(rep(0,15),NA)

# B) Use the dim() function to confirm your matrix is 12 x 17. If your matrix is a different size, consult the answer at the bottom to figure
# out where you went wrong.

# C) How many total fantasy points did Fournette have in 2019 over his 15 games played? How many fantasy points per game?

# D) Which number was higher: Fournette's 1st downs per carry or Fournette's 1st downs per target? The answer here is 
# frequently true in general, and is partly accounted for in Expected Points Added (EPA) calculations, one of the pillars of
# football analytics.

# E) Using the given vectors up above in part A, let's calculate yards per carry and yards per target, and see if the order 
# in size of these 2 metrics is similar to part D. Yes, you could extract this info from the matrix, but the code will be 
# longer. ((( It can be very easy to mess up an average, since sometimes we forget the difference between a weighted
# and unweighted average. In the answers section for Exercise 3 Part D, I explore a world where Kamara had
# a 17th game played, where he only had 1 carry, and took it to the house for 82 yards. How would that affect
# his average, and what if we had an incorrect, unweighted average... then how great is the effect? )))

# F) Reference the 12th row of the matrix by row name, and select only games 4-11

# G) Take the mean, median, standard deviation, range, and cumulative sum from Part F.




### Exercise 2

# Before we make the Kamara matrix in Exercise 3, let's take a quick break from matrices.
# Casually go through the following lines of code, and before running the code, try to imagine what R will output. Then, run
# the code to see if you're correct. Run the first 5 lines of code to initialize some variables and vectors.

# Run these 5 lines first.
x <- 7
y <- 2
z <- 54
vec1 <- c(10, 7, 6)
vec2 <- c('a','b','c')

# A)

x*8 - y == z

# B)
paste('Last week, Mahomes had himself a game, throwing for',x,'touchdowns!')

# C)
rbind(vec1,vec2)
cbind(vec1,vec2)
c(vec1,vec2)

# D) Notice that paste commands wrap your output in quotes
paste(x,y,z) 
paste0(x,y,z)
paste0(x,y)

# E)
sum(vec1)
sum(vec2) # Can R sum a vector of character strings?
sum( paste0(x,y,z) + paste0(x,y) )

# F) 
x==8 | z==54
x==8 & z==54
x==7 & z==54

# G)
sum(vec1) > (x + z)

# H)
is.na(z)
is.na(NA)
is.na(TRUE)
is.na(FALSE)





### Exercise 3

# Run these 9 lines of code before proceeding to the directions for Part A:
kamara_carries <- c(13, 13, 16, 17, 16, 11, NA, NA, 4, 13, 11, 11, 13, 14, 11, 8)
kamara_rushyards <- c(97, 45, 69, 69, 62, 31, NA, NA, 24, 75, 54, 61, 25, 66, 80, 39)
kamara_rush1d <- c(4, 2, 4, 5, 3, 0, NA, NA, 0, 1, 1, 3, 1, 2, 3, 3)
kamara_rush_td <- c(0, 0, 1, rep(0,3), NA, NA, rep(0,6), 2, 2)
kamara_targets <- c(8, 3, 10, 3, 7, 8, NA, NA, 10, 10, 9, 8, 6, 5, 7, 3)
kamara_receptions <- c(7, 1, 9, 3, 6, 7, NA, NA, 8, 10, 9, 4, 4, 5, 6, 2)
kamara_recyards <- c(72, 15, 92, 20, 42, 35, NA, NA, 50, 47, 48, 23, 18, 23, 30, 18)
kamara_rec1d <- c(3, 0, 4, 1, 3, 1, NA, NA, 1, 4, 5, 1, 2, 0, 2, 1)
kamara_rec_td <- c(0, 0, 1, rep(0,3), rep(NA,2), rep(0,8))

# A) Now, we will make the Alvin Kamara matrix, similar to how we did the Fournette matrix. Only this time, we're going
# to do almost no actual typing. Above, we just ran the code for the vectors for Kamara's carries, rushing yards, etc.
# Now, to make the Kamara matrix, we will copy and paste the code from Exercise 1, Part A, starting from this line:
# fournette_matrix <- matrix(0, 12, 17)
# and then ending with this line:
# fournette_matrix[10,17] <- round(fournette_matrix[9,17]/fournette_matrix[6,17] ,2)

# We will now have approximately 20 lines of code pasted below this comment. Now, at the top of RStudio, we go to Edit-->Find
# A bar will drop down from the top, and in the first blank, labeled Find, we will type in fournette
# In the second blank labeled 'Replace' we will type in kamara
# Now, click the bottom of this comment, right after "Edit-->Undo", and click Next. It will highlight the first
# instance of the word fournette below. We will then click Replace. And so on, and so on. We will keep clicking Replace until
# the 20 lines of code below no longer have the word fournette, and all have been replaced by the word kamara.
# Then, we can run those 20 lines of code, and we will create the kamara matrix, with minimal effort. Make sure that when the Find
# and replace jumps back up to the top, we stop clicking Replace. That way, we do not replace the word fournette anywhere in
# Exercise 1. If you get too trigger happy with clicking Replace, you can always click Edit-->Undo.  

# B) Leonard Fournette had 14.9 fpts per game. How many did Alvin Kamara have per game in the 14 games he played?

# C) Did Kamara have a higher 1st downs per target than 1st downs per carry, like Fournette?

# D) Calculate Kamara's yards per carry and yards per target. Does this align with your expectation?
# It can be very easy to mess up an average, since sometimes we forget the difference between a weighted
# and unweighted average. In the answers section for this problem, I explore a world where Kamara had
# a 17th game played, where he only had 1 carry, and took it to the house for 82 yards. How would that affect
# our average, and what if we had an incorrect, unweighted average... then how great is our effect?

# E) My ex best friend Johnny Reckless only likes guys that are super hot/cold during the season. He says he will
# only like a player if he has at least 2 games over 25 fantasy points, at least 5 games over 100 total yards,
# at least 3 games with multiple total touchdowns, at least 25 fantasy points in Game 15, the fantasy championship, 
# and at least 8 games below 15 fantasy points. Will Johnny Reckless like Kamara? Hint: See if Kamara fits each of 
# these criteria, individually. Then, try to bring all the criteria together with one long AND statement.
# This problem is really difficult. If you're struggling, look in the answer section as I break each of these 5 conditions
# down, showing how I would calculate each of these conditions over several steps. In total, it took me around 20 lines of
# code to break down this prompt and get an answer to whether or not Johnny Reckless will like Kamara.

# F) My current best friend Johnny Unreckless likes guys that are consistent. He wants a guy to have at least 10 games
# where the player has between 10-20 fantasy points or at least 60 total yards in every healthy game. 
# Will Johnny Unreckless like Kamara? Hint: Because we can't have a statement like 10 <= x <= 20, there should be an
# AND statement in parentheses for this part, with the OR statement directly contrasting it.



### Exercise 4:

# A) Make a labeled list with both the Fournette matrix and the Kamara matrix, and assign it to 
# the name fournette_kamara_list

# B) From the list, extract out some information. (Note there are multiple ways to retrieve this info)
  # b1) Fournette's rush yards each game, including his total

  # b2) Kamara's receiving yards each game, without his total

  # b3) Retrieve both their targets across all games, including their totals (Use rbind to view both running 
  # back's targets at the same time. You can label each row similarly to how we labeled the 2 parts of this list.)

# C) Can you repeat a list? Try to repeat this list 3 times



##### Congratulations, once you've finished Exercise 4 you have now made it through 2 lessons. In Lesson 3, we'll be bringing in a
# .csv file and exploring the many ways to get information from a dataset in R. Stay tuned!




### Exercise 1 Answers:

# A) 

fournette_matrix <- matrix(0, 12, 17)
colnames(fournette_matrix) <- c( paste0('Game',1:16), 'Totals')
rownames(fournette_matrix) <- c('carr','rushy','rush1d','1d/carr','rushtd','targ','rec','recy','rec1d','1d/targ','rectd','fpts')
fournette_matrix[1,1:16] <- fournette_carries
fournette_matrix[2,1:16] <- fournette_rushyards
fournette_matrix[3,1:16] <- fournette_rush1d
fournette_matrix[4,1:16] <- ifelse(fournette_carries==0, 0.0, 
                                   ifelse(is.na(fournette_carries), NA, round( fournette_rush1d / fournette_carries ,2) ) )
fournette_matrix[5,1:16] <- fournette_rush_td
fournette_matrix[6,1:16] <- fournette_targets
fournette_matrix[7,1:16] <- fournette_receptions
fournette_matrix[8,1:16] <- fournette_recyards
fournette_matrix[9,1:16] <- fournette_rec1d
fournette_matrix[10,1:16] <- ifelse(fournette_targets==0, 0.0, 
                                    ifelse(is.na(fournette_targets), NA, round( fournette_rec1d / fournette_targets ,2) ) )
fournette_matrix[11,1:16] <- fournette_rec_td
fournette_matrix[12,1:16] <- round( (fournette_rushyards/10) + (fournette_rush_td*6) + (fournette_receptions*1) +
                                      (fournette_recyards/10) + (fournette_rec_td*6) ,1)

fournette_matrix[1:12,17] <- rowSums(fournette_matrix[1:12,1:16], na.rm = T)
fournette_matrix[4,17] <- round(fournette_matrix[3,17]/fournette_matrix[1,17] ,2)
fournette_matrix[10,17] <- round(fournette_matrix[9,17]/fournette_matrix[6,17] ,2)
fournette_matrix

# B) 

dim(fournette_matrix)

# C)

fournette_matrix[12,17] # His fantasy points total was 261.4
round( mean(fournette_matrix[12,1:16], na.rm = T) ,1) # 17.4 fpts per game
round( fournette_matrix[12,17] / 15  ,1) # Or, we can get fpts per game this way...

# D)

fournette_matrix[10,17] > fournette_matrix[4,17]
# His first downs per target was higher than his first downs per carry,
# though Fournette was very close (0.23 vs. 0.21). The JAX offense did not
# utilize Fournette very efficiently as a receiving back.

# E)

yards_per_carry <- round( sum(fournette_rushyards,na.rm = T) / sum(fournette_carries, na.rm = T) ,1)
yards_per_carry
yards_per_target <- round( sum(fournette_recyards,na.rm = T) / sum(fournette_targets, na.rm = T) ,1)
yards_per_target
yards_per_target > yards_per_carry
# Even though running backs are frequently used for short passes, this relationship is usually true. In Part D and Part E, we
# calculated two different types of efficiency, and both times, passing was more efficient than rushing.

# F)

fournette_matrix['fpts',4:11]

# G)
part_f <- fournette_matrix['fpts',4:11]
mean(part_f)
median(part_f)
sd(part_f)
range(part_f)
cumsum(part_f)



### Exercise 3 Answers:

# A) 

kamara_matrix <- matrix(0, 12, 17)
colnames(kamara_matrix) <- c( paste0('Game',1:16), 'Totals')
rownames(kamara_matrix) <- c('carr','rushy','rush1d','1d/carr','rushtd','targ','rec','recy','rec1d','1d/targ','rectd','fpts')
kamara_matrix[1,1:16] <- kamara_carries
kamara_matrix[2,1:16] <- kamara_rushyards
kamara_matrix[3,1:16] <- kamara_rush1d
kamara_matrix[4,1:16] <- ifelse(kamara_carries==0, 0.0, 
                                ifelse(is.na(kamara_carries), NA, round( kamara_rush1d / kamara_carries ,2) ) )
kamara_matrix[5,1:16] <- kamara_rush_td
kamara_matrix[6,1:16] <- kamara_targets
kamara_matrix[7,1:16] <- kamara_receptions
kamara_matrix[8,1:16] <- kamara_recyards
kamara_matrix[9,1:16] <- kamara_rec1d
kamara_matrix[10,1:16] <- ifelse(kamara_targets==0, 0.0, 
                                 ifelse(is.na(kamara_targets), NA, round( kamara_rec1d / kamara_targets ,2) ) )
kamara_matrix[11,1:16] <- kamara_rec_td
kamara_matrix[12,1:16] <- round( (kamara_rushyards/10) + (kamara_rush_td*6) + (kamara_receptions*1) +
                                   (kamara_recyards/10) + (kamara_rec_td*6) ,1)

kamara_matrix[1:12,17] <- rowSums(kamara_matrix[1:12,1:16], na.rm = T)
kamara_matrix[4,17] <- round(kamara_matrix[3,17]/kamara_matrix[1,17] ,2)
kamara_matrix[10,17] <- round(kamara_matrix[9,17]/kamara_matrix[6,17] ,2)
kamara_matrix

# B)

round(mean(kamara_matrix[12,1:16],na.rm = T),1)
# 17.9 fpts/game

# C)

kamara_matrix['1d/targ',17] > kamara_matrix['1d/carr',17]
# Yes, he did (0.29 vs. 0.19)

# D) 

kamara_ypc <- kamara_matrix['rushy',17]/kamara_matrix['carr',17] # yards per carry
kamara_ypt <- kamara_matrix['recy',17]/kamara_matrix['targ',17] # yards per target
kamara_ypc # 4.66 ypc, 171 carries with 797 rushyards
kamara_ypt # 5.49 yards per target, 97 targets with 533 receiving yards
kamara_ypt > kamara_ypc # yards per target is greater than yards per carry

### Exploring the incorrect way to calculate yards per carry, in-depth:
mean(kamara_rushyards/kamara_carries, na.rm = T) # This doesn't work because it's not accounting for differing 
# number of carries per game. We have to take into account that Kamara had a different amount of carries per game,
#  and this treats all 14 healthy games as if he had the same yards per carry.
kamara_rushyards/kamara_carries
# Imagine if he had 1 game where he housed it on 1 carry, so he had 82 yards per carry, on 1 carry that game.
# Let's pretend that he played 17 games now, and see what happens with both methods. We will simply add 1 carry
# to the end of the carry vector and 82 yards onto his rushing yards vector.
kamara_carries_82 <- c(kamara_carries,1)
kamara_carries_82
length(kamara_carries_82)

kamara_rushyards_82 <- c(kamara_rushyards,82)
kamara_rushyards_82
length(kamara_rushyards_82)

# Now, we can really test the difference here.
sum(kamara_rushyards_82,na.rm = T)
sum(kamara_carries_82,na.rm = T)
sum(kamara_rushyards_82,na.rm = T) / sum(kamara_carries_82,na.rm = T) # 5.11 ypc, the correct way to do it

# This is the wrong way, since his game with 1 carry for 82 yards will be weighted equally to games where he had 10x
# or more carries. A game where he has 15 carries will be equally weighted to his 1 carry game in this example.
kamara_rushyards_82/kamara_carries_82
mean(kamara_rushyards_82/kamara_carries_82, na.rm = T) # 9.93 ypc (This is wrong, since 82 yards per carry
# is now dominating our average) 
# Same goes for trying to do this method for yards per target. If we do this same exercise by saying Kamara had 1 target
# in the 17th game, and he housed it for 82 yards, we will notice a similar phenomenon. Always re-check your averages!


# E)

(sum(kamara_matrix[12,1:16] > 25, na.rm = T) >= 2) & (sum( (kamara_rushyards + kamara_recyards) > 100, na.rm = T) >= 5) &
  (sum((kamara_rush_td + kamara_rec_td) >=2 , na.rm = T) >= 3) & kamara_matrix[12,15] >= 25 &
  (sum(kamara_matrix[12,1:16] < 15 , na.rm = T) >= 8)

# We can break the above statement down to see how I arrived at this answer, which is FALSE, meaning that Johnny Reckless 
# would not like Alvin Kamara.

# At least 2 games over 25 fantasy points
kamara_matrix[12,1:16]
kamara_matrix[12,1:16] > 25
sum(kamara_matrix[12,1:16] > 25, na.rm = T)
sum(kamara_matrix[12,1:16] > 25, na.rm = T) >= 2

# At least 5 games over 100 total yards
kamara_rushyards
kamara_recyards
(kamara_rushyards + kamara_recyards)
(kamara_rushyards + kamara_recyards) > 100
sum( (kamara_rushyards + kamara_recyards) > 100, na.rm = T)
sum( (kamara_rushyards + kamara_recyards) > 100, na.rm = T) >= 5

# At least 3 games with multiple touchdowns
kamara_rush_td
kamara_rec_td
(kamara_rush_td + kamara_rec_td)
(kamara_rush_td + kamara_rec_td) >=2
sum((kamara_rush_td + kamara_rec_td) >=2 , na.rm = T)
sum((kamara_rush_td + kamara_rec_td) >=2 , na.rm = T) >= 3

# At least 25 fantasy points in game 15
kamara_matrix[12,]
kamara_matrix[12,15]
kamara_matrix[12,15] >= 25

# At least 8 games below 15 fantasy points
kamara_matrix[12,1:16]
kamara_matrix[12,1:16] < 15
sum(kamara_matrix[12,1:16] < 15 , na.rm = T)
sum(kamara_matrix[12,1:16] < 15 , na.rm = T) >= 8
# FALSE! He only had 6 games below 15 fantasy points.

# F) 

(sum(kamara_matrix[12,1:16] <= 20 & kamara_matrix[12,1:16] >= 10 , na.rm = T) >= 10) |
  (min(kamara_rushyards + kamara_recyards, na.rm = T) >= 60)

# Johnny Unreckless would not like Kamara, since both sides of the OR statement are FALSE. All we needed was one side of
# the OR statement to be TRUE for the whole OR statement to be TRUE.

# Let's break down each part in detail to see how I arrived at this answer.

# At least 10 games between 10-20 fpts
kamara_matrix[12,1:16]
kamara_matrix[12,1:16] <= 20
kamara_matrix[12,1:16] >= 10
kamara_matrix[12,1:16] <= 20 & kamara_matrix[12,1:16] >= 10
sum(kamara_matrix[12,1:16] <= 20 & kamara_matrix[12,1:16] >= 10 , na.rm = T)
sum(kamara_matrix[12,1:16] <= 20 & kamara_matrix[12,1:16] >= 10 , na.rm = T) >= 10

# At least 60 total yards in every healthy game
kamara_rushyards
kamara_recyards
kamara_rushyards + kamara_recyards
min(kamara_rushyards + kamara_recyards, na.rm = T)
min(kamara_rushyards + kamara_recyards, na.rm = T) >= 60



### Exercise 4 Answers:

# A) 

fournette_kamara_list <- list(fournette=fournette_matrix, kamara=kamara_matrix)
fournette_kamara_list

# B) 

# b1) 

fournette_kamara_list[[1]]['rushy',]
fournette_kamara_list[['fournette']]['rushy',]
fournette_kamara_list[[1]][2,]
fournette_kamara_list[['fournette']][2,]

# b2) 

fournette_kamara_list[[2]]['recy',1:16]
fournette_kamara_list[[2]][8,1:16]
fournette_kamara_list[['kamara']][8,1:16]
fournette_kamara_list[['kamara']]['recy',1:16]

# b3) 

fournette_kamara_list[[1]]['targ',]
fournette_kamara_list[[2]]['targ',]
rbind( fournette_kamara_list[[1]]['targ',] , fournette_kamara_list[[2]]['targ',] )
rbind( fournette_targ=fournette_kamara_list[[1]][6,] , kamara_targ=fournette_kamara_list[[2]][6,] )

# C) 

fournette_kamara_list
rep(fournette_kamara_list,3)
# Gross, we repeated a list of matrices 3 times. Now we are looking at 6 matrices.
