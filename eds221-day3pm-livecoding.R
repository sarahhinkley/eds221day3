#Looping _iterates_ through a sequence
corals <- c("Porites", "Pocillopora", "Acropora") #remember that the c in this line is the combine function [c()]
for (c in corals) { #c does not need to be used here (it could be x, y, z, etc) you would just need to make sure that same 
                    #variable sits in the parentheses of the print function [print()]
    print(c) #the print function [print()] is necessary inside of a FOR loop because it explicitly sends output to the 
             # console inside loops
}

#It is also common to iterate through the _indices_ of the sequence 
for(i in 1:length(corals)) { #using length() is important because sometimes you may not know how long the vector is
                             #so it is best practice to use length() at the end of the :
    print(corals[i])
} 

#Let's do the fibonacci loop
fibonacci <- integer(6)
fibonacci[1:2] <- 1
for (i in 3:length(fibonacci)) {
    fibonacci[i] <- fibonacci[i-1] + fibonacci[i-2]
}
fibonacci #when you run this with [fibonacci <- integer(6)], i = 6 in the environment because 6 is the last value 
          #in the vector (end point)

#Nested loops iterate over multiple sequences 
small_reef <- matrix(1:9, nrow =  3, ncol = 3)
small_reef
for (r in 1:3) { #this is where the loop starts
  for (c in 1:3) { #this loop is nested within the r loop
    print(paste(r, c, sep = ", "))
    print(small_reef[r, c])
  }
}
#the way the nested loop is set up, r = 1 for the first 3 runs (where c goes through 1, 2, and 3) and after c = 3
#r = 2 for next three runs while c goes through 1, 2, and 3, etc until r = 3 and c = 3 at the same time

#Change the next two lines only such that the output is 1-9
#rather than 1, 4, 7, 2, 5, 8, 3, 6 , 9
for (r in 1:3) {
  for (c in 1:3) {
    print(paste(r, c, sep = ", "))
    print(small_reef[r, c])
  }
}

#Changed version
#swapping the c and r lets you loop through columns before rows
#row and column are not being iterated through in parallel, the inner loop iterates through before the outer loop
#in this case, the r must go through 1, 2, 3 before c can go to 2 (for every run through the c loop, 
# there are 3 runs through the r loop)
for (c in 1:3) {
  for (r in 1:3) {
    print(paste(r, c, sep = ", "))
    print(small_reef[r, c])
  }
}

#Loop through randomly sampled initial starting locations
reef <- matrix(0, nrow = 5, ncol = 5)
set.seed(123)
random_coral <- sample(1:25, size = 8)
for(rc in random_coral) {
  rc_row <- (rc - 1) %/% 5 + 1 #recall %/% is how many times that number can be divided into the other
  rc_col <- (rc - 1) %% 5 + 1 #recall %% is the remainder
  reef[rc_row, rc_col] <- 1 
}
reef

#Combining loops with conditional statements
for (r in 1:5) {
  for (c in 1:5) {
    if (reef[r, c] == 1) {
      print(paste(r, c, sep = ", ")) #paste function [paste()] allows us to bring multiple things together to print one thing
                                     #at the console (print function will not let us put two different items in the console)
    }
  }
}
  