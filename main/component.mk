#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

COMPONENT_DEPENDS := mrubyc
COMPONENT_EXTRA_CLEAN = SRCFILES

MRBC = mrbc
SRCDIR = $(PROJECT_PATH)/mrblib
SRCFILES = $(wildcard $(SRCDIR)/*.rb) $(wildcard $(SRCDIR)/**/*.rb)
OBJS = $(patsubst %.rb,%.h,$(SRCFILES))
OUTSRCS = $(subst $(SRCDIR),$(COMPONENT_BUILD_DIR),$@)
OUTDIRS = $(dir $(OUTSRCS))

main.o: $(OBJS)

$(SRCDIR)/%.h: $(SRCDIR)/%.rb
	@if [ ! -d $(OUTDIRS) ]; \
		then echo "mkdir -p $(OUTDIRS)"; mkdir -p $(OUTDIRS); \
		fi
	@echo $(MRBC) -E -B $(basename $(notdir $@)) -o $(OUTSRCS) $^
	$(MRBC) -E -B $(basename $(notdir $@)) -o $(OUTSRCS) $^
