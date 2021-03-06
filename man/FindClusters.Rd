% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster_determination.R
\name{FindClusters}
\alias{FindClusters}
\title{Cluster Determination}
\usage{
FindClusters(object, genes.use = NULL, reduction.type = "pca",
  dims.use = NULL, k.param = 30, k.scale = 25, plot.SNN = FALSE,
  prune.SNN = 1/15, print.output = TRUE, distance.matrix = NULL,
  save.SNN = FALSE, reuse.SNN = FALSE, force.recalc = FALSE,
  modularity.fxn = 1, resolution = 0.8, algorithm = 1, n.start = 100,
  n.iter = 10, random.seed = 0, temp.file.location = NULL)
}
\arguments{
\item{object}{Seurat object}

\item{genes.use}{A vector of gene names to use in construction of SNN graph
if building directly based on expression data rather than a dimensionally
reduced representation (i.e. PCs).}

\item{reduction.type}{Name of dimensional reduction technique to use in
construction of SNN graph. (e.g. "pca", "ica")}

\item{dims.use}{A vector of the dimensions to use in construction of the SNN
graph (e.g. To use the first 10 PCs, pass 1:10)}

\item{k.param}{Defines k for the k-nearest neighbor algorithm}

\item{k.scale}{Granularity option for k.param}

\item{plot.SNN}{Plot the SNN graph}

\item{prune.SNN}{Sets the cutoff for acceptable Jaccard distances when
computing the neighborhood overlap for the SNN construction. Any edges with
values less than or equal to this will be set to 0 and removed from the SNN
graph. Essentially sets the strigency of pruning (0 --- no pruning, 1 ---
prune everything).}

\item{print.output}{Whether or not to print output to the console}

\item{distance.matrix}{Build SNN from distance matrix (experimental)}

\item{save.SNN}{Saves the SNN matrix associated with the calculation in
object@snn}

\item{reuse.SNN}{Force utilization of stored SNN. If none store, this will
throw an error.}

\item{force.recalc}{Force recalculation of SNN.}

\item{modularity.fxn}{Modularity function (1 = standard; 2 = alternative).}

\item{resolution}{Value of the resolution parameter, use a value above
(below) 1.0 if you want to obtain a larger (smaller) number of communities.}

\item{algorithm}{Algorithm for modularity optimization (1 = original Louvain
algorithm; 2 = Louvain algorithm with multilevel refinement; 3 = SLM
algorithm).}

\item{n.start}{Number of random starts.}

\item{n.iter}{Maximal number of iterations per random start.}

\item{random.seed}{Seed of the random number generator.}

\item{temp.file.location}{Directory where intermediate files will be written.
Specify the ABSOLUTE path.}
}
\value{
Returns a Seurat object and optionally the SNN matrix,
        object@ident has been updated with new cluster info
}
\description{
Identify clusters of cells by a shared nearest neighbor (SNN) modularity
optimization based clustering algorithm. First calculate k-nearest neighbors
and construct the SNN graph. Then optimize the modularity function to
determine clusters. For a full description of the algorithms, see Waltman and
van Eck (2013) \emph{The European Physical Journal B}.
}
