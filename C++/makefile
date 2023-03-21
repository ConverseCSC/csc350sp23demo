# Define some new variables
OBJS=*.o
CARDOBJS=PlayingCard.o cardtests.o
EXEFILES=cardtests a.out

cardtests-debug: $(CARDOBJS)
    $(CXX) -DDEBUG -o cardtests $(LDFLAGS) $(CARDOBJS)

# First rule is default.  cardtests relies on the object files in $(CARDOBJS), which
#   make already knows how to make (by default).  The actual command is therefore
#   just the linker command.
cardtests: $(CARDOBJS)
	$(CXX) -o cardtests $(LDFLAGS) $(CARDOBJS) 

# .PHONY says that the listed make command isn't a file to be made
.PHONY: clean

# clean clears everything out.  It's handy when you have reason not to trust
#   that everything is up to date, because it forces make to recompile everything
#   from scratch.
clean:
	-rm $(OBJS) $(EXEFILES)