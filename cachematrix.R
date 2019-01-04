## Put comments here that give an overall description of what your
## functions do

m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1


## caches a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- matrix()
    set <- function(y) {
        x <<- y
        i <<- matrix()
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## returns inverse matrix from cache (if available)

cacheSolve <- function(x, ...) {
    i <- x$getinv()
    
    if(!is.null(i)) {
        message{"getting cached data"}
        i
    }
        
    data <- x$get()
        i <- solve(data, ...)
        
    x$setinv(i)
    i
}
my_matrix <- makeCacheMatrix((matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)))   
cacheSolve(my_matrix)