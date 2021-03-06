##  This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        
        set <- function(y) {  ##set the value of matrix.
               
                 x <<- y
                
                 m <<- NULL
        
        }
        
        get <- function()x  ##get the value of matrix.
        
        setinverse <- function(solve) m <<- solve
        
        getinverse <- function()m
        
        list(set = set, get = get,
             
             setinverse = setinverse,
             
             getinverse = getinverse)
        
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been 
##calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        
        if(!is.null(m)) {
               
                 message("getting cached data")
                
                return(m)
        }
       
         data_matrix <- x$get()
        
         m <- solve(data_matrix, ...)
         
         x$setinverse(m)
        
         m
        ## Return a matrix that is the inverse of 'x'
}
