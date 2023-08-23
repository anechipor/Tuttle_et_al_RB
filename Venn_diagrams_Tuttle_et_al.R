# load Venn diagram package
library("VennDiagram")

# move to new plotting page
grid.newpage()

# calcaB+adcyap1aR+kitbFR trunk
overrideTriple = T
draw.triple.venn(area1=199, area2=176, area3=213, 
                 n12=2, n23=6, n13=5, n123=1, 
                 category=c("calca","adcyap1a","kitb"),
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# calcaB+adcyap1aR+kitbFR tail
overrideTriple = T
draw.triple.venn(area1=253, area2=227, area3=177, 
                 n12=8, n23=6, n13=5, n123=0, 
                 category=c("calca","adcyap1a","kitb"),
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# calcaB+adcyap1aR+kitbFR total
overrideTriple = T
draw.triple.venn(area1=452, area2=403, area3=390, 
                 n12=10, n23=12, n13=10, n123=1, 
                 category=c("calca","adcyap1a","kitb"), euler.d = T, scaled = T,
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))




# move to new plotting page
grid.newpage()
overrideTriple = T
# prickle1a tmem178 runx3 trunk
draw.triple.venn(area1=188, area2=165, area3=171, 
                 n12=19, n23=2, n13=17, n123=2, 
                 category=c("prickle1a","tmem178","runx3"),
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# prickle1a tmem178 runx3 tail
overrideTriple = T
draw.triple.venn(area1=237, area2=267, area3=189, 
                 n12=16, n23=3, n13=4, n123=2, 
                 category=c("prickle1a","tmem178","runx3"),
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# prickle1a tmem178 runx3 total
overrideTriple = T
draw.triple.venn(area1=425, area2=432, area3=360, 
                 n12=35, n23=5, n13=21, n123=4, 
                 category=c("prickle1a","tmem178","runx3"), euler.d = T, scaled = T,
                 col="Red",fill=c("indianred2","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# dusp6R kitbB CaPG total
overrideTriple = T
draw.triple.venn(area1=562, area2=236, area3=226, 
                 n12=236, n23=96, n13=226, n123=96, 
                 category=c("CaPs","dusp6","kitb"), scaled = T,
                 col="Red",fill=c("green","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# ets1R calcaB CaPG total
overrideTriple = T
draw.triple.venn(area1=570, area2=236, area3=261, 
                 n12=236, n23=200, n13=261, n123=200, 
                 category=c("CaPs","ets1","calca"), scaled = T,
                 col="Red",fill=c("green","darkslategray1","darkorchid3"))

# move to new plotting page
grid.newpage()

# etv4R kitbB CaPG total
overrideTriple = T
draw.triple.venn(area1=690, area2=520, area3=271, 
                 n12=520, n23=244, n13=271, n123=244, 
                 category=c("CaPs","etv4","kitb"), scaled = T,
                 col="Red",fill=c("green","darkslategray1","darkorchid3"))


# move to new plotting page
grid.newpage()

# etv5aR kitbB CaPG  total
overrideTriple = T
draw.triple.venn(area1=551, area2=449, area3=247, 
                 n12=449, n23=243, n13=247, n123=243, 
                 category=c("CaPs","etv5a","kitb"), scaled = T,
                 col="Red",fill=c("green","darkslategray1","darkorchid3"))










