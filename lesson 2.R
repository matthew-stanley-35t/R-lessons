
### Lesson 2:

# In this lesson, we'll start by learning about matrices in R, and how a matrix
# can save you lots of time and energy. We'll start by analyzing some 2019 RBs.
# And in case you were wondering, we are one step away from bringing in data from 
# .csv files, probably the most common way to save an Excel file for analytics. 

# Let's start by creating 6 vectors for Nick Chubb. Everything should look very 
# straightforward and similar to what we learned in lesson 1, except for his receiving
# touchdowns vector at the end. Let's run these first 5 vectors of code, then
# tackle that 6th line afterwards.
chubb_carries <- c(17, 18, 23, 20, 16, 20, 20, 20, 20, 27, 21, 16, 15, 17, 15, 13)
chubb_rushyards <- c(75, 62, 96, 165, 87, 122, 131, 65, 116, 92, 106, 58, 106, 127, 45, 41)
chubb_rush_td <- c(0, 1, 0, 3, 0, 2, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0)
chubb_receptions <- c(3, 4, 4, 3, 1, 5, 1, 4, 2, 0, 3, 1, 1, 3, 0, 1)
chubb_recyards <- c(10, 36, 35, 18, 12, 17, 7, 26, 5, 0, 58, 21, 11, 21, 0, 1)
# Like every good analyst, I am lazy. I glanced at Chubb's 2019 stats, and saw that he didn't have
# any receiving touchdowns in 2019. Do I really want to type out 16 0's in a vector? No.
# Fortunately, R has a built-in function rep, which stands for repeat. It's incredibly simple.
# rep takes in two arguments for the function. The first argument is what you want to see, and the 
# second argument is how many times you want to see it. Chubb had no receiving touchdowns, so in this
# vector, what I want to see (argument 1) is a lot of zeroes, and I want to see that for all 16 games
# (argument 2).  Let's see what R outputs if we type in rep(0,16) before we assign it to a variable.
rep(0,16)
chubb_rec_td <- rep(0,16)

# Let's bring in more running backs to analyze.  It's more fun to compare running backs, rather than
# just looking at one guy's stats. Chubb was a workhorse in 2019, playing in all 16 games. Not every
# running back is going to play in all 16 games. Many starting running backs get injured, and Josh Jacobs
# was one of them. Let's bring in his 2019 carries as a vector. We can run this line of code and look at it.
jacobs_carries <- c(23, 12, 10, 17, 26, 21, 15, 28, 16, 23, 10, 17, NA, 24, NA, NA)
jacobs_carries

# So far, it looks just like any old vector has looked. But, there are 3 entries that I marked as NA, since
# Jacobs missed those games. We could just mark those as zeroes, but that's losing information. When we
# bring in his rushing touchdowns like we did for Chubb, we know that Jacobs had some games without a rushing
# touchdown. So if we just bring in his stats with zeroes for missed games, we can't differentiate between a
# bad performance (0 touchdowns or 0 receiving yards for example) and a missed game due to injury. In general, 
# NA denotes a missing value in R, and you cannot ever name a variable NA, since that's a special keyword 
# reserved for missing values only. Let's look at Chubb's and Jacobs' total carries in 2019.

sum(chubb_carries) # 298 carries
sum(jacobs_carries) #  NA?

# Huh. We can see that NA values are ruining our summation. R is very careful with NAs, and we can easily get
# around this when using functions by adding a second argument to functions like sum.
# Inside the sum function, we add na.rm = T, which means NA removal is True.
# Now, we can sum up Jacobs' carries while removing the NAs.
sum(jacobs_carries, na.rm = T) # Much better, he had 242 carries.

# Let's bring in the rest of Josh Jacobs' 2019 stats.
jacobs_rushyards <- c(85, 99, 44, 79, 123, 124, 66, 120, 71, 112, 34, 104, NA, 89, NA, NA)
jacobs_rush_td <- c(2, 0, 0, 0, 2, 0, 0, 2, 1, 0, 0, 0, NA, 0, NA, NA)
jacobs_receptions <- c(1, 0, 0, 2, 3, 3, 2, 0, 3, 3, 1, 0, NA, 2, NA, NA)
jacobs_recyards <- c(28, 0, 0, 29, 20, 10, 15, 0, 30, 12, 2, 0, NA, 20, NA, NA)
jacobs_rec_td <- c( rep(0,12), NA, 0, rep(NA,2) )
rep(0,12), NA, 0, rep(NA,2) # Notice that without c(), there's an error


# You'll notice that this has a [1] in front of it when we hit Cmnd/Ctrl + enter, so it's a vector
jacobs_rec_td
rep(0,16) # is also a vector, since it has a [1] in front of it

# We'll also bring in Joe Mixon's 2019 stats.
mixon_carries <- c(6, 11, 15, 15, 19, 8, 10, 17, 30, 15, 18, 19, 23, 25, 21, 26)
mixon_rushyards <- c(10, 17, 60, 62, 93, 10, 2, 66, 114, 86, 79, 44, 146, 136, 50, 162)

# Once again, I'm feeling lazy. Mixon had no rushing touchdowns in his first 9 weeks, so we
# can sneak rep(0,9) inside the c() command when creating this vector. Pretty nifty!
mixon_rush_td <- c(rep(0,9),1, 0, 1, 1, 0, 0, 2)
mixon_receptions <- c(2, 3, 2, 4, 1, 2, 1, 4, 2, 1, 0, 4, 3, 3, 2, 1)
mixon_recyards <- c(7, 10 ,34, 1, 16, 29, 2, 11, 37, 17, 0, 26, 40, 20, 23, 14)
mixon_rec_td <- c(0, 0, 1, 0, 0, 0, 1, 1, rep(0,8)) # Here, we sneak rep() in again.


# Before we start bringing all this data into a matrix, let's make a mini matrix
# and get to understand what you need to specify when making one.
# We'll create a matrix called mat1.  We specify 3 pieces of information.
# The first piece of information is what's in each entry. Here, we specify a matrix of 0's,
# which is a common initialization for matrices in R. Then, we specify the rows and columns.
# We are creating a 3 x 4 matrix.
mat1 <- matrix(0, nrow=3, ncol=4)
mat1
dim(mat1) # We can check the dimensions using the dim() function

# Like a vector, we can easily use brackets to look at a part of the matrix or to manipulate
# a part of the matrix. Let's assign row 2, column 3 equal to 5.
# Inside the brackets, the first number is the row specifying argument,
# and the second number after the comma, is the column specifier.
# Note that we need the comma.
mat1[2,3] <- 5
mat1

# Next, let's assign all of row 1 equal to 4. Notice that leaving the column argument
# blank tells R to assign all applicable columns in row 1 to the number 4.
mat1[1,] <- 4
# Now, let's assign rows 2 and 3, 4th column only, to 7
mat1[2:3,4] <- 7
mat1
# We can peek at different parts of the matrix, as well.
mat1[2,3]
mat1[1,3]
mat1[2:3,3:4]

# Now that we know a little bit about matrices, let's start bringing in some RB data from before.
# Let's make a matrix that has all the running backs' rushing and receiving yards data.
# We have 3 players, each with 2 vectors, 1 for rushing yards, 1 for receiving yards.
# Altogether, we need a matrix that's 6 rows and 16 columns.
rb_mat1 <- matrix(0, 6, 16)
rb_mat1

# Let's assign row 1 to Chubb's rushing and row 2 to Chubb's receiving
rb_mat1[1,] <- chubb_rushyards
rb_mat1[2,] <- chubb_recyards
rb_mat1 # Great, his stats are in the matrix now.

# How many rushing yards did he have in game 7?
rb_mat1[1,7] # He had 131

# Now, let's add in Josh Jacobs to the matrix
rb_mat1[3,] <- jacobs_rushyards
rb_mat1[4,] <- jacobs_recyards

# And, we'll add in Mixon's rushing yards and receiving yards
rb_mat1[5,] <- mixon_rushyards
rb_mat1[6,] <- mixon_recyards
rb_mat1

# We can see the matrix in our console, and honestly, it's pretty ugly.
# It's hard to remember what every row represents, and we just created it.
# If we look back on this in 2 weeks, it'd look like some ancient scribblings.
# Good thing we can label our rows and columns. In doing so, we'll have our first encounter
# with character strings in R.  And what I mean by that is words.
# We are going to label the rows and columns with words (character strings) to make this matrix
# much more read-able before we dive in to some analysis.
# We can see with R's built-in colnames() and rownames() functions that we have nothing labeled.
colnames(rb_mat1)
rownames(rb_mat1)

# Let's label our rows right now. To use any type of character strings in R, we just put it in single or
# double quotes. I usually use single quotes, but you may find times you prefer one to the other, and
# there are also times you need to use one or the other, specifically. But don't worry about that right now,
# let's just pop in some row labels. Here, we turn to our trusted vector, and fill it with strings, instead
# of numbers like before.
rownames(rb_mat1) <- c('Chubb_rushy','Chubb_recy','Jacobs_rushy','Jacobs_recy','Mixon_rushy','Mixon_recy')
rb_mat1

# Now we need to add in column names. But... do we really want to type in Game1, Game2, ... , Game16?
# I'd rather take a shortcut. Let's consult the paste() and paste0() functions for help.
# Just like how with c(), we can concatenate, or bring together different elements, so too can we do that
# with strings and numbers together.
# Let's do a basic example with paste and paste0 to determine which one we want for our column headers.
paste('patrick','mahomes')
paste0('patrick','mahomes')

# paste took our pieces of information and put them together, separated by a space.
# paste0 had 0 space between pieces of information.
# Before returning to column names, paste and paste0 can work with many pieces of information.
paste('Mahomes once','threw','for',50,'touchdown passes','!')
# We can even use paste and paste0 together, so that the ! isn't floating out at the end
paste('Mahomes once','threw','for',50, paste0('touchdown passes','!') )
# There, we wrapped the function paste around some character strings, as well as a paste0 function!

# After thinking long and hard, I've decided I want paste0, since I want my labels to be Game1, Game2, etc.
# rather than Game 1, Game 2, etc.  When possible, avoid spaces in R, especially for variable names, column names,
# and anything else really. Yes, it's possible to have different labels with spaces or other variable names or vector
# names with spaces, but I'll let you Google that for now if you're curious since I personally think it's a bad habit.
# That's why I label variables and vectors with underscores _ instead of spaces.

# Anyway, let's watch how R automatically knows that I want to vectorize this command.
# Just by passing in 'Game' and 1 through 16 with a colon, it knows I want to match
# Game with 1, then Game with 2, then Game with 3, and because I'm using paste0, there will be zero
# space between Game and the number.
paste0('Game',1:16)
colnames(rb_mat1) <- paste0('Game',1:16)
rb_mat1


# To add a totals row and a totals column, we need to consult the functions cbind() and rbind().  
# cbind() is short for column bind, and it binds 2 objects together, horizontally. rbind() is short
# for row bind, and it binds 2 objects together, vertically.
# Let's add in another column of 6 zeroes at the end as a placeholder for row totals.
rb_mat1 <- cbind( rb_mat1, rep(0, 6) )
rb_mat1

# Now, let's add a row at the bottom for game by game totals.
rb_mat1 <- rbind( rb_mat1, rep(0, 16)) # We get an error. Remember, we now have 17 columns (added the totals column).
rb_mat1 # Fortunately, R was smart enough to automatically put an extra, 17th zero in for us. Crisis averted.

# Let's add in totals row and column names now
colnames(rb_mat1)[15]
colnames(rb_mat1)[17] <- 'Season Totals'
rownames(rb_mat1)[4]
rownames(rb_mat1)[7] <- 'Game by Game Totals'

# Let's make column 17 the summation of Games 1-16
rb_mat1[,17] <- sum(rb_mat1[,1:16])
rb_mat1

# Oh no, we forgot about NA values...
# Wait, that didn't matter. Even Chubb and Mixon, who have no NA values got NA values.
# Looks like we need to be more specific with R about what we are doing when using matrices.
# Luckily, there's 2 functions, rowSums() and colSums(), which can help us.
# These two functions do exactly as you may expect. We can sum up an entire row with rowSums()
# and sum a column with colSums(). We can even subset these functions, so that when we do rowSums(),
# we only get the first 16 columns, which represent our games.
# Here, I have specified that I want to take all rows and only column 17 [,17]
# and then I want to assign those entries to row sums from columns 1-16, and I want to do it for all rows.
# Also, because I have NA values for Josh Jacobs, I need to again use na.rm=T to remove NAs from the summation.
rb_mat1[,17]
rb_mat1[,1:16]
rowSums(rb_mat1[,1:16], na.rm = T)
rb_mat1[,17] <- rowSums(rb_mat1[,1:16], na.rm = T)
rb_mat1

# We can run a similar looking command to get colSums()
rb_mat1[7,] <- colSums(rb_mat1[1:6,], na.rm = T)

# We can see that in Game 1 of the season, these 3 RBs combined for 215 total scrimmage yards.
rb_mat1

# Which game had the max combined total yards from all the RBs?
max(rb_mat1[7,]) # Whoops, we forgot to remove column 17 from our line of code
max(rb_mat1[7,1:16]) # Looks like we now know the maximum amount of yards, but I want to know which game it was.

# We can see which game it was like so. This can be a little difficult to initially wrap your head around, 
# but over time, as you practice R more, the logic will become second nature in your mind.
which(rb_mat1[7, 1:16] == max(rb_mat1[7,1:16]) )

# Let's break that statement down quickly
rb_mat1[7, 1:16] # This is a vector of all 16 game by game totals
max(rb_mat1[7,1:16]) # This is a placeholder for 413 total yards
# now we test equivalency among each entry of the vector
rb_mat1[7, 1:16] == max(rb_mat1[7,1:16])

# And finally, we wrap that line of code with the which() function, to determine which is TRUE
which(rb_mat1[7, 1:16] == max(rb_mat1[7,1:16]) )

# The way I just broke it down above is exactly how I think through my code. Rarely do I write out 
# complex R statements on my first pass. Usually, I write a few small chunks of code, and then I'm better
# able to create a complete line of code that can answer the specific question I have.
# One last time, let's view our matrix in all its glory.
rb_mat1



# Now, we'll turn our attention towards lists in R. We'll start with a simple example
# of a small list, then we'll find a way to keep track of each RB's carries, yards, and touchdowns
# all in one place. Since right now, we still only have rb_mat1, which only includes rushing and
# receiving yards for the 3 running backs.

# To create a list(), we use the list() function. Let's make a list with Chubb's rushing yards
# from his first 4 games.
chubb_mini_list <- list(75, 62, 96, 165)
chubb_mini_list # Notice that it doesn't look at all like a vector...
chubb_mini_rushyards <- c(75, 62, 96, 165) 
chubb_mini_rushyards # This vector looks very different

# A list separates out each element into its own distinct area, or so it seems.
# Let's grab the first element from the chubb vector, and do the same for the list.
chubb_mini_rushyards[1]
chubb_mini_list[1] # Still a little different.

# To access the number 75, I have to use double brackets for a list.
chubb_mini_list[[1]]

# You may be thinking, "What is the point of a list?" since it seems like a more complicated,
# less useful vector.  Let's expand our mini example, slightly.
chubb_mini_carries <- c(17, 18, 23, 20) # Here's Chubb's carries in games 1-4.

# We are taking 2 vectors, and putting them in a list.
chubb_medium_list <- list(chubb_mini_carries, chubb_mini_rushyards)
chubb_medium_list

# Now, let's look at entry extraction
chubb_medium_list[[1]] # This looks a bit like a vector again
chubb_medium_list[[1]][2] # And just like a vector, I grabbed the 2nd element.
chubb_medium_list[[2]][3] # Chubb's game 3 rush yards

# We can even name list entries, which is super helpful when we have a massive list.
chubb_medium_list <- list(carries = chubb_mini_carries, rushyards = chubb_mini_rushyards) # Equals sign
# instead of an assignment (<-) because you rarely use <- when it's going to be within parentheses.
chubb_medium_list

chubb_medium_list['carries']
chubb_medium_list['rushyards']

chubb_medium_list['carries'][2] #Doesn't work
chubb_medium_list[['carries']][2] # We need to double bracket to extract an entry this way.

# We can even add elements to an already created list. We forgot to add in his rushing touchdowns.
chubb_medium_list[['rush_td']] <- c(0, 1, 0, 3) # RushTD from Chubb's first 4 games of 2019
chubb_medium_list

# We can delete from a list by assigning it to NULL
chubb_medium_list[['rush_td']] <- NULL
chubb_medium_list

# But, we want that information back, actually.
chubb_medium_list[['rush_td']] <- c(0, 1, 0, 3)
chubb_medium_list

# We can even do mathematical operations within a list if we want!
chubb_medium_list[['fantasy_points_rushing']] <- (chubb_medium_list[['rushyards']] / 10.0) + 
  (chubb_medium_list[['rush_td']] * 6.0) # I hit Enter after typing the + sign, but
# you don't need to do that. I don't like my lines of code to get too long. Notice that R
# automatically indented the rest of the code after the + sign since it knows it is part of
# the same statement.

chubb_medium_list

# To wrap up all we've learned about matrices and lists, we will create a list of matrices.
# Each player will have his own matrix, then we'll make a list containing those 3 matrices.
# You'll have the chance to do this on your own in worksheet 2, so I'll mainly lay out the code for you
chubb_matrix <- matrix(0, nrow = 9, ncol = 17)
chubb_matrix

chubb_matrix[1,1:16] <- chubb_carries # Inserting the vector of 16 games of carries into row 1, columns 1-16
chubb_matrix[2,1:16] <- chubb_rushyards
chubb_matrix
chubb_matrix[3,1:16] <- round( chubb_rushyards / chubb_carries ,1)
chubb_matrix # Looks like we lost our integers since in doing that division problem
# R attempts to keep all decimals the same. We'll correct this soon.
chubb_matrix[4,1:16] <- chubb_rush_td
chubb_matrix[5,1:16] <- chubb_receptions
chubb_matrix[6,1:16] <- chubb_recyards
chubb_matrix[7,1:16] <- round( chubb_recyards / chubb_receptions ,1)
chubb_matrix[8,1:16] <- chubb_rec_td
rownames(chubb_matrix) <- c('carr','rushy','ypc','rushtd','rec','recy','ypr','rectd','fpts')
colnames(chubb_matrix) <- c( paste0('Game',1:16), 'Totals' )
chubb_matrix[,17] <- rowSums(chubb_matrix[,1:16])

# Let's see how it looks so far...
chubb_matrix # Notice that we need to get rid of some decimals, still. Also, our yards per carry total
# is currently 80 because we added up all his prior averages. We will soon fix that entry.
# But, another issue has surfaced. In math, you cannot divide by 0, and R respects that.
# Notice that when Chubb had zero receptions, we were dividing by zero to get his yards
# per reception. We probably want those NaN values to read as 0.0, rather than NaN.
# It's almost as if we want to tell R that IF receptions is 0, spit out 0.0 for yards per reception,
# or ELSE we will use the normal formula.
# Let's re-do row 7's calculation with another built-in R function, ifelse().
# The ifelse statement is similar to if statements in Excel and most other programs.

# ifelse(TRUE/FALSE condition, value if condition is TRUE, value if condition is FALSE)
chubb_receptions
ifelse(chubb_receptions==0, 0.0, chubb_recyards / chubb_receptions)
# We are saying if his receptions is equivalent to 0, then use 0.0, else we will do the normal 
# formula. Let's round that off to get a better look:
round( ifelse(chubb_receptions==0, 0.0, chubb_recyards / chubb_receptions) ,1)

# If you're still slightly lost, you can even investigate this formula further, to understand how each
# individual part of it is being calculated.
chubb_receptions==0.0 # Notice the 2 times that we have a TRUE here, we have NaN in the next line of code.
chubb_recyards / chubb_receptions

# And now, let's overwrite row 7, games 1-16 with the better formula
chubb_matrix[7,1:16] <- ifelse( chubb_receptions==0, 0.0, round(chubb_recyards / chubb_receptions ,1) )
chubb_matrix

# Let's add in our fantasy points calculation in row 9, then we'll correct our Totals column for ypc and ypr.
# Then, we'll remove decimals where appropriate to make the matrix more read-able.
# We'll be doing rushyards/10 + rushtd*6 + rec*1 + recyards/10 + rectd*6
# I'm leaving out fumbles and 2pt conversions because of their small effect on fantasy points.
# Also, reminder that I'm using PPR scoring. If you prefer standard, half-PPR, or something else,
# you can modify the numbers accordingly.
chubb_matrix[9,1:16] <- (chubb_matrix[2,1:16] / 10.0 ) + (chubb_matrix[4,1:16] * 6.0) + (chubb_matrix[5,1:16] * 1) +
  (chubb_matrix[6,1:16] / 10.0) + (chubb_matrix[8,1:16] * 6.0)
  
# Let's fix the totals columns now that we removed NaN values from before
# First, let's re-compute rowSums to get total fantasy points for Chubb.
chubb_matrix[,17] <- rowSums(chubb_matrix[,1:16])
chubb_matrix
# Now, let's fix our ypc and ypr totals
chubb_matrix[3,17] <- chubb_matrix[2,17] / chubb_matrix[1,17]
chubb_matrix # Gross, way too many decimals. We'll make note of that for ypr
chubb_matrix[,17] <- round(chubb_matrix[,17] ,1) # Round all of column 17 to 1 decimal
chubb_matrix[7,17] <- round( chubb_matrix[6,17] / chubb_matrix[5,17] ,1) # create ypr in Totals column
chubb_matrix

# Now, let's try to bring back our integers, and remove some unwanted decimal places from certain rows.
chubb_matrix[1,] <- round((chubb_matrix[1,]))
chubb_matrix
chubb_matrix[c(1:2,4:6,8),1:16]
chubb_matrix[c(1:2,4:6,8),1:16] <- round( chubb_matrix[c(1:2,4:6,8),1:16] )
chubb_matrix

# It looks like matrices have their limits. Fortunately, in our next lesson we'll read in
# a dataset to R via .csv file, and we'll see that we have better control over each individual entry/row/column.
# A matrix in R is very lightning fast, and can be useful for storing data that we need to access quickly. With that speed,
# you have a reduction in flexibility, as we have seen with the rounding issues above.
# Also, we'll explore matrix multiplication later on, and how matrices can be used for different optimization concepts.

# Before we create the Jacobs and Mixon matrices, let's look at Chubb's 2019 fantasy production.
chubb_mean_fpts <- chubb_matrix[9,17] / 16.0 # 16.3 fppg in ppr
chubb_mean_fpts

sum(chubb_matrix[9,1:16] >= 10) # 12 of 16 weeks he had 10+ fpts
sum(chubb_matrix[9,1:16] >= 15) # 6 weeks of 15+ fpts
sum(chubb_matrix[9,1:16] >= 20) # 4 weeks of 20+ fpts

# Looks like Chubb offered good production in 6 of his 16 weeks, and elite production in 4 of them.
# Fortunately, he wouldn't burn you too often if you started him, and game 16 was outside the fantasy playoffs.

chubb_sd <- sd(chubb_matrix[9,1:16]) # standard deviation of 9.5

# About 68% of the time, statistically, we would expect him +/- 1 standard deviation from the mean
# 12 of 16 times in reality (75%), Chubb was in that range. Always good to remember that a football
# season is a very small sample.
# sum(chubb fantasy points >= mean - 1*sd AND chubb fantasy points <= mean + 1*sd)
sum( chubb_matrix[9,1:16] >= (chubb_mean_fpts - chubb_sd) & chubb_matrix[9,1:16] <= (chubb_mean_fpts + chubb_sd) )
  
# How did Chubb's fantasy point average change when Kareem Hunt returned to the Browns' backfield in Games 9-16?
# He averaged 6.7 more fantasy points per game without Kareem Hunt splitting RB duties with him.
mean(chubb_matrix[9,1:8]) - mean(chubb_matrix[9,9:16])


# Now we turn towards Josh Jacobs and will create his matrix. Then we'll turn to Joe Mixon.
# I'll only be commenting any part of this process that differs from Nick Chubbs's matrix.
jacobs_matrix <- matrix(0, nrow = 9, ncol = 17)
jacobs_matrix[1,1:16] <- jacobs_carries
jacobs_matrix[2,1:16] <- jacobs_rushyards
jacobs_matrix[3,1:16] <- round( jacobs_rushyards / jacobs_carries ,1)
jacobs_matrix[4,1:16] <- jacobs_rush_td
jacobs_matrix[5,1:16] <- jacobs_receptions
jacobs_matrix[6,1:16] <- jacobs_recyards
# Here, we have a "nested" ifelse function. For those with experience in Excel or many other software programs, this should look 
# slightly familiar. For Jacobs' yards per reception, we want to check for multiple unique conditions before doing yards / rec.
# Like Chubb, we want to check if receptions is equivalent to 0, and if so, put 0.0. Then, we check if receptions is NA
# using the is.na() function.  is.na() returns a boolean value of TRUE/FALSE. So if is.na() returns a TRUE, then we
# want yards per reception to return an NA, as well. Finally, if neither the zero equivalency nor the is.na() conditions are TRUE,
# we proceed with taking yards divided by receptions, and then round it to 1 decimal place. Note the order of parentheses.
# RStudio will guide you along with this, and will highlight the code in red if your parentheses are off. Remember you can click
# just to the right of any parentheses in RStudio to see its corresponding opening/closing parenthesis.
jacobs_receptions
is.na(jacobs_receptions)
is.na(jacobs_matrix[5,1:16]) # Same as the line of code before it, remember we just assigned row 5 of this matrix to jacobs_receptions
jacobs_matrix[7,1:16] <- ifelse( jacobs_receptions==0, 0.0,
                                 ifelse( is.na(jacobs_receptions), NA, round(jacobs_recyards / jacobs_receptions ,1) ) )
jacobs_matrix[8,1:16] <- jacobs_rec_td 
rownames(jacobs_matrix) <- c('carr','rushy','ypc','rushtd','rec','recy','ypr','rectd','fpts')
colnames(jacobs_matrix) <- c( paste0('Game',1:16), 'Totals' )

# We add na.rm=T, since we know there's a lot of NAs, as Jacobs missed 3 games due to injury.
jacobs_matrix[,17] <- rowSums(jacobs_matrix[,1:16], na.rm = T) 
# For calculating fantasy points, we check if his rushing yards for that game was NA.
# If his rushing yards for that game were NA using the is.na() function, then we write NA,
# if is.na() returns a FALSE, then we proceed with the normal fantasy points formula
jacobs_matrix[9,1:16] <- ifelse( is.na(jacobs_matrix[2,1:16]), NA, 
                                 (jacobs_matrix[2,1:16] / 10.0 ) + (jacobs_matrix[4,1:16] * 6.0) + (jacobs_matrix[5,1:16] * 1) + 
                                   (jacobs_matrix[6,1:16] / 10.0) + (jacobs_matrix[8,1:16] * 6.0) )

jacobs_matrix[,17] <- rowSums(jacobs_matrix[,1:16], na.rm = T) # Add in fpts sum
# Now, let's fix our ypc and ypr totals
jacobs_matrix[3,17] <- round( jacobs_matrix[2,17] / jacobs_matrix[1,17] ,1)
jacobs_matrix[7,17] <- round( jacobs_matrix[6,17] / jacobs_matrix[5,17] ,1)
jacobs_matrix

jacobs_mean_fpts <- mean(jacobs_matrix[9,1:16], na.rm = T)
round( jacobs_mean_fpts ,1) # 14.9 fantasy points per game

sum(jacobs_matrix[9,1:16] >= 10, na.rm = T) # 10 of 13 healthy weeks he had 10+ fpts
sum(jacobs_matrix[9,1:16] >= 15, na.rm = T) # 6 weeks with 15+ fpts
sum(jacobs_matrix[9,1:16] >= 20, na.rm = T) # 3 weeks of 20+ fpts

jacobs_sd <- round( sd(jacobs_matrix[9,1:16], na.rm = T) ,1) # standard deviation of 7.6

# About 68% of the time, statistically, we would expect him +/- 1 standard deviation from the mean
# 8 of 13 times in reality (62%), Jacobs was in that range. Always good to remember that a football
# season is a very small sample. Jacobs was less consistent than Nick Chubb in 2019.
sum( jacobs_matrix[9,1:16] >= (jacobs_mean_fpts - jacobs_sd) & 
       jacobs_matrix[9,1:16] <= (jacobs_mean_fpts + jacobs_sd) , na.rm = T)

# Like Chubb, Jacobs faltered in the 2nd half, averaging 4 fewer fantasy points per game (he also missed 3 games)
mean(jacobs_matrix[9,1:8]) - mean(jacobs_matrix[9,9:16],na.rm = T)



# Here's the Joe Mixon matrix

mixon_matrix <- matrix(0, nrow = 9, ncol = 17)

mixon_matrix[1,1:16] <- mixon_carries
mixon_matrix[2,1:16] <- mixon_rushyards
mixon_matrix
mixon_matrix[3,1:16] <- round( mixon_rushyards / mixon_carries ,1)
mixon_matrix[4,1:16] <- mixon_rush_td
mixon_matrix[5,1:16] <- mixon_receptions
mixon_matrix[6,1:16] <- mixon_recyards
mixon_matrix[7,1:16] <- round( mixon_recyards / mixon_receptions ,1)
mixon_matrix[8,1:16] <- mixon_rec_td
rownames(mixon_matrix) <- c('carr','rushy','ypc','rushtd','rec','recy','ypr','rectd','fpts')
colnames(mixon_matrix) <- c( paste0('Game',1:16), 'Totals' )
mixon_matrix[,17] <- rowSums(mixon_matrix[,1:16])
mixon_matrix[7,1:16] <- ifelse( mixon_receptions==0, 0.0, round(mixon_recyards / mixon_receptions ,1) )

mixon_matrix[9,1:16] <- (mixon_matrix[2,1:16] / 10.0 ) + (mixon_matrix[4,1:16] * 6.0) + (mixon_matrix[5,1:16] * 1) +
  (mixon_matrix[6,1:16] / 10.0) + (mixon_matrix[8,1:16] * 6.0)

mixon_matrix[,17] <- rowSums(mixon_matrix[,1:16])
mixon_matrix[3,17] <- round( mixon_matrix[2,17] / mixon_matrix[1,17] ,1) # Fix yards per carry
mixon_matrix[7,17] <- round( mixon_matrix[6,17] / mixon_matrix[5,17] ,1) # Fix yards per reception
mixon_matrix

# Let's check out another property of matrices, which will seem familiar from when we learned lists before.
mixon_matrix['ypr',1:8] # Get yards per reception from games 1:8
mixon_matrix['fpts',] # Get fantasy points for all columns
mixon_matrix[c('rushtd','rectd'),] # Get rushing and receiving touchdowns rows, for all columns

mixon_mean_fpts <- round(mixon_matrix[9,17] / 16.0 ,1) # 14.1 fppg in ppr
mixon_mean_fpts

sum(mixon_matrix[9,1:16] >= 10) # 10 of 16 weeks he had 10+ fpts
sum(mixon_matrix[9,1:16] >= 15) # 8 weeks of 15+ fpts
sum(mixon_matrix[9,1:16] >= 20) # 2 weeks of 20+ fpts

mixon_sd <- sd(mixon_matrix[9,1:16]) # standard deviation of 7.7

# About 68% of the time, statistically, we would expect him +/- 1 standard deviation from the mean
# 11 of 16 times in reality (68.8%), Mixon was in that range. Always good to remember that a football
# season is a very small sample like I've said before. But it's nice when stats play by the rules,
# even in a small sample size.
sum( mixon_matrix[9,1:16] >= (mixon_mean_fpts - mixon_sd) & mixon_matrix[9,1:16] <= (mixon_mean_fpts + mixon_sd) )

# Unlike Jacobs and Chubb, Mixon averaged over 8 more fantasy points per game in the 2nd half.
mean(mixon_matrix[9,1:8]) - mean(mixon_matrix[9,9:16])


# Now, let's make a massive list that stores all 3 player matrices
rb_list_lesson2 <- list(chubb=chubb_matrix, jacobs=jacobs_matrix, mixon=mixon_matrix)
rb_list_lesson2  

rb_list_lesson2[[1]]  
rb_list_lesson2[['chubb']]

rb_list_lesson2[['jacobs']]
rb_list_lesson2[['jacobs']][1:3,1:17]
rb_list_lesson2[['jacobs']][1:3,1:17][,17]
rb_list_lesson2[['jacobs']][9,10:17] # We have thousands, if not millions, of subsetting combinations.

rb_list_lesson2[['mixon']]

# Let's rbind (row bind) the fantasy points rows for the 3 RBs. We are essentially stacking these rows vertically.
rbind( chubb_fpts = rb_list_lesson2[[1]][9,], jacobs_fpts = rb_list_lesson2[[2]][9,], mixon_fpts = rb_list_lesson2[[3]][9,] )


# And that's all on this lesson involving matrices and lists. Next up, we'll bring in some Excel files that have been saved
# as a .csv file. We'll learn about how R handles datasets that we bring in, and we'll apply many of the functions/concepts from
# lessons 1 and 2 towards a full dataset. We will look at multiple years of player data, at once. Stay tuned.

# Here's a review of the functions we went over in this lesson:

# rep() repeating function, rep(5,10) would repeat 5, 10 times
# na.rm = T
# is.na() returns TRUE/FALSE value
# matrix()  matrix(0, 10, 15) returns a matrix of zeroes with 10 rows and 15 columns
# matrix_name[rows, columns] or matrix_name[a:b,c:d] for range of rows/columns
# matrix_name[,columns] would select all rows and then the columns you selected
# dim() gets rows and columns of your matrix (dim[1] gets you rows, dim[2] gets you columns)
# colnames()
# rownames()
# paste() brings together string elements separated by a space.  paste('deshaun','watson') returns 'deshaun watson'
# paste0() brings together string elements separated by NO space.  paste0('deshaun','watson') returns 'deshaunwatson'
# rbind() and cbind()  rbind() stacks rows vertically, cbind() stacks columns horizontally
# rowSums and colSums
# list() Remember that we can name list elements initially when we create one. list(parta=vectorA, partb=vector)
# list[[element number]] to grab an element in a list
# list[[a]][b] to grab part a from the list, and then display entry b
# We can call matrix and list entries by their row or column name in quotes. demo_list[['element1']]
# ifelse()   ifelse(TRUE/FALSE condition, value if TRUE, value if FALSE) 
# nested ifelse() functions.  Don't forget you need 2 closing parentheses if you have 2 ifelse statmements
# ifelse(T/F condition 1, value if condition1 is TRUE, ifelse(T/F condition 2, value if condition 2 is TRUE, value if both conditions are FALSE ) )
# You can actually nest them more than twice, even. 
# I've nested a couple dozen before when I have a lot of different conditions to check for. Just check your parentheses.

