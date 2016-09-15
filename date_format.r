today <- Sys.Date()
class(today)                            # Date
format(today,"%a")                    # Thu
format(today,"%A")                    # Thursday
format(today,"%d")                    # 01
format(today,"%e")                    # " 1"
format(today,"%j")                    # 245 (yearday)
format(today,"%u")                    # 4 (start is Monday)
wdaynum <- as.numeric(format(today,"%u"))

this.week <- format(today,"%Y%W")
week.twelve.weeks.ago <- format(today - 7*12,"%Y%W")
