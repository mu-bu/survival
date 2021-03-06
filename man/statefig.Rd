\name{statefig}
\alias{statefig}
\title{Draw a state space figure.}
\description{
  For multi-state survival models it is useful to have a figure that
  shows the states and the possible transitions between them.
  This function creates a simple "box and arrows" figure.  It's goal
  was simplicity.
}
\usage{
statefig(layout, connect, margin = 0.03, box = TRUE, cex = 1, col = 1,
  lwd=1, lty=1, bcol=col, acol=col, alwd=lwd, alty=lty)
}
\arguments{
  \item{layout}{describes the layout of the boxes on the page.  See the
    detailed description below.
}
\item{connect}{a square matrix with one row for each state.
  If \code{connect[i,j] !=0} then an arrow is drawn from state i to
  state j.  The row names of the matrix are used as the labels for the
  states.
}
  \item{margin}{the fraction of white space between the label and the
    surrounding box, and between the box and the arrows, as a function
    of the plot region size.
}
  \item{box}{should boxes be drawn?  TRUE or FALSE.
}
\item{cex, col, lty, lwd}{default graphical parameters used for the
  text and boxes.  The last 3 can be a vector of values.
}
\item{bcol}{color for the box, if it differs from that used for the
  text.}
\item{acol, alwd, alty}{color, line type and line width for the arrows.
  Only the first element is used.}
}
\details{
  The \code{layout} argument is normally a vector of integers, e.g., the
  vector (1, 3, 2) describes a layout with 3 columns.  The first has a
  single state, the second column has 3 states and the third has 2.
  The coordinates of the plotting region are 0 to 1 for both x and y.
  Within a column the centers of the boxes are evenly spaced, with 1/2 a
  space between the boxes and the margin, e.g., 4 boxes would be at 1/8,
  3/8, 5/8 and 7/8.  If \code{layout} were a 1 column matrix with values
  of (1, 3, 2) then the layout will have three rows with 1, 3, and 2
  boxes per row, respectively.  Alternatively, the user can supply a
  2 column matrix that directly gives the centers.

  The values of the connect matrix should be 0 for pairs of states that
  do not have a transition and values between 0 and 2 for those that do.
  States are connected by an arc that passes through the centers of the
  two boxes and a third point that is between them.  Specifically,
  consider a line segment joining the two centers and erect a second
  segment at right angles to the midpoint of length d times the distance
  from center to midpoint.  The arc passes through this point.  A value
  of d=0 gives a straight line, d=1 a right hand half circle centered
  on the midpoint and d= -1 a left hand half circle.  
  The \code{connect} matrix contains values of d+1 with -1 < d < 1.
}
\value{a matrix containing the centers of the boxes, with the invisible
  attribute set.}
\author{Terry Therneau}
\note{
  The goal of this function is to make ``good enough'' figures as simply
  as possible,
  and thereby to encourage users to draw them.
  The \code{layout} argument was inspired by the \code{diagram} package,
  which can draw more complex and well decorated figures, e.g., many
  different shapes, shading, 
  multiple types of connecting lines, etc., but at the
  price of greater complexity.  
}

\examples{
# Draw a simple competing risks figure
states <- c("Entry", "Complete response", "Relapse", "Death")
connect <- matrix(0, 4, 4, dimnames=list(states, states))
connect[1, -1] <- c(1.1, 1, 0.9)
statefig(c(1, 3), connect)
}
\keyword{survival}
\keyword{hplot}
