% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/docker.R
\name{cr_deploy_docker_trigger}
\alias{cr_deploy_docker_trigger}
\title{Deploy Docker build from a Git repo}
\usage{
cr_deploy_docker_trigger(
  repo,
  image,
  trigger_name = paste0("docker-", image),
  image_tag = c("latest", "$SHORT_SHA", "$BRANCH_NAME"),
  ...,
  substitutions = NULL,
  ignoredFiles = NULL,
  includedFiles = NULL,
  timeout = NULL,
  projectId = cr_project_get()
)
}
\arguments{
\item{repo}{The git repo holding the Dockerfile from \link{cr_buildtrigger_repo}}

\item{image}{The name of the image you want to build}

\item{trigger_name}{The trigger name}

\item{image_tag}{What to tag the build docker image}

\item{...}{
  Arguments passed on to \code{\link[=cr_buildstep_docker]{cr_buildstep_docker}}
  \describe{
    \item{\code{tag}}{The tag or tags to be attached to the pushed image - can use \code{Build} macros}
    \item{\code{location}}{Where the Dockerfile to build is in relation to \code{dir}}
    \item{\code{dockerfile}}{Specify the name of the Dockerfile found at \code{location}}
    \item{\code{kaniko_cache}}{If TRUE will use kaniko cache for Docker builds.}
  }}

\item{substitutions}{A named list of Build macro variables}

\item{ignoredFiles}{ignored_files and included_files are file glob matches extended with support for "**".}

\item{includedFiles}{If any of the files altered in the commit pass the ignored_files}

\item{timeout}{Amount of time that this build should be allowed to run, to second}

\item{projectId}{The project to build under}
}
\description{
This helps the common use case of building a Dockerfile based on the contents of a GitHub repo, and sets up a build trigger so it will build on every commit.
}
\details{
This creates a buildtrigger to do a kamiko cache enabled Docker build upon each commit, as defined by your repo settings via \link{cr_buildtrigger_repo}.  It will build all tags concurrently.
}
\examples{

\dontrun{
repo <- cr_buildtrigger_repo("MarkEdmondson1234/googleCloudRunner")
cr_deploy_docker_trigger(repo, "test", dir = "cloud_build")
}
}
\seealso{
\link{cr_deploy_docker} which lets you build Dockerfiles for more generic use cases

Other Deployment functions: 
\code{\link{cr_deploy_docker}()},
\code{\link{cr_deploy_packagetests}()},
\code{\link{cr_deploy_pkgdown}()},
\code{\link{cr_deploy_run_website}()},
\code{\link{cr_deploy_run}()},
\code{\link{cr_deploy_r}()}
}
\concept{Deployment functions}
