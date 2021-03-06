ds #002760一个月的数据
str(ds)

#合并日期和时间
datetime <- paste(ds$TRDDATE,ds$TRADETIME)

###########用strptime()只能生成有日期和时间的量，若代入数据没有日期，默认产生今天日期。
e <- "20161201 091703603"
ee <- gsub("(....)(..)(..)(...)(..)(..)","\\1-\\2-\\3\\4:\\5:\\6.",e) #正则表达分割
eee <- strptime(ee,format="%Y-%m-%d %H:%M:%OS")
eee

str(eee)
##############用正则表达把字符串分割为标准形式，再用strptime变成时间型

##############代入实际数据尝试
datetime <- paste(ds$TRDDATE,ds$TRADETIME)
datetime1 <- gsub("(....)(..)(..)(...)(..)(..)","\\1-\\2-\\3\\4:\\5:\\6.",datetime)
datetime2 <- strptime(datetime1,format="%Y-%m-%d %H:%M:%OS")
op <- options(digits.secs = 3) #保留秒后三位
datetime2
str(datetime2)
length(datetime2[2])
#POSIXlt[1:94347], format: "2016-12-01 09:17:03.60" "2016-12-01 09:18:42.13" ...
#秒以下应该为千分之一秒，小数点后三位。但是数据最后一位都是零，被省略了。

####################将新产生的时间列替换原数据框的两列时间
names(datetime2) <- "DATETIME"
ds1 <- ds[,-2]
ds2 <- ds1[,-2]
ds2$DATETIME <- datetime2

str(ds2)
View(ds2)

####尝试过程####################################
################################################
################################################
################################################
ds_tradedate <- as.Date(ds$TRDDATE, format="%Y%m%d",head=T)#管用的写法，不加标题会只有NA
str(ds_tradedate)

str(ds$TRADETIME)
ds_tradetime <- as.Date.character(ds$TRADETIME, format="%H:%M:%OS")
ds_tradetime <- strptime(ds$TRADETIME, "%H:%M:%OS")
ds_tradetime
op <- options(digits.secs = 3)
ds_tradetime

a <- strptime("091703600", "%H%M%OS")
op <- options(digits.secs = 3)
a
format(ds$TRADETIME)
as.POSIXct(strptime(ds$TRADETIME, format = "%H:%M:%OS"))
str("091703600")
as.POSIXct("091703", format = "%H:%M:%S")


###########################################################
z <- strptime("20/2/06 11:16:16.683", "%d/%m/%y %H:%M:%OS")
z # prints without fractional seconds
op <- options(digits.secs = 3)
z
options(op)
a <- Sys.Date()
str(a)

ds[2,13]
str(ds[2,13])
sapply(ds, class)
?strptime


unclass(as.Date("1970-02-01")) 
today<-Sys.time()
unclass(as.POSIXlt(today))
unclass(as.POSIXct(today))
###########################################################


as.Date(datetime[1], format="%d/%m/%y %H:%M:%OS")

aaa<-"aa;bb;cc"
ccc<-strsplit(aaa,split=";")
bbb<- unlist(strsplit(aaa,split=";")) ; bbb
bbb[2]
str(bbb)
length(bbb)

length(datetime[1])
a <- "20161201"
gsub("(....)(..)","\\1-\\2-",a)

as.Date(a,"%Y%m%d")

b <- "091703603"
bb <- gsub("(..)(..)(..)","\\1:\\2:\\3.",b)
bbb <- strptime(bb, "%H:%M:%OS")
op <- options(digits.secs = 3)
bbb
str(bbb)