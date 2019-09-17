run_time<-end_time_f1 - start_time_f1

# works if I initialize the vector with a difftime object first
can_append<-c(run_time)
can_append<-append(can_append, run_time)

# also works if I initialize the vector with an NA object and then index into it
can_also_append<-c(NA,NA)
can_also_append[1]<-run_time