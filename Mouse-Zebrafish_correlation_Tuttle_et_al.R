library(Seurat)
library(tidyverse)
library(biomaRt)


# Map homologs

mouse <- useEnsembl('ensembl', dataset = 'mmusculus_gene_ensembl', host = 'https://dec2021.archive.ensembl.org')
zebrafish <- useEnsembl('ensembl', dataset = 'drerio_gene_ensembl', host = 'https://dec2021.archive.ensembl.org')
mm_dr <- getLDS(attributes = c("external_gene_name"),
                mart = mouse,
                attributesL = c("external_gene_name"),
                martL = zebrafish)

colnames(mm_dr) <- c('mm_gene', 'dr_gene')

# Read cross species gene dictionary and seurat objects

RB <- readRDS('outs/RB_names')
DRG <- readRDS('outs/DRG_names')


# Filter dictionary to just homologous genes

mm_dr_filt <- mm_dr %>%
  filter(mm_gene %in% row.names(DRG) & 
           dr_gene %in% row.names(RB))

# Compute average expression of homologs

# Note: I don't see the annotations you want to map across, but that can be added to the AverageExpression call with the "group.by" argument

RB <- FindVariableFeatures(RB) # Lets us just perform correlation with variable features

mouse_avg <- AverageExpression(DRG,
                                   features = mm_dr_filt$mm_gene,
                                   slot = 'data',
                                   assays = 'RNA')

zfish_avg <- AverageExpression(RB,
                                   features = VariableFeatures(RB), # Set to "mm_dr_filt$dr_gene" to find correlation for all features
                                   slot = 'data',
                                   assays = 'RNA')

# Extract just RNA (not integrated) results as a data.frame

mouse_avg.df <- mouse_avg$RNA
zfish_avg.df <- zfish_avg$RNA

# Convert zfish genes to mouse

row.names(zfish_avg.df) <- plyr::mapvalues(x = row.names(zfish_avg.df),
                                          from = mm_dr_filt$dr_gene,
                                          to = mm_dr_filt$mm_gene,
                                          warn_missing = FALSE)

# Align rows by gene across the two dataframes

mouse_avg.df <- mouse_avg.df[row.names(mouse_avg.df) %in% row.names(zfish_avg.df),] # Filters mouse_avg.df to only include genes found in zebrafish data
zfish_avg.df <- zfish_avg.df[row.names(mouse_avg.df),] # filters zfish_avg.df and orders to match mouse_avg.df

colnames(zfish_avg.df) <- paste0('zf_', colnames(zfish_avg.df)) # Add identifier to zebrafish clusters so they are unique from mouse

# Combine to single data.frame
both_avg.df <- cbind(mouse_avg.df, zfish_avg.df)

# Compute pairwise correlation

cor_avg <- cor(x = both_avg.df)

# Visualize pairwise correlation

pheatmap::pheatmap(cor_avg,
                   display_numbers = round(cor_avg,2))
