userDat    <- read.table("Data/userData.txt",
                         header = T, row.names = 1, as.is = T,
                         sep = "\t", fill = T)
movieDat   <- read.table("Data/movieData.txt",
                         header = T, row.names = 1, as.is = T,
                         sep = "\t", quote = "")
ratingsDat <- read.table("Data/ratingsData.txt",
                         header = T, as.is = T, sep = "\t")

## make a matrix of ratings
## maybe it will be helpful to have a simple list of movie ids
mov <- rownames(movieDat)
## and a simple list of user ids
usr <- rownames(userDat)

## start with all na's in the matrix
ratMat <- matrix(rep(NA, length(mov) * length(usr)),
                 nrow=length(mov)) #
## add row and col names
rownames(ratMat) <- mov
colnames(ratMat) <- usr

## and fill it up with ratings
for (i in 1:dim(ratingsDat)[1]) {
    n_r <- as.character(ratingsDat[i,2])
    n_c <- as.character(ratingsDat[i,1])
    ratMat[n_r, n_c] <- ratingsDat[i,3]
}


## here is a list of all possible genre names
genres <- colnames(movieDat)[7:20]

## the age data is numerical, but it might be useful to
## divide it into groups for some applications.
#### first I looked at a summary of ages

summary(userDat$age)

genderCol c("yellow","blue")
names(genderCol)=c("M","F")  #### set up colors to indicate gender
