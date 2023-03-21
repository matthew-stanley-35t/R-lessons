
###### Worksheet 1

# All answers for every problem are located at the bottom of this worksheet. Try not to peek,
# and give honest effort. The less peeking, the more these concepts will stick. If you have
# spent more than 5-10 minutes on any particular problem and are still stuck, yes you should
# peek. It's supposed to be fun, as well.


### Exercise 1:

# A) Calculate this QB's Passer Rating, QB revealed below in the Answers section.
# 453 attempts, 246 completions, 2883 yards passing, 13 touchdowns, 18 interceptions

qb1attempts <- 453
qb1completions <- 246
qb1passyards <- 2883
qb1touchdowns <- 13
qb1interceptions <- 18

part1 <- ((qb1completions/qb1attempts) -.3 ) * 5
part2 <- ((qb1passyards/qb1attempts) -3) * .25
part3 <- (qb1touchdowns/qb1attempts) *20
part4 <- 2.375 - ((qb1interceptions/qb1attempts) *25)
passer_rating <- ( (part1 + part2 + part3 + part4)/6 ) * 100
passer_rating

# B) This quarterback also had 28 rushing yards, no rushing touchdowns, and 14 fumbles.
# Calculate their total fantasy points. (4 pts PassTD, PassYds/25, Ints are -1, 
# fumbles are -2, RushYds/10, 6 pts RushTD)

qb1rushyards <- 28
qb1rushTds <- 0
qb1fumbles <- 14
qb1_fpts <- (qb1passyards / 25.0) + (qb1touchdowns * 4.0) - (qb1interceptions * 1.0) -
  (qb1fumbles * 2.0) + (qb1rushyards / 10.0) + (qb1rushTds * 6.0)
qb1_fpts


# C) This QB started 15 games, calculate their per game fantasy points.
qb1_fpts_pergame <- round(qb1_fpts/15.0, 1)
qb1_fpts_pergame


### Exercise 2:

# A) Using the carries and rushing yards vectors from lesson 1, 
# calculate Christian McCaffrey's yards per attempt overall in 2019.
carries_CMC_2019 <- c(19, 16, 24, 27, 19, 22, 14, 24, 20, 14, 22, 14, 11, 19, 13, 9)
rushyards_CMC_2019 <- c(128, 37, 153, 93, 176, 31, 117, 146, 108, 70, 64, 44, 53, 87, 54, 26)

ryrds_att_CMC_2019 <- mean((sum(rushyards_CMC_2019))/(sum(carries_CMC_2019)))
ryrds_att_CMC_2019

# B) Calculate his yards per attempt, for each individual game, in 2019.
ryrds_att_bygame_CMC_2019 <- round(rushyards_CMC_2019/carries_CMC_2019, 1)
ryrds_att_bygame_CMC_2019

# C) How many games in 2019 did he average at least 5.0 yards per carry?

sum(ryrds_att_bygame_CMC_2019 >= 5)

# D) What was his max yards per carry in any game in 2019?

max(ryrds_att_bygame_CMC_2019)

# E) Once you have his yards per carry in each of the 16 games, calculate his median yards per carry in 2019.
# Are the mean and median different?

median(ryrds_att_bygame_CMC_2019)

### Exercise 3:

# A) Generate a sequence from 0 to 100, by 5.

seq(0, 100, 5)

# B) What's the length of that sequence? Is the length what you thought it would be?

length(seq(0,100,5))

# C) Generate a sequence from -75 to 51, by 4. What happens in R when the sequence doesn't fit perfectly between the 2 numbers?

seq(-75, 51, 4)


### Exercise 4:

# Here, you have 2 vectors, each representing All-Pro defensive seasons.
# We have JJ Watt's 2012 campaign, and Aaron Donald's 2018 season. The stat is sacks.

watt_2012_sacks <- c(0.5, 1.5, 2.5, 2.0, 1.0, 2.0, 0.0, 1.0, 0.0, 1.0, 3.0, 2.0, 0.0, 3.0, 1.0, 0.0)
donald_2018_sacks <- c(0.0, 0.0, 0.0, 2.0, 1.0, 1.0, 4.0, 2.0, 0.0, 2.5, 2.0, 2.0, 0.0, 0.0, 3.0, 1.0)

# A) How many sacks did each player have in these seasons?

sum(watt_2012_sacks)
sum(donald_2018_sacks)

# B) Show that these seasons have an equivalent amount of sacks.

(sum(watt_2012_sacks) == sum(donald_2018_sacks) )

# C) Get a running total of each player's sacks for the season.

cumsum(watt_2012_sacks)
cumsum(donald_2018_sacks)

# D) How many sacks did Aaron Donald have in games 4-12, a 9 game sample?

sum(donald_2018_sacks[4:12])

# E) How many sacks did Aaron Donald have, on average, in games 4-12?

sum(donald_2018_sacks[4:12])/9

# F) I want to know which games JJ Watt had more sacks than Aaron Donald. (Hint: Take Watt's vector and
# subtract Donald's vector, then set that subtraction problem greater than zero, and use the which function)

which((watt_2012_sacks - donald_2018_sacks) > 0)

# G) Who had the higher median sacks per game?

median(watt_2012_sacks)
median(donald_2018_sacks)

# H) Compare standard deviations. Which player was more consistent (lower standard deviation)?

sd(watt_2012_sacks)
sd(donald_2018_sacks)

# I) Who had more sacks in games 11-16?

sum(watt_2012_sacks[11:16])
sum(donald_2018_sacks[11:16])

# J) I want to know when Watt and Donald's total combined sacks hit 25. After how many games did they combine
# for 25+ sacks? You'll need to use cumsum() and which(), this one is difficult.

which(cumsum(watt_2012_sacks + donald_2018_sacks) > 25)

# K) How many games did JJ Watt get at least 1.0 sacks AND Aaron Donald got at least 1.0 sacks?

sum(watt_2012_sacks >= 1 & donald_2018_sacks >=1)

# L) How many games did JJ Watt get at least 1.0 sacks OR Aaron Donald got at least 1.0 sacks?

sum(watt_2012_sacks >= 1 | donald_2018_sacks >=1)

### Exercise 5:

# A) As the eccentric, professional football scout that I am, I have encountered a peculiar running back
# that I quickly fell in love with. However, the scouting director wants to be sure this guy will rush for over
# 1000 yards in a 16 game season.  This running back, I have nicknamed him "Slow starter, big finisher."
# His first 10 carries of the game are 1 yard for 1st carry, 2 yards for 2nd carry, all the way up to 10 yards
# for his 10th carry. When he is able to get more than 10 carries, each carry over carry number 10 is for 15 yards.
# I'm told that as a rookie, he'd be eased in during the season. His projected carries for this analysis is
# all I have available for you right now. Will this running back get over 1000 rushing yards in this projection 
# to satisfy the scouting director?
projected_carries <- c(5, 5, 5, 5, 5, 10, 10, 10, 10, 10, 15, 15, 15, 20, 20, 20)

first5_games <- 5 * sum(seq(1,5,1))
games_6thru10 <- 5 * sum(seq(1,10,1))
games_11thru13 <- 3 * ( sum(seq(1,10,1)) + ( (15-10) * 15 ) )
games_14thru16 <- 3 * ( sum(seq(1,10,1)) + ( (20-10) * 15 ) )

(first5_games + games_6thru10 + games_11thru13 + games_14thru16) >= 1000
first5_games + games_6thru10 + games_11thru13 + games_14thru16

# B) Okay, I got back on the line with the scouting director, and he told me he was messing around about the carries projection.
# He says the rookie would get 11 carries every game. In this scenario, does the RB still reach 1000 yards over 16 games?

(sum(seq(1,10,1)) + 15) * 16

### Exercise 6:

# A) Imagine a sequence of numbers from 7 to 7834, by 12.  Let's get a cumulative sum of the entries going for the first part.

sum(seq(7, 7834, 12))

# B) Now I want to know the running sum of the first 75 entries in this sequence. (Hint: You can subset a cumsum(),
# just like a vector)

cumsum(seq(7,7834,12))[1:75]

# C) What is the length of the sequence from 7 to 7834, by 12?

length(seq(7, 7834, 12))

# D) Now, I have another sequence from 1 to 5671, by 13. Which sequence has a larger 13th entry.

seq(7, 7834, 12)[13]
seq(1,5671, 13)[13]

# E) Now, compare running sums of the sequence entries.  Which one is larger at entry 13?

cumsum(seq(7,7834,12))[13]
cumsum(seq(1,5671,13))[13]



########### Worksheet 1 Answers


### Exercise 1 Answer:

# A) 

attempts <- 453
completions <- 246
passing_yards <- 2883
passing_touchdowns <- 13
interceptions <- 18

part1 <- ( (completions/attempts) -.3) * 5
part2 <- ( (passing_yards/attempts) - 3) * .25
part3 <- (passing_touchdowns/attempts) * 20
part4 <- 2.375 - ( (interceptions/attempts) * 25 )


passer_rating <- ( (part1 + part2 + part3 + part4)/6 ) * 100
passer_rating <- round(passer_rating,1)
passer_rating

# B)

rushing_yards <- 28
rushing_tds <- 0
fumbles <- 14

fpts <- (passing_touchdowns * 4.0) + (passing_yards / 25.0) - (interceptions * 1.0) +
  (rushing_yards / 10.0) + (rushing_tds * 6.0) - (fumbles * 2.0)
fpts

# C)

fpts_pergame <- round(fpts / 15.0 ,1)
fpts_pergame # Not quite the 26.2 that Rodgers averaged in 2011...

# This amazing season is courtesy of Mark Sanchez in 2012.
# Need a coding break? Google "Mark Sanchez fumble" and enjoy his famous fumble.




### Exercise 2 Answer:

# A)

carries_CMC_2019 <- c(19, 16, 24, 27, 19, 22, 14, 24, 20, 14, 22, 14, 11, 19, 13, 9)
rushyards_CMC_2019 <- c(128, 37, 153, 93, 176, 31, 117, 146, 108, 70, 64, 44, 53, 87, 54, 26)

yards_per_carry <- sum(rushyards_CMC_2019) / sum(carries_CMC_2019)
round(yards_per_carry,1)

# B)

ypc_pergame <- round( rushyards_CMC_2019 / carries_CMC_2019 ,1)
ypc_pergame

# C)

sum( ypc_pergame >= 5.0 )

# D)

max(ypc_pergame)

# E)

round(median(ypc_pergame) ,1)
round(mean(ypc_pergame) ,1)
round(yards_per_carry,1)




### Exercise 3 Answer:

# A)

seq(0,100,5)

# B)

length(seq(0,100,5))
# Length is 21, not 20, since while 100/5 = 20,
# we are also including the starting point, 0,
# as well.

# C)

seq(-75,51,4)
# Note that the sequence stops at 49, rather than 51.





### Exercise 4 Answer:

watt_2012_sacks <- c(0.5, 1.5, 2.5, 2.0, 1.0, 2.0, 0.0, 1.0, 0.0, 1.0, 3.0, 2.0, 0.0, 3.0, 1.0, 0.0)
donald_2018_sacks <- c(0.0, 0.0, 0.0, 2.0, 1.0, 1.0, 4.0, 2.0, 0.0, 2.5, 2.0, 2.0, 0.0, 0.0, 3.0, 1.0)

# A)

sum(watt_2012_sacks)
sum(donald_2018_sacks)

# B)

sum(watt_2012_sacks) == sum(donald_2018_sacks)

# C)

cumsum(watt_2012_sacks)
cumsum(donald_2018_sacks)

# D)

sum(donald_2018_sacks[4:12])

# E)

sum(donald_2018_sacks[4:12]) / 9
# Nearly 2 sacks a game on average over a 9 game period!

# F)

which( (watt_2012_sacks - donald_2018_sacks) > 0 )

# G)

median(watt_2012_sacks)
median(donald_2018_sacks)

# H)

sd(watt_2012_sacks) 
sd(donald_2018_sacks)

# Watt was more consistent (lower sd)

# I)

sum(watt_2012_sacks[11:16]) > sum(donald_2018_sacks[11:16])
# Watt had more sacks during that stretch.

# J)

which( cumsum(watt_2012_sacks + donald_2018_sacks) >= 25 )

# After 11 games, they had combined for 25+ sacks.

# K)

sum( watt_2012_sacks >= 1.0 & donald_2018_sacks >= 1.0 )

# L)

sum( watt_2012_sacks >= 1.0 | donald_2018_sacks >= 1.0 )




### Exercise 5 Answer:

# A)

projected_carries <- c(5, 5, 5, 5, 5, 10, 10, 10, 10, 10, 15, 15, 15, 20, 20, 20)

first5_games <- 5 * sum(seq(1,5,1))
games_6thru10 <- 5 * sum(seq(1,10,1))
games_11thru13 <- 3 * ( sum(seq(1,10,1)) + ( (15-10) * 15 ) )
games_14thru16 <- 3 * ( sum(seq(1,10,1)) + ( (20-10) * 15 ) )

(first5_games + games_6thru10 + games_11thru13 + games_14thru16) >= 1000
first5_games + games_6thru10 + games_11thru13 + games_14thru16
# He gets 1355 rushing yards, well over 1000.

# B)

consistent_carries <- 16 * ( sum(seq(1,10,1)) + 15 )
consistent_carries
consistent_carries >= 1000
# Now, he rushes for 1120 yards.



### Exercise 6 Answer:

# A)

cumsum(seq(7,7834,12))

# B)

cumsum(seq(7,7834,12))[75]
# Pretty cool that we can casually pluck the 75th entry in
# a running sum from 7-7834 by 12...

# C)

length(seq(7,7834,12))

# D)

seq(1,5671,13)[13] > seq(7,7834,12)[13]

# E)

cumsum(seq(1,5671,13))[13] == cumsum(seq(7,7834,12))[13]
# Both sequences have 1027 as the 13th entry.


### Congratulations, you made it through the worksheet. Here's a fun fact.
# Joey Galloway had over 10000 career receiving yards, including 6 seasons of
# 1000+, and 3 seasons with 1000+ yards and 10+ TDs.  Yet he never made a Pro Bowl.




