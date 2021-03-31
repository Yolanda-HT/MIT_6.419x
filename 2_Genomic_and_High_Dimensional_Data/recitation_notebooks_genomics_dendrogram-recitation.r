library(mvtnorm)
library(Rtsne)
library(dendextend)
library(RColorBrewer)

# Color palette and synthetic data
cols <- brewer.pal(n=5,name="YlOrRd")[c(2:4)]
cols <- c(cols, brewer.pal(n=4,name="RdPu")[c(2:3)])
cols <- c(cols, brewer.pal(n=4,name="Blues")[c(2:3)])
means = matrix(0,nrow=7,ncol=5)
means[1,1] = 0.4
means[2,1] = 0.2
means[3,1] = 0.6
means[4,2] = 0.7
means[5,3] = 0.7
means[6,1] = 1.0
means[6,2] = 2.8
means[7,1] = 1.0
means[7,2] = 2.4
cov = 0.003 * diag(5)
set.seed(314)
X=matrix(nrow=0,ncol=5)
for (i in 1:7) {
  X = rbind(X, rmvnorm(20, mean=means[i,], sigma=cov))
}
y = rep(c(1:7),each=20)

par(mfrow=c(1,2))
# PCA and TSNE visualizations
pca <- prcomp(X)
z <- pca$x
par(mar=c(5,5,5,3))
plot(z[,1],z[,2],col=cols[y],pch=19)
title("PCA, true labels")

z_tsne <- Rtsne(X,perplexity=5)
plot(z_tsne$Y[,1],z_tsne$Y[,2],col=cols[y],pch=19)
title("TSNE, true labels, perplexity 5")
par(mfrow=c(1,1))
# Hierarchical clustering: dist -> hclust -> dendrogram -> cutree pipeline
dis <- dist(X, method="euclidean")
hc1 <- hclust(dis, method="ward.D")
dend <- as.dendrogram(hc1)
plot(dend)
title("Dendrogram: Ward criterion", ylab="Height")

# Zoom in on left side
dend_cut <- cut(dend, 50)
plot(dend_cut$lower[[1]])
title("Dendrogram, First cluster group", ylab="Height")

# order[i] is index i-th example on x-axis of dendrogram
order <- order.dendrogram(dend)
cl <- cutree(dend,k=7)
cl.orders <- unique(cl[order]) # Order colors according to how they appear in dendrogram
colors_reordered <- cols[cl.orders]
d1=color_branches(dend, col = colors_reordered,clusters=cl[order])
d1=color_labels(d1,labels=labels(d1),col=cols[cl[order]])
plot(d1)
title("Dendrogram: Ward criterion", ylab="Height")

for (i in 2:7) {
  # Plot clustering on original data
  cl <- cutree(dend,k=i)
  cl.orders <- unique(cl[order]) # Order colors according to how they appear in dendrogram
  colors_reordered <- cols[cl.orders]
  d1=color_branches(dend, col = colors_reordered,clusters=cl[order])
  d1=color_labels(d1,labels=labels(d1),col=cols[cl[order]])
  layout(matrix(c(1,2,2), nrow = 1, ncol = 3, byrow = TRUE))
  plot(d1)
  title("Dendrogram: Ward criterion", ylab="Height")
  plot(z[,1],z[,2],col=cols[cl],pch=19)
  title(paste("Hierarchical Clustering, ",i," clusters",sep=""))
}

for (i in 5:7) {
  # Plot clustering on original data
  cl <- cutree(dend,k=i)
  cl.orders <- unique(cl[order]) # Order colors according to how they appear in dendrogram
  colors_reordered <- cols[cl.orders]
  d1=color_branches(dend, col = colors_reordered,clusters=cl[order])
  d1=color_labels(d1,labels=labels(d1),col=cols[cl[order]])
  layout(matrix(c(1,2,2), nrow = 1, ncol = 3, byrow = TRUE))
  plot(d1)
  title("Dendrogram: Ward criterion", ylab="Height")
  plot(z_tsne$Y[,1],z_tsne$Y[,2],col=cols[cl],pch=19)
  title(paste("Hierarchical Clustering, ",i," clusters",sep=""))
}

par(mfrow=c(1,1))
cl <- cutree(dend,k=8)
plot(z_tsne$Y[,1],z_tsne$Y[,2],col=cl,pch=19)
title("Hierarchical Clustering, 8 clusters")

# Average silhouette scores
par(mfrow=c(1,1))
par(mar=c(5,5,5,3))
silhouettes <- list()
for (i in 2:9) {
  cl <- cutree(dend, k=i)
  sil <- silhouette(cl, dis)
  silhouettes[[i-1]] <- sil
}

mean.scores <- numeric(8)
for (i in 1:8) {
  mean.scores[i] <- mean(silhouettes[[i]][,"sil_width"])
}
plot(2:9,mean.scores,main="Avg silhouette scores",
     xlab="Number of clusters", ylab="Avg silhouette score")

# Can make nice circlized dendrograms
par(mfrow=c(1,1),mar=c(0,0,3,0))
circlize_dendrogram((d1))
title("Circlized Dendrogram")
d2=color_labels(d1,labels=labels(d1),col=cols[y[order]])
circlize_dendrogram(d2)
title("Circlized Dendrogram, Ground Truth Labels")

