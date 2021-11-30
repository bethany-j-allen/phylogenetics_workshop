#Bethany Allen     29th Nov 2021
#Code to carry out basic wrangling of phylogenies

#ape is the package that carries out most basic phylogenetic functions
install.packages("ape")
library(ape)

#The phylogenies are taken from my paper on Triassic-Jurassic archosaurs (Allen et al. 2018)

#First read in the cladogram, the branches on this tree are arbitrary
tree <- read.tree("R code/Allen et al 2018 A.txt")

#You can see the OTUs in the phylogeny by calling the tip labels
tree$tip.label

#Here are a few different ways to plot phylogenies

#Plot as a phylogram (you can see that the branch lengths are arbitrary here)
plot(tree, type = "phylogram", no.margin = T, cex = 0.3)

#This phylogeny has node labels, which you can also include
plot(tree, type = "phylogram", show.node.label = T, no.margin = T, cex = 0.3)

#Plot as a cladogram
plot(tree, type = "cladogram", no.margin = T, cex = 0.3)

#Plot as a fan
plot(tree, type = "fan", no.margin = T, cex = 0.3)

#Plot as an unrooted tree
plot(tree, type = "unrooted", no.margin = T, cex = 0.3)


#Now read in an example timescaled tree
timetree <- read.tree("R code/Allen et al 2018 A scaled.txt")

#If you plot the phylogram you can see the branch lengths here
plot(timetree, type = "phylogram", no.margin = T, cex = 0.3)


#Pruning tips from a tree is easy, you just need a list of the tips you want to keep, e.g.
some_archosaurs <- c("Macrocnemus_bassanii", "Howesia_browni", "Tasmaniosaurus_triassicus",
                     "Erythrosuchus_africanus", "Garjainia_prima", "Chanaresuchus_bonapartei",
                     "Dimorphodon_macronyx", "Ixalerpeton_polesinensis", "Marasuchus_lilloensis",
                     "Smilosuchus_gregorii")

#Identify excess tips in the tree and drop them
archosaur_locs <- match(timetree$tip.label, some_archosaurs)
no_match <- timetree$tip.label[which(is.na(archosaur_locs))]
smaller_tree <- drop.tip(timetree, no_match)

#Plot this smaller tree
plot(smaller_tree, type = "phylogram", no.margin = T)


#Save new pruned tree
write.tree(smaller_tree, "R code/Pruned_tree.txt")

#I would recommend doing further manipulation for figures using Figtree
