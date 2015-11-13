% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/cluster_determination.R
\name{FindClusters}
\alias{FindClusters}
\title{Cluster Determination}
\usage{
FindClusters(object, genes.use = NULL, pc.use = NULL, k.param = 10,
  k.scale = 10, plot.SNN = FALSE, prune.SNN = 0.1, save.SNN = FALSE,
  r.param = 0.7, m.param = NULL, q = 0.1, qup = 0.1, update = 0.25,
  min.cluster.size = 1, do.sparse = FALSE, do.modularity = FALSE,
  modularity = 1, resolution = 0.8, algorithm = 1, n.start = 100,
  n.iter = 10, random.seed = 0, print.output = 1)
}
\arguments{
\item{object}{Seurat object}

\item{genes.use}{Gene expression data}

\item{pc.use}{Which PCs to use for construction of the SNN graph}

\item{k.param}{Defines k for the k-nearest neighbor algorithm}

\item{k.scale}{granularity option for k.param}

\item{plot.SNN}{Plot the SNN graph}

\item{prune.SNN}{Stringency of pruning for the SNN graph (0 - no pruning,
1 - prune everything)}

\item{save.SNN}{Whether to return the SNN matrix or not. If true, returns a
list with the object as the first item
 and the SNN matrix as the second item.}

\item{r.param}{r defines the connectivity for the quasi-cliques.
Higher r gives a more compact subgraph}

\item{m.param}{m is the threshold for merging two quasi-cliques.
Higher m results in less merging}

\item{q}{Defines the percentage of quasi-cliques to examine for merging each
iteration}

\item{qup}{Determines how to change q once all possible merges have been made}

\item{update}{Adjust how verbose the output is}

\item{min.cluster.size}{Smallest allowed size for a cluster}

\item{do.sparse}{Option to store and use SNN matrix as a sparse matrix.
May be necessary datasets containing a large number of cells.}

\item{do.modularity}{Option to use modularity optimization for single cell
clustering.}

\item{modularity}{Modularity function (1 = standard; 2 = alternative).}

\item{resolution}{Value of the resolution parameter, use a value above
(below) 1.0 if you want to obtain a larger (smaller) number of
communities.}

\item{algorithm}{Algorithm for modularity optimization (1 = original Louvain
algorithm; 2 = Louvain algorithm with multilevel refinement;
3 = SLM algorithm).}

\item{n.start}{Number of random starts.}

\item{n.iter}{Maximal number of iterations per random start.}

\item{random.seed}{Seed of the random number generator.}

\item{print.output}{Whether or not to print output to the console (0 = no;
1 = yes).}
}
\value{
Returns a Seurat object and optionally the SNN matrix,
        object@ident has been updated with new cluster info
}
\description{
Identify clusters of cells by a shared nearest neighbor (SNN) quasi-clique
based clustering algorithm. First calculate k-nearest neighbors and construct
the SNN graph. Then determine the quasi-cliques associated with each cell.
Finally, merge the quasi-cliques into clusters. For a full description of the
algorithm, see Xu and Su (2015) \emph{Bioinformatics}.
}
