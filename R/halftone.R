halftone<-function(img,channel=1,x.samp=100,y.samp=100,deg=0,invert=FALSE,thresh=0,seed=1852,method="seq"){
   if(length(dim(img))>2){
    img<-as.matrix(img[,,channel])
   }
   if(method!="none"&(x.samp>=dim(img)[1] | y.samp>=dim(img)[2])){stop("At least one sampling parameter exceeds dimensionality of original image. \n  Use smaller sampling values in x.samp|y.samp.")}
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
   
   if(method=="none"){
      img.samp<-img
      img.xy<-which(img.samp>=thresh,arr.ind=TRUE)
   }
   
   img.xy<-rotate(img.xy[,1],img.xy[,2],deg=-90)
   
   val<-img.samp[which(img.samp>=thresh)]

   if(deg!=0){
      rot.mat<-rotate(img.xy[,1],img.xy[,2],deg=deg)
      ht<-list(rot.mat,val)
      attr(ht,"grid")<-dim(img.samp)
      class(ht)<-c("halftone",class(ht))
      return(ht)
   }
   ht<-list(img.xy,val)
   attr(ht,"grid")<-dim(img.samp)
   class(ht)<-c("halftone",class(ht))
   return(ht)
}

## S4 Methods for halftone
#Switch from S4 to S3 methods per Michal's suggestion
#setClass("halftone", representation(id = "character"),
#         contains = "list")

#setMethod("plot",
#    signature(x = "halftone"),
#    function (x, y, ...) 
#    {
#      plot(x[[1]],cex=x[[2]],...)
#    }
#)

#setMethod("points",
#    signature(x = "halftone"),
#    function (x, y, ...) 
#    {
#      points(x[[1]],cex=x[[2]],...)
#    }
#)

## S3 methods for halftone
plot.halftone<-function(x,...){
   plot(x[[1]],cex=x[[2]],...)
}

points.halftone<-function(x,...){
  points(x[[1]],cex=x[[2]],...)
} 

# Rotate/orbit function
rotate<-function(x,y,deg=90,centroid.fun=mean){
   rad<-deg*(pi/180)
   x.c<-centroid.fun(x)
   y.c<-centroid.fun(y)
   x.rot<-cos(rad)*(x-x.c)-sin(rad)*(y-y.c)+x.c
   y.rot<-sin(rad)*(x-x.c)+cos(rad)*(y-y.c)+y.c
   return(cbind(x.rot,y.rot))
}

