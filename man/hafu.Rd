\docType{data}
\name{hafu}
\alias{hafu}
\alias{hafu2}
\title{Hafu}
\format{Both data frames have the following columns.
\describe{
\item{Year}{Integer year that the manga was made.}
\item{Series}{Name of series.}
\item{Character}{Name of character.}
\item{Gender}{Gender of character.}
\item{Father}{Nationality of character's father.}
\item{Mother}{Nationality of character's mother.}
\item{Eyes}{Character's eye colour.}
\item{Hair}{Character's hair colour.}
\item{Notes}{Notes on data collection or ambiguity.}
}

\code{hafu2} has these additional columns.

\describe{
\item{FathersNationalityIsUncertain}{}
\item{MothersNationalityIsUncertain}{}
}}
\description{
  Half-caste manga characters.
}
\note{
  The dataset was kindly provided by Gwern Branwen.

  \code{hafu2} is a lightly cleaned up version of
  \code{hafu}.

  Gwern's notes: The following list includes manga, light
  novel, anime, and video game characters (there being
  little point in keeping the mediums separate). It also
  includes characters who are not hafu themselves but a
  quarter-foreign inasmuch as they imply a hafu at some
  point. Characters are treated separately even if they are
  in the same work (eg. siblings). Classification is based
  on in-universe or out-of- universe information, since
  appearance can be highly misleading in anime (blue eyes
  may indicate heroic status, rather than being Caucasian;
  hair color may be chosen for contrast against other
  characters or signal stereotypes like red hair indicating
  a fiery personality), and different groups will identify
  the same anime character as belonging to their own race
  (Lu 2009), perhaps due to minimalistic drawings intended
  to save money or enable viewers to project themselves
  onto a character.
}
\references{
  The dataset was compiled by Gwern Branwen
  \email{gwern0@gmail.com}.  The original is available from
  \url{http://www.gwern.net/hafu#list}.
}
\keyword{datasets}

