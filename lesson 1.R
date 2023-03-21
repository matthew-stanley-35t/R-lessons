
# Lesson 1

# I'm glad you took the leap of faith and have decided to improve your analytical
# skillset with R! Let's dive right in...

# First, we're going to calculate passer rating in R.  As you'll quickly notice by
# the colors of this text (green), you can create a "comment" by typing a hashtag.
# This is helpful for inserting context into your R code.

# Let's start by creating a variable.  In R, you'll get very fast/comfortable with
# typing the arrow symbol, called the assignment operator  <-  (less than sign and a dash)
# Yes, you can usually just use the = sign and get away with it...
# However, you'll look like a coding novice, and there is the occasional,
# complex situation where your code won't run like you thought it would.
# Which is to say, that I'll always be using <- and recommend you do as well.


# Passer Rating requires 5 input variables, so let's create them.
# To run a line of code, click anywhere on that line and then,
# on a Mac, hit Command+Enter, and on Windows hit Ctrl+Enter
# Let's run some code!
# First, we create a new variable attempts, and assign it to 502 (run 1st line of code).
# Now, if we run the word attempts in R (the 2nd line of code), we see that at the bottom, in the console,
# it spits out 502. We can also take the value stored in a variable and do
# various mathematical operations with it, like multiplying it by 4 (3rd line of code).

attempts <- 502
attempts
attempts * 4

# Notice that because we didn't use the assignment operator, attempts isn't 2008,
# it's still preserved at 502.
attempts

# Now, let's bring in the other necessary variables and calculate passer rating.
completions <- 343
passing_yards <- 4643
passing_touchdowns <- 45
interceptions <- 6

# Passer rating is actually quite a large formula, so we'll break it into 4 parts,
# store those values, then get a nice, clean, final product.
part1 <- ( (completions/attempts) -.3) * 5
part1
(completions/attempts-.3) * 5 # notice that running this line produces the same
# stored value as in "part1"  This is because R respects order of operations,
# so it divides before subtracting. But, I like to be safe, so I added the extra
# parentheses. No harm in being careful.


part2 <- ( (passing_yards/attempts) - 3) * .25
part2

part3 <- (passing_touchdowns/attempts) * 20

part4 <- 2.375 - ( (interceptions/attempts) * 25 )


# For the final step, we sum the parts, divide by 6, and multiply by 100
# Do you know which QB had this historic season?
passer_rating <- ( (part1 + part2 + part3 + part4)/6 ) * 100
passer_rating
# Nobody cites multiple decimal places for passer rating.
# To make it look good, let's use the round function to chop it down to 1 decimal.
# We overwrite the passer_rating variable with itself, rounded to 1 decimal place.
passer_rating <- round(passer_rating,1)
passer_rating
# Answer: Aaron Rodgers in 2011

# Let's give Rodgers credit for his passer rating
aaron_rodgers_2011 <- passer_rating
aaron_rodgers_2011

# Aaron Rodgers did this in only 15 games during 2011.
# How many fantasy points per game did he have this year?

# I'll frequently use PPR (points per reception) scoring for fantasy in these 
# tutorials unless otherwise noted. Sorry, not sorry. Also, if you absolutely
# positively need to use your special devy league's ultra-secret scoring system
# that nobody but you and your friends understand, that's fine. You can amend all 
# the lessons if you aren't satisfied with this default scoring system in my lessons.

# We need to create more variables before we can calculate Rodgers' fantasy points.
fumbles <- 5
rushing_yards <- 257
rushing_touchdowns <- 3 
rodgers_2011_fpts <- (passing_yards / 25.0) + (passing_touchdowns * 4.0) - (interceptions * 1.0) -
  (fumbles * 2.0) + (rushing_yards / 10.0) + (rushing_touchdowns * 6.0)
rodgers_2011_fpts
rodgers_2011_fpts_pergame <- round(rodgers_2011_fpts / 15.0 , 1)
rodgers_2011_fpts_pergame # I'd say that's a solid average, 26.2

# Yes, we just took 60 lines of code to calculate Rodgers' passer rating and fantasy
# points per game from 2011.  We could also have done it like so, but it's messy.
# And, if we get the wrong answer when checking with Pro Football Reference, 
# we will have a very hard time troubleshooting to figure out where we went wrong.

pray_its_correct <- round( ( (343/502-.3)*5 + (4643/502-3)*.25 + (45/502)*20 + (2.375-(6/502*25)) )/6.0 * 100 ,1)
pray_its_correct



# There will be more time to practice variables in Worksheet 1, which accompanies this R script. Also, if
# some of the concepts are initially confusing, take a break after this lesson, then review it all the way
# through a 2nd time. I assure you the concepts get progressively easier each time you go through the lesson.
# It's like learning a new language. The more you practice it, the better you get.

# Now that we've seen R can be a calculator, let's dive into vectors, a very
# important structure in R. Since we harkened back all the way to 2011 for that ancient Aaron
# Rodgers example, let's look at Christian McCaffrey's 2019 performance. Whether you're talking strictly
# football skill, strictly fantasy football prowess, or a combination, McCaffrey had himself a year.

# To create a vector, all we really need is this:  c()
# The little c stands for concatenate, and all it really does it keep the elements within it in order and 
# easily accessible.
# Let's make a vector "carries_CMC_2019" for Christian McCaffrey's (CMC) carries per week for all 16 games in 2019.
carries_CMC_2019 <- c(19, 16, 24, 27, 19, 22, 14, 24, 20, 14, 22, 14, 11, 19, 13, 9)
carries_CMC_2019

# We can easily peek at a particular game's carry total like so.
# You may notice that RStudio is smart, and can anticipate what you're likely typing.  As you type out 
# carries_CMC_2019, you'll notice RStudio prompts you with this variable in a floating box next to your typing.
# If you hit tab, RStudio will autocomplete that variable/command you're typing.
carries_CMC_2019[5] # Game 5 carries
carries_CMC_2019[8] # Game 8 carries
carries_CMC_2019[11]
# We can use a colon to specify a range.  Let's see what entries 7-10 of this vector look like.
carries_CMC_2019[7:10]

# We can see how many carries he had in the first 8 games of the season, using the sum function.
sum(carries_CMC_2019[1:8])

# How many carries he had in the last 8 games
sum(carries_CMC_2019[9:16])

# We can see the maximum number of carries he received in any game with the max function.
max(carries_CMC_2019)

# We can see the minimum number of carries with the min function
min(carries_CMC_2019)

# We can compute the range of his carries like so
max(carries_CMC_2019) - min(carries_CMC_2019)

# Or, we can just use the range function
range(carries_CMC_2019)

# We can see his average carries per game with the mean function.
mean(carries_CMC_2019)

# We can see his average carries per game in games 3-12 with the mean function and a colon
carries_CMC_2019[3:12]
mean(carries_CMC_2019[3:12])

# And standard deviation with the sd function
sd(carries_CMC_2019)

# Did CMC have any games with carries +/- 1 standard deviation from the mean?
# Don't worry, we'll tackle this in a few steps.
# For that, let's learn about boolean expressions, as well.
# At its essence, a boolean expression is really just a TRUE/FALSE statement.

# Let's check this out quickly by seeing if CMC's game 7 carries was greater than 20
carries_CMC_2019[7]
carries_CMC_2019[7] > 20 # looks like he had 20 or fewer carries in game 7
carries_CMC_2019[7] >= 10 # he had at least 10 carries in game 7
# Double equals sign is used for equivalency. Let's see if he had 14 carries in game 7
carries_CMC_2019[7]==14 # Nailed it.
# We can also use != to symbolize not equivalent. The exclamation point always means "not" in R
carries_CMC_2019[7]!=5 # TRUE.  His game 7 carries total was NOT equivalent 5.

# Now, back to if CMC had any games with carries +/- 1 standard deviation from the mean...
mean_cmc_carries <- mean(carries_CMC_2019)
sd_cmc_carries <- sd(carries_CMC_2019)
upperbound <- mean_cmc_carries + sd_cmc_carries
upperbound
lowerbound <- mean_cmc_carries - sd_cmc_carries
# Rather than typing out lowerbound to see the value stored in this variable,
# we can double click and highlight the word lowerbound, and then run only that piece of code.
# Also, if we go down to the Console area, we can type in lowerbound and just hit Enter.
# There's almost always multiple ways to get anything done in R, so find what works for you.

# We want to see if any of the 16 entries in his carries vector were above the upperbound
# or below the lowerbound. Let's check each individually, first.
carries_CMC_2019 > upperbound # Notice that we get 16 TRUE/FALSE.
# We can see that game 1 is a FALSE, since CMC had only 19 carries that game, less than the upperbound of 23.
# We can see that game 4 was a TRUE, since CMC had 27 carries that game, greater than the upperbound of 23.

# We can even look at whether or not McCaffrey's carries were below the lowerbound now. 
carries_CMC_2019 < lowerbound # we can see games 13 and 16 are below. 

# Now, let's learn the "or" command to see which games were above that upperbound
# OR below that lowerbound.  Or is represented by |
carries_CMC_2019 < lowerbound | carries_CMC_2019 > upperbound
# And there, in a gorgeous line of code, we have his games with carries +/- 1 standard deviation from the mean

# TRUE/FALSE boolean expressions have integers working on the back-end.  TRUE is 1, FALSE is 0.
# Here, we can see that 5 games were above or below 1 standard deviation.
sum(carries_CMC_2019 < lowerbound | carries_CMC_2019 > upperbound)

# We can also test that TRUE is 1, and FALSE is 0
TRUE==1
FALSE==0
TRUE==0
FALSE==1
TRUE!=0
FALSE!=0
!(TRUE==0) # I know this is absolutely gross to look at or think about, but it does work.

# Another thing about OR is it only needs 1 command to be correct to return a true...
# Think about OR as incorporating the word "either"
# CMC had over 300 carries in 2019 OR CMC had over 50 carries in the first 3 games. Is either statement TRUE?
# If either statement is TRUE, we'll get R to return a TRUE.
sum(carries_CMC_2019) > 300 | sum(carries_CMC_2019[1:3]) > 50
# While he had under 300 total carries in 2019, he did have over 50 carries through 3 weeks.

# What if both statements in the OR are FALSE? R returns a FALSE.
sum(carries_CMC_2019) > 300 | carries_CMC_2019[10]==21
# R returned a FALSE, since neither side of the OR is TRUE

### Now, let's learn about the AND (&) command. This will be the final item we'll learn relating to comparisons for now,
# and after learning the & command, you'll have all the tools necessary to make all different comparisons.
# For the & command to be TRUE, both sides of the statement need to be correct.
# Let's run the statements from before through the & command to see how they contrast with |

sum(carries_CMC_2019) > 300 & carries_CMC_2019[10]==21 # This is FALSE, too

sum(carries_CMC_2019) > 300 & sum(carries_CMC_2019[1:3]) > 50 # Now, this statement is FALSE

# We need both sides to be TRUE to return a TRUE
# Now, we get a TRUE when running this statement, since both aspects of it are TRUE
sum(carries_CMC_2019) <= 300 & mean(carries_CMC_2019) < 20

# We can get very complex and creative with mixing AND, OR, NOT, and EQUIVALENT

# This & statement from before was FALSE, so adding parentheses with the ! symbol,
# it is TRUE.  Because we would correctly say that this statement is NOT correct.
# It's very confusing initially, but with a bit of practice, I assure you it becomes second nature.
!(sum(carries_CMC_2019) > 300 & sum(carries_CMC_2019[1:3]) > 50)

# Here's another tough one... the standard deviation is 5.157115 originally
round( sd(carries_CMC_2019) ,0 ) == 5

# Let's see if CMC had more than 9 games with at least 15 carries
sum(carries_CMC_2019 >= 15) > 9 # Yes, he did.

# We can't unfortunately compare quantities shorthand like so
9 > (5*1.3) > 1

# But, we can do it with &
9 > (5*1.3) & (5*1.3) > 1

# Here's a very fun one.  By clicking just to the right of the opening/closing parentheses or brackets,
# we notice that RStudio highlights the opening/closing parenthesis/bracket that accompanies it.
# This can be helpful if you get lost in the parentheses, which can happen to the best of us.
(sum(carries_CMC_2019[4:12] > 15) == 6 & (TRUE == (0+1) ) ) | 10==9
# After this lesson, go back to this if you want, and try to break it down and figure out why it's TRUE


# Going back to vectors, let's try manipulating a vector.
# Here, we have CMC's rushing yards per game in 2019.
rushyards_CMC_2019 <- c(128, 37, 153, 93, 176, 31, 117, 146, 108, 70, 64, 44, 53, 87, 54)
sum(rushyards_CMC_2019)

# Before we manipulate this vector, let's see how many entries are here with the length() function.
length(rushyards_CMC_2019) # There's only 15 entries in here...
length(rushyards_CMC_2019)==15 # This is TRUE

# Whoops! I didn't include his Game 16 rushing output.  CMC had 26 rush yards in game 16
# Let's use c() to add in another entry to this vector
c(rushyards_CMC_2019,26)
rushyards_CMC_2019 # Whoops again, we forgot to re-assign the vector to commit it to storage

rushyards_CMC_2019 <- c(rushyards_CMC_2019,26)
rushyards_CMC_2019 # BAM, we just manipulated that vector.  All fixed.

sum(rushyards_CMC_2019) # He had 1387 rushing yards in 2019
length(rushyards_CMC_2019) # Now we have 16 entries

# Let's say I gave you all but game 5's monster performance.
# How do we insert an entry into the middle of this vector?
rushyards_CMC_2019 <- c(128, 37, 153, 93, 31, 117, 146, 108, 70, 64, 44, 53, 87, 54, 26)

c(rushyards_CMC_2019[1:4],176, rushyards_CMC_2019[5:15]) # All better, now let's re-assign the rushyards vector
rushyards_CMC_2019 <- c(rushyards_CMC_2019[1:4],176, rushyards_CMC_2019[5:15])
rushyards_CMC_2019
sum(rushyards_CMC_2019) # Okay, good. Back at 1387 rushing yards

# Let's bring in CMC's receiving yards per game in 2019, since that accounts for a lot of his yardage total.
# 1387 yards is selling the man quite short.
recyards_CMC_2019 <- c(81 ,16, 35, 86, 61, 26, 38, 20, 33, 121, 69, 58, 82, 88, 119, 72)
sum(recyards_CMC_2019) # 1005 receiving yards in 2019

# We could figure out his total scrimmage yards in several different ways, here's 2 of them:

# Way 1
sum(recyards_CMC_2019) + sum(rushyards_CMC_2019)

# Way 2
recyards_CMC_2019 + rushyards_CMC_2019 # This adds up all the entries in each vector
# Now, we see that in game 1, he had 209 scrimmage yards.
# We can apply the sum function to this vector sum, rather than 2 separate sums like before
sum(recyards_CMC_2019 + rushyards_CMC_2019)


# How many games did he have with 200+ scrimmage yards
(recyards_CMC_2019 + rushyards_CMC_2019) >= 200
sum( (recyards_CMC_2019 + rushyards_CMC_2019) >= 200 )

# Let's just say I wanted to redo the recent coding output that showed CMC's total yards
# in each game. I can just click into the console, and click the UP arrow on the keyboard
# to cycle through my recent commands.


# Let's check out another built-in function in R. Don't worry, this is one of 3 remaining
# functions that I'll introduce right now. I'll review them all at the end of this lesson. 
# This next function is a bit more impressive than R simply knowing how to sum a few numbers together.
# Let's look at a cumulative sum of CMC's carries and scrimmage yards over time in 2019
# We use the cumsum() function.
cumsum(carries_CMC_2019)

# Let's look at his rushyards, receiving yards, and total yards over time.
cumsum(rushyards_CMC_2019)
cumsum(recyards_CMC_2019)
cumsum(rushyards_CMC_2019 + recyards_CMC_2019)

# Let's see how many games it took him to reach 1000 total yards
cumsum(rushyards_CMC_2019 + recyards_CMC_2019) >= 1000
sum(cumsum(rushyards_CMC_2019 + recyards_CMC_2019) >= 1000)
# There were 10 games during the season where after the game, he sat at over 1000 yards

# We see that after game 7, he hit 1000 yards, using the which function
# The which function highlights all values in the vector that are TRUE
which(cumsum(rushyards_CMC_2019 + recyards_CMC_2019) >= 1000)

which(cumsum(rushyards_CMC_2019 + recyards_CMC_2019) >= 2000) # After game 14, he crossed 2000 yards

# Let's say we wanted to know CMC's running average of total yards per game
# We can easily see what his yards per game was overall...
sum(rushyards_CMC_2019 + recyards_CMC_2019) / 16.0 # 149.5 yards per game

# But, I want to know the running average of his yards per game.
# If we take cumsum and divide by 16, we don't get what we want
cumsum(rushyards_CMC_2019 + recyards_CMC_2019)/16
# I don't think CMC actually averaged 28 total yards per game through 3 games.
# Though, the 16th game looks right, as we see trusted 149.5 in the final position now.

# This will be the final built-in function I go over in detail.
# And we will learn about RStudio's help menu in the process.

# We are going to learn about generating a sequence in R,
# and figure out CMC's running average of total yards per game over time, as well.
# The seq() function will help us here.
# Great, how does it work? What if, mid-creating this script, I forgot how seq() worked,
# but I did vaguely remember this function...
# Let's consult the help menu, which works for almost every function.
# Type a ? followed by the function, without a space in between
?seq

# We see that when we run that line, RStudio pulls up a help menu.
# Oh, that's right, I need to specify from, to, and by
# Here, we have a sequence, from 1 to 16, by 1
seq(from = 1, to = 16, by = 1)
length( seq(from = 1, to = 16, by = 1) ) # This sequence has 16 entries
seq(from = 1, to = 16, by = 0.5) # Now we go by 0.5

# We can even, if feeling cocky, skip the keywords, and just preserve their order
seq(1, 16, 1) # Still works.

cumsum(rushyards_CMC_2019 + recyards_CMC_2019)
# We ideally want 209 yards from game 1 to be divided by 1,
# since only 1 game has happened at this time.
# And we want 262 to be divided by 2, since only 2 games had happened at that time.
# And 450 divided by 3, since 3 games had passed by that time.
# Do you see what I'm hinting at? I think our sequence from before perfectly sets us up
# for some nice vector and sequence division, all while using the cumsum function as well.
# Let's look at the 2 parts one more time. Then, we can divide and conquer.
cumsum(rushyards_CMC_2019 + recyards_CMC_2019)
seq(from=1,to=16,by=1)
cumsum(rushyards_CMC_2019 + recyards_CMC_2019) / seq(from=1,to=16,by=1)

# Let's round the numbers to make it more manageable. Note that by leaving the amount
# of decimal places I want blank, R chops off all decimals automatically.
round( cumsum(rushyards_CMC_2019 + recyards_CMC_2019) / seq(1,16,1) )

# Actually, let's keep 1 decimal point.
round( cumsum(rushyards_CMC_2019 + recyards_CMC_2019) / seq(1,16,1) , 1)

# How many games did he finish where he was averaging 150+ total yards per game
round( cumsum(rushyards_CMC_2019 + recyards_CMC_2019) / seq(1,16,1) , 1) >= 150
# Wow, after 13 of his games, CMC averaged 150+ total yards per game.
sum(round( cumsum(rushyards_CMC_2019 + recyards_CMC_2019) / seq(1,16,1) , 1) >= 150)


# To review, let's look at what we've learned already, along with a couple extra tidbits.

# Basic math operations:
  # +   -    *    /    ()
  # ^ is the operation for "to the power of"
  # On your own, you can play around with this one
  # try 6^2 and see what you get
  # try (carries_CMC_2019[8])^2 and see what you get
  # try your hand with square root, the sqrt() function
  # sqrt(144)
  # sqrt(carries_CMC_2019[8])
  # sqrt( (carries_CMC_2019[8])^2 )
  # 5^3
  # If you run the command pi you get 3.141593

# Statistical functions:
  # sum(), sd(), mean(), min(), max(), range(), cumsum()
  # Another one you can use is median(), which works just as expected

# Comparisons/evaluators
  # ==   |   &   ! (equivalency, or, and, not)
  # I guess the which() function goes in this bucket?

# Vectors and vector manipulation
  # c()   c()[]    c()[:] (create a vector, select a single entry in the vector, select a range in the vector)

# Other functions
  # seq(from = , to = , by = )
  # You can even do sequences with negative numbers... try seq(from = 10, to = -10, by = -2)



#####################################################################################################################################
# TAKE A BREAK. STRETCH. TOSS A FOOTBALL. EXERCISES IN THE WORKSHEET FOR THIS LESSON WILL HELP SOLIDIFY THESE CONCEPTS FOR YOU.
# PAT YOURSELF ON THE BACK FOR MAKING IT TO THIS POINT. IT WILL ONLY GET MORE INTERESTING FROM HERE.
#####################################################################################################################################









