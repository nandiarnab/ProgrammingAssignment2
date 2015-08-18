## This file contains two functions. One of this creates a special matrix
## that is a list of functions to set, get the matrix, and set and get the
## inverse of a matrix.
## The other function solves the inverse of the matrix, and caches it using
## the first function.
## This is because inverting a matrix is a costly operations, and caching the
## generated inverse will ensure that the cost of inversion is not repeatedly
## incurred for the same matrix.
## The functions cacheSolve assumes that the matrix is invertible.

## This function returns a special "matrix", which is a list of functions: - 
## 1. sets the value to a matrix
## 2. gets the value of the matrix
## 3. sets the value of the inverse of the matrix
## 4. gets the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    
    get <- function() {
        x
    }
    
    getInverse <- function() {
        i
    }
    
    setInverse <- function(inverse) {
        i <<- inverse
    }
    
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}


## This function calculates the inverse of the matrix set in the above function
## But it first checks if the function above already has the inverse cached
## If so, it just returns the cached inverse
## Otherwise, it calculates the inverse of the matrix by calling solve(m)
## It then caches the inverse by called setInverse on m
cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    if (!is.null(i)) {
        print("getting cached inverse")
        return(i)
    }
    
    data <- x$get()
    i <- solve(data, ...)
    x$setInverse(i)
    i
}
