setwd("C:/Users/DavidL/OneDrive/CS/FIT3152/A3/A3_Docs")

rm(list = ls())
#install.packages("slam")
library(slam)
#install.packages("tm")
library(tm)
#install.packages("SnowballC")
library(SnowballC)


#Q1
#function to create multiples with 100 word from a long string
word100File <- function(text, name) {
  #replace all punctuation with white space
  text <- gsub("[[:punct:]]", " ", text)
  #replace more whitespaces with 1 whitespace
  text <- gsub("\\s+", " ", text)
  #strsplit() function that splits a string into substrings based on a 
  #specified delimiter. returns a list of substrings. ased on the delimiter " " (space)
  #strsplit return list of character vectors, need to use [[1]] to get it as a long string
  words <- strsplit(text, " ")[[1]]
  
  n <- length(words)
  #create every file with at least 100 words
  word_limit <- 100
  #determine how many files to create for this string of text
  #if the remaining words are less than 100, 1 less file is created

  num_files <- floor(n/word_limit)
  
  for (i in 1:num_files) {
    #adjust the start for every loop of reading the words from text
    start = (i-1)*word_limit + 1
    end <- min(i*word_limit, n)
    #create file with name BYD with id
    filename <- paste0(name, i, ".txt")
    #writeLines() function writes one or more lines of text to a file. 
    #paste() function concatenates the strings in the words[start:end]vector with a space separator. 
    #collapse argument specifies the separator between concatenated strings
    #words[start:end] as one sub-string with 100 words and write to the corresponding file
    writeLines(paste(words[start:end], collapse = " "), filename)
  }
}


#electric car company - BYD
#https://www.automotiveworld.com/news-releases/byd-leading-global-innovation-in-electric-vehicles-for-a-better-life/
BYD_text = "Rotterdam, the Netherlands ¨C BYD, the world¡¯s leading manufacturer of New Energy Vehicles (NEV) and power batteries, has been at the forefront of battery technology for over 27 years. Since its formation, BYD¡¯s battery expertise, and pioneering technological innovations have been empowering the transition to electrification of transportation across all sectors, and inspiring eMobility on a global level.
The popularity of BYD NEV passenger cars has led to record-breaking sales for the company, and this together with BYD pure-electric buses for public transport, as well as pure-electric commercial trucks and vans, has been hugely influential in BYD becoming the leading global NEV manufacturer.
BYD new energy vehicles are making a valuable contribution to carbon reduction, helping to protect the environment through zero-emission solutions. BYD eBuses are transforming public transportation giving commuters, shoppers and tourists the ability to travel on non-polluting, zero-emission buses with almost zero noise pollution. Similarly, BYD eTrucks and NEV passenger cars are rapidly claiming an ever-increasing market share in their respective sectors. Alongside this, is also a range of BYD pure-electric forklifts for industrial use.
This success is built on experience. For over two decades, BYD has been inspiring eMobility through innovation in battery technology. From the outset, BYD has focused exclusively on pure-electric battery powered vehicles in its commercial range. Taking this a step further, BYD announced in April 2022 that it would be ceasing production of full combustion engine vehicles to focus on battery electric (BEV) and plug-in hybrid (PHEV) vehicles. Significantly, BYD is the first OEM in the world to make such a commitment, supporting its vision for a sustainable future, driven by electrification, for a better life.
BYD pioneering innovation in Iron-Phosphate Battery Technology
BYD has made huge strides in the development of battery technology over the last 27 years. This unparalleled expertise has served BYD well in developing some of the most technologically advanced electric vehicles. The successful implementation of BYD new energy vehicles is an excellent example of how technological innovation is influencing change, demonstrating the reliability and benefits of electrification.
Proven BYD Iron-Phosphate Battery Technology developed for safety and reliability is at the heart of BYD¡¯s NEV product range. BYD is, in fact, the largest manufacturer of Lithium Iron-Phosphate (LFP) batteries for which industry data shows there is substantially increased demand. As technology continues to advance, LFP batteries are expected to account for more than 60 per cent of the global power battery market by 2024. There is a good reason. LFP batteries are cobalt free and produced using a material that has excellent thermal stability compared to other battery alternatives. As such BYD Iron-Phosphate Battery Technology has passed stringent safety tests, including crush tests, heat tests, overcharging tests, which has even exceeded regulatory requirements. BYD was one of the first companies to use a battery thermal management system, to ensure that the battery temperature remains at the optimum level for efficient and reliable operation in all extremes of weather. Such is the energy efficiency, BYD NEVs in all categories produce some of the industry¡¯s most impressive ranges.
BYD Blade Battery revolutionising the industry"
#word100File(BYD_text, "BYD")

#https://www.scmp.com/business/china-business/article/3221515/tesla-offers-china-made-electric-vehicles-sale-canada
#Telsa
Tesla_text = "
GLP Park, Lingang, Shanghai. Photo: Handout 
Business

H&M shuts Beijing Sanlitun district store a year after closing Shanghai shop


The H&M store in Sanlitun. Swire Properties says it is finalising a rental agreement with a new tenant for the site. Photo: VCG
Lifestyle

The best K-dramas of 2022: Extraordinary Attorney Woo, Little Women and more

Kim Go-eun in a still from Little Women, one of our picks for the top 15 K-dramas of 2022.
Lifestyle

Meet Anita Yuen, the Audrey Hepburn of Hong Kong who crossed Jackie Chan


Actress Anita Yuen at an interview with the Post in 1998. At the height of her success, Yuen garnered a reputation for being difficult to work with, but for director Peter Chan she was ¡°so good¡± on screen he put aside doubts about casting her. 
A total of 4,027 of Tesla¡¯s Model Y and Model 3 electric vehicles await loading at the Nangang port in Shanghai for shipment to the Port of Zeebrugge in Belgium on May 15, 2022. Photo: VCG via Getty Images.
A total of 4,027 of Tesla¡¯s Model Y and Model 3 electric vehicles await loading at the Nangang port in Shanghai for shipment to the Port of Zeebrugge in Belgium on May 15, 2022. Photo: VCG via Getty Images.
Tesla is listing China-made Model 3 and Model Y models for sale in Canada, the company¡¯s website showed on Tuesday, confirming the electric car maker has completed its first shipments to North America from its Shanghai factory.
Tesla¡¯s website showed both rear-wheel drive Model Y vehicles and the long-range, all-wheel drive version of the Model 3 available for immediate delivery in British Columbia, with codes showing they were manufactured at Tesla¡¯s Gigafactory Shanghai.
Both models qualify for federal incentives of C$5,000 (US$3,700) in Canada, which, unlike the United States, does not link electric-vehicle subsidies to the location of the plant that made the car.
Tesla representatives in China and at the company¡¯s headquarters in the United States did not immediately respond to requests for comment.
China¡¯s EV war: BYD, Nio, Xpeng snap at Tesla¡¯s heels with made-for-China models
13 Apr 2023

The company and other electric car manufacturers have a cost advantage in China as exports from that market boom. The China-made version of the Model Y was listed for C$61,990 in Canada. That is about 22 per cent more than the equivalent vehicle costs in China before incentives.

Tesla¡¯s move to export to Canada from Shanghai could help it keep vehicles made at its plants in California and Texas for sale in the United States, where they qualify for potential tax incentives of up to US$7,500 under the Biden administration¡¯s subsidy programme.
¡®The advantages are obvious¡¯: how China¡¯s BYD became the world¡¯s No 1 EV maker
19 Apr 2023
"
#word100File(Tesla_text, "Tesla")


#Battery
Bat_text = "ENERGYThe Top 10 EV Battery Manufacturers in 2022Published 8 months ago on October 5, 2022
By Bruno Venditti
Graphics/Design:
Sabrina Lam
 Subscribe to the Elements free mailing list for more like this

Top-10-EV-Battery-Manufacturers-by-Market-Share-2022

The Top 10 EV Battery Manufacturers in 2022
This was originally posted on Elements. Sign up to the free mailing list to get beautiful visualizations on natural resource megatrends in your email every week.

The global electric vehicle (EV) battery market is expected to grow from $17 billion to more than $95 billion between 2019 and 2028.

With increasing demand to decarbonize the transportation sector, companies producing the batteries that power EVs have seen substantial momentum.

Here we update our previous graphic of the top 10 EV battery manufacturers, bringing you the world¡¯s biggest battery manufacturers in 2022.

Chinese Dominance
Despite efforts from the United States and Europe to increase the domestic production of batteries, the market is still dominated by Asian suppliers.

The top 10 producers are all Asian companies.

Currently, Chinese companies make up 56% of the EV battery market, followed by Korean companies (26%) and Japanese manufacturers (10%).

The leading battery supplier, CATL, expanded its market share from 32% in 2021 to 34% in 2022. One-third of the world¡¯s EV batteries come from the Chinese company. CATL provides lithium-ion batteries to Tesla, Peugeot, Hyundai, Honda, BMW, Toyota, Volkswagen, and Volvo.
Despite facing strict scrutiny after EV battery-fire recalls in the United States, LG Energy Solution remains the second-biggest battery manufacturer. In 2021, the South Korean supplier agreed to reimburse General Motors $1.9 billion to cover the 143,000 Chevy Bolt EVs recalled due to fire risks from faulty batteries.

BYD took the third spot from Panasonic as it nearly doubled its market share over the last year. The Warren Buffett-backed company is the world¡¯s third-largest automaker by market cap, but it also produces batteries sold in markets around the world. Recent sales figures point to BYD overtaking LG Energy Solution in market share the coming months or years.

The Age of Battery Power
Electric vehicles are here to stay, while internal combustion engine (ICE) vehicles are set to fade away in the coming decades. Recently, General Motors announced that it aims to stop selling ICE vehicles by 2035, while Audi plans to stop producing such models by 2033.

Besides EVs, battery technology is essential for the energy transition, providing storage capacity for intermittent solar and wind generation.

As battery makers work to supply the EV transition¡¯s increasing demand and improve energy density in their products, we can expect more interesting developments within this industry.
The car company also plans to debut the luxury brand Yangwang this year. The first rollout, the U8 sport utility vehicle, comes with tech that independently controls each of the four wheels to boost safety and stability.
Prices will range from 800,000 yuan to 1.5 million yuan ($116,000 to $218,000). BYD will follow up by releasing an electric supercar.
The Chinese automaker typically has targeted the middle market with vehicles priced from 100,000 to 300,000 yuan. The high-end space is largely untrodden territory for BYD, but that is exactly where it needs to be to take on Tesla's Model X SUV.
BYD, which entered the automotive industry in 2003, has honed its technological prowess by learning from foreign manufacturers. The company opened a design center in 2019 at its Shenzhen headquarters and recruited top talent, such as former Audi designer Wolfgang Egger.
However, BYD likely faces three challenges in its expansion, the first being the fate of China's purchase subsidies for new energy vehicles. Last year, the company booked 10.4 billion yuan in receipts from those subsidies.
The automaker's net profit jumped 450% last year to 16.6 billion yuan, with subsidies contributing 60% of that according to simple arithmetic. But China ended the subsidies in December.
BYD's sales network is another factor. If the salespeople and maintenance staff affiliated with the company do not receive enough training, it could lead to complaints that injure the brand.
A Chinese web portal that collects customer complaints shows an outpouring of grievances against automakers across the board, including BYD, on how delivery times are being communicated as well as the process for booking test drives.
"
#word100File(Bat_text, "Bat")

#Q2
#return back to parent directory to read all files of  A3_Docs directory as corpus
setwd("C:/Users/DavidL/OneDrive/CS/FIT3152/A3")
cname = file.path(".", "A3_Docs") #get the folder path

#print(dir(cname)) #print all the file names under this directory/folder
#get multiple documents from the directory source
docs = Corpus(DirSource(cname)) #Corpus for multiple documents
#print(summary(docs))

#number of documents
#length(docs)

#Q3
#Tokenisation
#inspect(docs[[5]])
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, content_transformer(tolower))
#function to change target pattern into space
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
# Hyphen to space
#pattern = "-", this is replaced with space
docs <- tm_map(docs, toSpace, "-")

#Filter words
#Remove stop words and white space
docs <- tm_map(docs, removeWords, stopwords("english"))
#strip extra white space and leave with pure word
docs <- tm_map(docs, stripWhitespace)

#Stem, change each word back to their sterm
docs <- tm_map(docs, stemDocument, language = "english")

#Create DTM
dtm <- DocumentTermMatrix(docs)
#str(dtm)
#inspect(dtm)


#remove the words that have less than 90% present rate of the documents
dtms <- removeSparseTerms(dtm, 0.9)
dim(as.matrix(dtms))
#select top20 frequency tokens
token_dtm = dtms
freq <- colSums(as.matrix(token_dtm))
#order the word by their frequencies
ord = order(freq)
#get top20 frequency tokens
top20_tokens = freq[tail(ord, 20)]
token_names = names(top20_tokens)
#DTM to keep the top20 tokens columns
top20DTM <- dtms[, token_names]
top20DTM <- as.matrix(top20DTM)

#export dtms as a csv file since it is now a matrix
#write.csv(top20DTM, "A3_DTM.csv")
dim(top20DTM)

#Q4
#Euclidean Distance(similarity)
elu_matrix = dist(scale(top20DTM))
fit = hclust(elu_matrix, method = "ward.D")
#3 topic so 3 clusters
cutfit = cutree(fit, k = 3)
plot(fit,hang=-1)
sort(cutfit)

#Consince distance(similarity)
library(proxy)

# Create a DocumentTermMatrix
# Calculate cosine distance
cos_Matrix <- dist(scale(top20DTM), method = "cosine")
fit = hclust(cos_Matrix, method = "ward.D")
cos_cutfit = cutree(fit, k = 3)
plot(fit, hang = -1)
sort(cos_cutfit)


#Q5
#start with original document-terms matrix
#convert to binary matrix
dtms_bin_mat = as.matrix((top20DTM>0)+0)
dtms_bin_mat
#mutliple binary matrix by its transpose
ByAbsMatrix=dtms_bin_mat%*%t(dtms_bin_mat)
#head(ByAbsMatrix)

# make leading diagonal zero - remove loop from itself
#since closeness between one and itself must be closest
diag(ByAbsMatrix) = 0

par(mfrow=c(1,1))

#create graph object
library(igraph)
library(igraphdata)


#ByAbs = graph_from_adjacency_matrix(ByAbsMatrix, mode = "undirected", weighted = TRUE)
#plot(ByAbs)

#show strengh of connection/edge
#convert to contingency table then dataframe to use $ to get weight of edge
edges_df = as.data.frame(as.table(ByAbsMatrix))
colnames(edges_df) = c("u", "v", "weight")
edges_df <- edges_df[edges_df$weight > 0,]
#remove loop to itself or useless edges (zero-weight)

#create graph
Abs_nw = graph_from_data_frame(edges_df, directed = FALSE)

#network statistic
d = as.table(degree(Abs_nw))
#from a list of vertices with their own degree, then convert to a table
b = as.table(betweenness(Abs_nw))
c = as.table(closeness(Abs_nw))
#Eigeencentrality
e = as.table(evcent(Abs_nw)$vector)

#bind all those rows
#4 matrics in the row for each vertex listed in column
stats = as.data.frame(rbind(d,b,c,e))
#stats
#t - transpose to turn row into column
stats = as.data.frame(t(stats))
colnames(stats) = c("degree", "betweenness","closeness", "eigenvector")
#sort and explore key nodes
#head(stats)
#node has most hub potential
#stats[order(-stats$betweenness),][1,]
stats[order(-stats$betweenness),]
#Tesla1 has highest betweeness - 73.8, closeness - 0.04000000, so the most important 
#Tesla2.txt     28  15.9627106 closeness - 0.02857143
#BYD5.txt       30  12.4163370 closeness - 0.03125000

stats[order(-stats$closeness),]
stats[order(-stats$eigenvector),]
#vector importance, numebr of connection
stats[order(-stats$degree),]


#create network
#thicker the connection, 
#plot(Abs_nw, edge.width = E(Abs_nw)$weight)

#clear groups/cluster among documents by community detection
#create adjacency matrix
#create community groupings
#ceb = cluster_edge_betweenness(Abs_nw)
#cluster_fast_greedy only work on single-edge network
#cfb = cluster_fast_greedy(Abs_nw)
#clp = cluster_label_prop(Abs_nw)
cle = cluster_leading_eigen(Abs_nw)

#plot network
#scaling
#install.packages("scales")
library(scales)
# Rescale the edge weights to the range [1, 3] to avoid negative weighted edge
E(Abs_nw)$weight <- rescale(E(Abs_nw)$weight, to = c(1, 3))
#create community in the network
#plot(ceb, Abs_nw,vertex.label=V(Abs_nw)$role,main="Edge Betweenness")
#cluster/communities with fast greedy can not work on mutltiple edges
#plot(cfb, Abs_nw,vertex.label=V(Abs_nw)$role,main="Fast Greedy")
#plot(clp, Abs_nw,vertex.label=V(Abs_nw)$role,main="Label Propogation")
plot(cle, Abs_nw,vertex.label=V(Abs_nw)$role,vertex.size = betweenness(Abs_nw)
     ,edge.width=E(Abs_nw)$weight, main="Leading EigenVector for Abstract Matrix")

# Add legend to network
#node  pt.cex = point size (vertex size), pch = different plotting character
legend("topright",legend = c("Low Betw", "High Betw"),pch = 16
       ,pt.cex = c(1, 2),bty = "n")

#strength of connection/edge weight
#led to set line width, bty to set the box around plot
legend("bottomright",legend = c("Weak Strength","Medium Strength","Strong Strength")
       ,lwd = c(1,2,3),bty = "n")



#Q6
#convert to binary matrix
dtms_bin_mat = as.matrix((top20DTM>0)+0)

#Token matrix
tokenMat = t(dtms_bin_mat)%*%(dtms_bin_mat)
diag(tokenMat) = 0

#ByAbs = graph_from_adjacency_matrix(ByAbsMatrix, mode = "undirected", weighted = TRUE)
#plot(ByAbs)

#show strengh of connection/edge
#convert to contingency table then dataframe to use $ to get weight of edge
edges_df = as.data.frame(as.table(tokenMat))
colnames(edges_df) = c("u", "v", "weight")
edges_df
edges_df <- edges_df[edges_df$weight > 0,]
#edges_df
#remove loop to itself or useless edges (zero-weight)
#edges_df

#create graph
token_nw = graph_from_data_frame(edges_df, directed = FALSE)

#network statistic
d = as.table(degree(token_nw))
#from a list of vertices with their own degree, then convert to a table
b = as.table(betweenness(token_nw))
c = as.table(closeness(token_nw))
#Eigeencentrality
e = as.table(evcent(token_nw)$vector)

#bind all those rows
#4 matrics in the row for each vertex listed in column
stats = as.data.frame(rbind(d,b,c,e))
#stats
#t - transpose to turn row into column
stats = as.data.frame(t(stats))

colnames(stats) = c("degree", "betweenness","closeness", "eigenvector")
#sort and explore key nodes
#head(stats)
#node has most hub potential
#stats[order(-stats$betweenness),][1,]
#dim(stats)
stats[order(-stats$betweenness),]
stats[order(-stats$closeness),]
stats[order(-stats$eigenvector),]
#vector importance, numebr of connection
stats[order(-stats$degree),]
#manufactur    238    158.2729 0.005025126   0.7708475

#create network
#thicker the connection, 
#plot(Abs_nw, edge.width = E(Abs_nw)$weight)

#clear groups/cluster among documents by community detection
#create adjacency matrix
#create community groupings
#ceb = cluster_edge_betweenness(token_nw)
cle = cluster_leading_eigen(token_nw)


#plot network
#scaling
# Rescale the edge weights to the range [1, 3] to avoid negative weighted edge
E(token_nw)$weight <- rescale(E(token_nw)$weight, to = c(1, 3))
#create community in the network
#plot(ceb, token_nw,vertex.label=V(token_nw)$role,vertex.size = betweenness(token_nw)
#     ,edge.width=E(token_nw)$weight,main="Edge Betweenness")
plot(cle, token_nw,vertex.label=V(token_nw)$role,vertex.size = betweenness(token_nw)
     ,edge.width=E(token_nw)$weight, main="Leading EigenVector for Token Matrix")

# Add legend to network
#node  pt.cex = point size (vertex size), pch = different plotting character
legend("topright",legend = c("Low Betw", "High Betw"),pch = 16
       ,pt.cex = c(1, 2),bty = "n")

#strength of connection/edge weight
#led to set line width, bty to set the box around plot
legend("bottomright",legend = c("Weak Strength","Medium Strength","Strong Strength")
       ,lwd = c(1,2,3),bty = "n")




#Q7
# start with document term matrix dtms
#head(top20DTM)
top20DTM_bipar = as.data.frame(top20DTM)
#row names to Abs column
top20DTM_bipar$Abs = rownames(top20DTM_bipar)
dim(top20DTM_bipar)
dtmsb = data.frame()

for (i in 1:nrow(top20DTM_bipar)){
  for (j in 1:(ncol(top20DTM_bipar)-1)){
    #cbind used to bind value like column 
    #bind value with corresponding document name and token in a row
    touse = cbind(top20DTM_bipar[i,j],top20DTM_bipar[i,ncol(top20DTM_bipar)]
                   ,colnames(top20DTM_bipar[j]))
    #bind as row to a dataset
    dtmsb = rbind(dtmsb,touse)
  }
}


colnames(dtmsb) = c("weight", "abs", "token")
dtmsc = dtmsb[dtmsb$weight != 0,] # delete 0 weights
#switch the column to correct position
dtmsc = dtmsc[,c(2,3,1)]

dtmsc$weight = as.numeric(dtmsc$weight)
dtmsc$weight = rescale(dtmsc$weight, to = c(1,3))
dtmsc$weight = format(dtmsc$weight, digits = 0)
#create bipartite network
bipar <- graph.data.frame(dtmsc, directed=FALSE)

#network statistic
d = as.table(degree(bipar))
#from a list of vertices with their own degree, then convert to a table
b = as.table(betweenness(bipar))
c = as.table(closeness(bipar))
#Eigeencentrality
e = as.table(evcent(bipar)$vector)

#bind all those rows
#4 matrics in the row for each vertex listed in column
stats = as.data.frame(rbind(d,b,c,e))
stats = as.data.frame(t(stats))
colnames(stats) = c("degree", "betweenness","closeness", "eigenvector")

cle = cluster_leading_eigen(bipar)


#map bipartite with the graph
bipartite.mapping(bipar)

#two type, one is token, one is document
V(bipar)$type <- bipartite_mapping(bipar)$type
V(bipar)$color <- ifelse(V(bipar)$type, "lightblue", "salmon")
V(bipar)$shape <- ifelse(V(bipar)$type, "circle", "square")
E(bipar)$color <- "lightgray"

#plot network
plot(bipar,edge.width=E(bipar)$weight)
#scaling
# Rescale the edge weights to the range [1, 3] to avoid negative weighted edge
#E(bipar)$weight <- rescale(E(bipar)$weight, to = c(1, 3))
#create community in the network
plot(cle, bipar,vertex.label=V(bipar)$role,vertex.size = degree(bipar)
     ,edge.width=E(bipar)$weight, main="Bipartite Martching with Leading EigenVector Clustering")

# Add legend to network
#node  pt.cex = point size (vertex size), pch = different plotting character
legend("topright",legend = c("Low Degree", "High Degree"),pch = 16
       ,pt.cex = c(1, 2),bty = "n")

#strength of connection/edge weight
#led to set line width, bty to set the box around plot
legend("bottomright",legend = c("Weak Strength","Medium Strength","Strong Strength")
       ,lwd = c(1,2,3),bty = "n")



