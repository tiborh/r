out.file <- "tmp.txt"

write(1:10,out.file)                    # same as writing on screen, breaks them into two lines
read.table(out.file)                    # data table of two rows, five coloumns

write.table(1:10,out.file)              # one column, 10 lines
read.table(out.file,header=T)           # dataframe of one column

write.table(1:10,out.file,row.names=F)  # rownames are needed only for named ones
read.table(out.file,header=T)           # same appearance as previous

