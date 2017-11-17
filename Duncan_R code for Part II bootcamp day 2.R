########################################
#Introduction to R Programming Part II#
########################################

##########################################
##Loops and Self-defined Functions in R ##
##########################################

#######################
#conditional execution
#######################

#the simplest conditional execution
r=5
if(r==5)x=1
x

#more than 1 statement in the body of if
r=5
if(r==5){
  x=1
  y=2
}
x
y
#more complicated, we have if-else statement

r=6
if (r == 5)   x <- 1    else x=3
x
#else need to be in the same line as if or in the same line as brace

#this code does not work, R will give an error message
r=5
if (r == 5)   x <- 1    
else x=3
#if braces are used, else need to be in the same line as the right brace
if (r == 5) {
  x <- 1
} else x=3

#this code does not work either, R will give an error message
if (r == 5) {
  x <- 1
}
else x=3



#in most cases, we have more than 1 condition. We use nested if-else statement
#if ...else if  ...else
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")



############
#For Loops##
############

#calcuate 1+2+3+...+100

y=0
for(i in 1:100) 
{
  y = y+i
}  
y

x = c(5,12,13) #can change to whatever vector you want
for(n in x) 
  print(n^3)


#more than one statement
y = c()
i=1
for(n in x){
  y[i]=n^2
  i = i + 1
}
y

#nested "for" loops: multiplication table
mymat = matrix(nrow=30, ncol=30) # create a 30 x 30 matrix (of 30 rows and 30 columns)

for(i in 1:dim(mymat)[1])  # for each row
{
  for(j in 1:dim(mymat)[2]) # for each column
  {
    mymat[i,j] = i*j     # assign values based on position: product of two indexes
  }
}

mymat



############
#while loops
############

i <- 1
while (i <= 10) 
{ #if there is only one statement within the loop, no need to use {}
  i <- i+4
  print(i)
}

#the variable i took on the values 1, 5, 9, and
#13 as the loop went through its iterations. In that last case, the condition
#i <= 10 failed, so the break took hold and we left the loop


#another way to do this: we move the condition statement at the end of the loop
#in order to complete the loop, we need to use "break" statement.
#this while loop is actually a "repeat" loop

i <- 1
while(TRUE) { 
  i <- i+4
  print(i)
  if (i > 10) break   #condition execution
}

#we get the same result as that of the first while loop


############
#repeat loop
############
#we also have repeat loop, which is similar to the second type of while loop
i <- 1
repeat { # again similar
  i <- i+4
print(i)
  if (i > 10) break
}


#########################################
#"next" statement and "break" statement#
#########################################

#in addition to break statement, which can be used to jump out of the 
#whole loop, we also have "next" statement which is used for skipping the current
#iteration and continue the next iteration

x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}


#example to explain difference between next and break statement
x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

##################
#useful functions#
##################


#getting help
help(apply) #or use "?"

#variable information
a = c(1,2,3,4,5,6,7,8)
b = matrix(a,2,4,T)
b
length(b)
length(a)
dim(b)
nrow(b)
ncol(b)
class(b)
class(a)

#variable conversion
as.matrix(a)
#zz=as.matrix(a)
as.data.frame(b)

#data selection and manipulation
which.max(a)
which.min(a)
which(a==8)  #index of the element in a that is equal to 8
sort(a) #in increasing order
rev(sort(a)) #in decreasing order
choose(10,2)
sample(a,5,replace=T)
sample(a,5,replace=F)

#Math
max(a)
min(a)
range(a)
sum(a)
mean(a)
median(a)
var(a)
sd(a)
cor(a)
#Matrix algebra
t(b)
c = matrix(c(1,2,3,4),2,2)
#product of two matrices
c%*%b
solve(c)  #inverse of a matrix


#advanced data processing
#apply,lapply,sapply

X<-matrix(rnorm(30), nrow=5, ncol=6)

apply(X,2 ,sum)

#create a list of matrices:
A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C) # display the list

# extract the second column from the list of matrices, using the selection operator "["
lapply(MyList,"[", , 2)

lapply(MyList,"[", 1, ) 

lapply(MyList,"[", 1, 2)

lapply(MyList,"[", 2,1 )

sapply(MyList,"[", 2,1 ) 

sapply(MyList,"[", 2,1, simplify=F) 

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
lapply(x, mean)
# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)

sapply(1:3, function(x) x^2, simplify=T)
sapply(1:3, function(x) x^2, simplify=F)


#model fitting
lm()
glm()
predict()
residuals()


#Distribution
rnorm(10,0,1)
rexp(10,1)
rgamma(10,1,2)


#https://cran.r-project.org/doc/contrib/Short-refcard.pdf



