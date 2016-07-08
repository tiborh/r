######################################################################
# Create the first quadrant class
#
# This is used to represent a coordinate in the first quadrant.
FirstQuadrant <- setClass(
    ## Set the name for the class
    "FirstQuadrant",
    
    ## Define the slots
    slots = c(
        x = "numeric",
        y = "numeric"
    ),
    
    ## Set the default values for the slots. (optional)
    prototype=list(
        x = 0.0,
        y = 0.0
    ),

    ## Make a function that can test to see if the data is consistent.
    ## This is not called if you have an initialize function defined!
    validity=function(object) {
        if((object@x < 0) || (object@y < 0)) {
            return("A negative number for one of the coordinates was given.")
        }
        return(TRUE)
    }
)

x <- FirstQuadrant()
x
## An object of class "FirstQuadrant"
## Slot "x":
## [1] 0

## Slot "y":
## [1] 0

y <- FirstQuadrant(x=5,y=7)
y
## An object of class "FirstQuadrant"
## Slot "x":
## [1] 5

## Slot "y":
## [1] 7

y@x                                     # 5
y@y                                     # 7

z <- FirstQuadrant(x=3,y=-2)
## Error in validObject(.Object) :
##       invalid class “FirstQuadrant” object: A negative number for one of the coordinates was given.

z                                       # not found

## Set method:
# create a method to assign the value of a coordinate
setGeneric(name="setCoordinate",
           def=function(theObject,xVal,yVal) {
               standardGeneric("setCoordinate")
           }
           )

setMethod(f="setCoordinate",
          signature="FirstQuadrant",
          definition=function(theObject,xVal,yVal) {
              theObject@x <- xVal
              theObject@y <- yVal
              return(theObject)
          }
          )

z <- FirstQuadrant(x=2.5,y=10)
z
## An object of class "FirstQuadrant"
## Slot "x":
## [1] 2.5

## Slot "y":
## [1] 10

z <- setCoordinate(z,-3.0,-5.0)
z
## An object of class "FirstQuadrant"
## Slot "x":
## [1] -3

## Slot "y":
## [1] -5

## second example:

######################################################################
# Create the base Agent class
#
# This is used to represent the most basic agent in a simulation.
Agent <- setClass(
    ## Set the name for the class
    "Agent",

    ## Define the slots
    slots = c(
        location = "numeric",
        velocity   = "numeric",
        active   = "logical"
    ),

    ## Set the default values for the slots. (optional)
    prototype=list(
        location = c(0.0,0.0),
        active   = TRUE,
        velocity = c(0.0,0.0)
    ),

    ## Make a function that can test to see if the data is consistent.
    ## This is not called if you have an initialize function defined!
    validity=function(object) {
        if(sum(object@velocity^2)>100.0) {
            return("The velocity level is out of bounds.")
        }
        return(TRUE)
    }
)

a <- Agent()
a
## An object of class "Agent"
## Slot "location":
## [1] 0 0

## Slot "velocity":
## [1] 0 0

## Slot "active":
## [1] TRUE

is.object(a)                            # T
isS4(a)                                 # T

slotNames(a)                            # [1] "location" "velocity" "active"
slotNames("Agent")                      # same as above

getSlots("Agent")
##  location  velocity    active 
## "numeric" "numeric" "logical"

s <- getSlots("Agent")
s[1]
##  location 
## "numeric" 
s[[1]]                                  # "numeric"

names(s)                                # [1] "location" "velocity" "active"

getClass("Agent")
## Class "Agent" [in ".GlobalEnv"]

## Slots:
                                 
## Name:  location velocity   active
## Class:  numeric  numeric  logical

slot(a,"location")                      # 0 0
slot(a,"location") <- c(1,5)
a
## An object of class "Agent"
## Slot "location":
## [1] 1 5

## Slot "velocity":
## [1] 0 0

## Slot "active":
## [1] TRUE

## Creating methods:

# create a method to assign the value of the location
setGeneric(name="setLocation",
           def=function(theObject,position) {
               standardGeneric("setLocation")
           }
           )

setMethod(f="setLocation",
          signature="Agent",
          definition=function(theObject,position) {
              theObject@location <- position
              validObject(theObject)
              return(theObject)
          }
          )

# create a method to get the value of the location
setGeneric(name="getLocation",
           def=function(theObject) {
               standardGeneric("getLocation")
           }
           )

setMethod(f="getLocation",
          signature="Agent",
          definition=function(theObject)
          {
              return(theObject@location)
          }
          )


# create a method to assign the value of active
setGeneric(name="setActive",
           def=function(theObject,active) {
               standardGeneric("setActive")
           }
           )

setMethod(f="setActive",
          signature="Agent",
          definition=function(theObject,active) {
              theObject@active <- active
              validObject(theObject)
              return(theObject)
          }
          )

# create a method to get the value of active
setGeneric(name="getActive",
           def=function(theObject) {
               standardGeneric("getActive")
           }
           )

setMethod(f="getActive",
          signature="Agent",
          definition=function(theObject) {
              return(theObject@active)
          }
          )


# create a method to assign the value of velocity
setGeneric(name="setVelocity",
           def=function(theObject,velocity) {
               standardGeneric("setVelocity")
           }
           )

setMethod(f="setVelocity",
          signature="Agent",
          definition=function(theObject,velocity) {
              theObject@velocity <- velocity
              validObject(theObject)
              return(theObject)
          }
          )

# create a method to get the value of the velocity
setGeneric(name="getVelocity",
           def=function(theObject) {
               standardGeneric("getVelocity")
           }
           )

setMethod(f="getVelocity",
          signature="Agent",
          definition=function(theObject) {
              return(theObject@velocity)
          }
          )
a <- Agent()
getVelocity(a)                          # 0 0
a <- setVelocity(a,c(1.0,2.0))
getVelocity(a)                          # 1 2

## reset method:
# create a method to reset the velocity and the activity
setGeneric(name="resetActivity",
           def=function(theObject,value) {
               standardGeneric("resetActivity")
           }
           )

setMethod(f="resetActivity",
          signature=c("Agent","logical"),
          definition=function(theObject,value) {
              theObject <- setActive(theObject,value)
              theObject <- setVelocity(theObject,c(0.0,0.0))
              return(theObject)
          }
          )

setMethod(f="resetActivity",
          signature=c("Agent","numeric"),
          definition=function(theObject,value) {
              theObject <- setActive(theObject,TRUE)
              theObject <- setVelocity(theObject,value)
              return(theObject)
          }
          )

a <- Agent()
a
An object of class "Agent"
## Slot "location":
## [1] 0 0

## Slot "velocity":
## [1] 0 0

## Slot "active":
## [1] TRUE

a <- resetActivity(a,FALSE)
getActive(a)                            # [1] FALSE
a <- resetActivity(a,c(1,3))
getVelocity(a)                          # [1] 1 3

## Inheritance:

######################################################################
# Create the Prey class
#
# This is used to represent a prey animal
Prey <- setClass(
    ## Set the name for the class
    "Prey",

    ## Define the slots - in this case it is empty...
    slots = character(0),
    
    ## Set the default values for the slots. (optional)
    prototype=list(),

    ## Make a function that can test to see if the data is consistent.
    ## This is not called if you have an initialize function defined!
    validity=function(object) {
        if(sum(object@velocity^2)>70.0) {
            return("The velocity level is out of bounds.")
        }
        return(TRUE)
    },

    ## Set the inheritance for this class
    contains = "Agent"
)



######################################################################
# Create the Bobcat class
#
# This is used to represent a smaller predator
Bobcat <- setClass(
    ## Set the name for the class
    "Bobcat",
    
    ## Define the slots - in this case it is empty...
    slots = character(0),

    ## Set the default values for the slots. (optional)
    prototype=list(),

    ## Make a function that can test to see if the data is consistent.
    ## This is not called if you have an initialize function defined!
    validity=function(object) {
        if(sum(object@velocity^2)>85.0) {
            return("The velocity level is out of bounds.")
        }
        return(TRUE)
    },

    ## Set the inheritance for this class
    contains = "Agent"
)

######################################################################
# Create the Lynx class
#
# This is used to represent a larger predator
Lynx <- setClass(
    ## Set the name for the class
    "Lynx",

    ## Define the slots - in this case it is empty...
    slots = character(0),

    ## Set the default values for the slots. (optional)
    prototype=list(),

    ## Make a function that can test to see if the data is consistent.
    ## This is not called if you have an initialize function defined!
    validity=function(object) {
        if(sum(object@velocity^2)>95.0) {
            return("The velocity level is out of bounds.")
        }
        return(TRUE)
    },

    ## Set the inheritance for this class
    contains = "Bobcat"
)

# create a method to move the agent.
setGeneric(name="move",
           def=function(theObject) {
               standardGeneric("move")
           }
           )

setMethod(f="move",
          signature="Agent",
          definition=function(theObject) {
              print("Move this Agent dude")
              theObject <- setVelocity(theObject,c(1,2))
              validObject(theObject)
              return(theObject)
          }
          )

setMethod(f="move",
          signature="Prey",
          definition=function(theObject) {
              print("Check this Prey before moving this dude")
              theObject <- callNextMethod(theObject)
              print("Move this Prey dude")
              validObject(theObject)
              return(theObject)
          }
          )

setMethod(f="move",
          signature="Bobcat",
          definition=function(theObject) {
              print("Check this Bobcat before moving this dude")
              theObject <- setLocation(theObject,c(2,3))
              theObject <- callNextMethod(theObject)
              print("Move this Bobcat dude")
              validObject(theObject)
              return(theObject)
          }
          )

setMethod(f="move",
          signature="Lynx",
          definition=function(theObject) {
              print("Check this Lynx before moving this dude")
              theObject <- setActive(theObject,FALSE)
              theObject <- callNextMethod(theObject)
              print("Move this Lynx dude")
              validObject(theObject)
              return(theObject)
          }
          )

robert <- Bobcat()
robert
## An object of class "Bobcat"
## Slot "location":
## [1] 0 0

## Slot "velocity":
## [1] 0 0

## Slot "active":
## [1] TRUE

robert <- move(robert)
## [1] "Check this Bobcat before moving this dude"
## [1] "Move this Agent dude"
## [1] "Move this Bobcat dude"

robert
An object of class "Bobcat"
## Slot "location":
## [1] 2 3

## Slot "velocity":
## [1] 1 2

## Slot "active":
## [1] TRUE

lionel <- Lynx()
lionel
## An object of class "Lynx"
## Slot "location":
## [1] 0 0

## Slot "velocity":
## [1] 0 0

## Slot "active":
## [1] TRUE

lionel <- move(lionel)
## [1] "Check this Lynx before moving this dude"
## [1] "Check this Bobcat before moving this dude"
## [1] "Move this Agent dude"
## [1] "Move this Bobcat dude"
## [1] "Move this Lynx dude"
lionel
## An object of class "Lynx"
## Slot "location":
## [1] 2 3

## Slot "velocity":
## [1] 1 2

## Slot "active":
## [1] FALSE
