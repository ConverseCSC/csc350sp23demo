# Define some new variables
EXE=cardtests
OBJS=*.o
CARDOBJS=PlayingCard.o UnoCard.o $(EXE).o
EXEFILES=main $(EXE) a.out

# First rule is default.  cardtests relies on the object files in $(CARDOBJS), which
#   make already knows how to make (by default).  The actual command is therefore
#   just the linker command.
cardtests: $(CARDOBJS)
	$(CXX) -o $(EXE) $(LDFLAGS) $(CARDOBJS) 

# main-debug: $(CARDOBJS)
#    $(CXX) -o main -DDEBUG $(LDFLAGS) $(CARDOBJS)

# .PHONY says that the listed make command isn't a file to be made
.PHONY: clean

# clean clears everything out.  It's handy when you have reason not to trust
#   that everything is up to date, because it forces make to recompile everything
#   from scratch.
clean:
	-rm $(OBJS) $(EXEFILES)