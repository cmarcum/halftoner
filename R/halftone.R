#Plotting routines to generate an approximate reprographic using 
# halftone with arbitrary units
#
#There are currently two methods for downsampling the base image
# seq uses a uniformly spaced sequence 
#img.src https://flic.kr/p/GUFEis

halftone<-function(img,channel=1,x.samp=100,y.samp=100,deg=0,invert=FALSE,thresh=0,seed=1852,method="seq"){
   if(length(dim(img))>2){
    img<-as.matrix(img[,,channel])
   }
   if(!invert){img<-1-img}
   img.dim<-dim(img)
   set.seed(seed)
   if(method=="samp"){
   img.x.samp<-sort(sample(img.dim[1],x.samp))
   img.y.samp<-sort(sample(img.dim[2],y.samp))
   img.samp<-img[img.x.samp,img.y.samp]
   img.xy<-which(img.samp>=thresh,arr.ind=TRUE)
   }
   
   if(method=="seq"){
   img.x.samp<-seq(1,img.dim[1],by=ceiling(img.dim[1]/x.samp))
   img.y.samp<-seq(1,img.dim[2],by=ceiling(img.dim[2]/y.samp))
   img.samp<-img[img.x.samp,img.y.samp]
   img.xy<-which(img.samp>=thresh,arr.ind=TRUE)
   }
   
   img.xy<-rotate(img.xy[,1],img.xy[,2],deg=-90)
   
   val<-img.samp[which(img.samp>=thresh)]

   if(deg!=0){
      rot.mat<-rotate(img.xy[,1],img.xy[,2],deg=deg)
      ht<-list(rot.mat,val)
      class(ht)<-"halftone"
      return(ht)
   }
   ht<-list(img.xy,val)
   class(ht)<-"halftone"
   return(ht)
}

setClass("halftone", representation(id = "character"),
         contains = "list")

setMethod("plot",
    signature(x = "halftone"),
    function (x, y, ...) 
    {
      plot(x[[1]],cex=x[[2]],...)
    }
)

setMethod("points",
    signature(x = "halftone"),
    function (x, y, ...) 
    {
      points(x[[1]],cex=x[[2]],...)
    }
)

#plot.halftone<-function(ht,...){
#   plot(ht[[1]],cex=ht[[2]],...)
#}

#points.halftone<-function(ht,...){
#  points(ht[[1]],cex=ht[[2]],...)
#} 

rotate<-function(x,y,deg=90,centroid.fun=mean){
   rad<-deg*(pi/180)
   x.c<-centroid.fun(x)
   y.c<-centroid.fun(y)
   x.rot<-cos(rad)*(x-x.c)-sin(rad)*(y-y.c)+x.c
   y.rot<-sin(rad)*(x-x.c)+cos(rad)*(y-y.c)+y.c
   return(cbind(x.rot,y.rot))
}



