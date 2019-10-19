PROGRAM = mindmaster

# provided by the VICE emulator
X128   ?= x128
C1541  ?= c1541
PETCAT ?= petcat

ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  DEL = -del /f
else
  DEL = $(RM)
endif

########################################

.PRECIOUS: %.d64
.PHONY: all clean

all: clean $(PROGRAM)

%.prg: %.bas
	@$(PETCAT) -70 -w70 -l 4001 -o $@ -- $^

%.d64: %.prg %.chr
	$(C1541) -format $(PROGRAM),KF d64 $@ -write $< -write $(word 2, $^)

%: %.d64
	@$(X128) -ntsc -basicload $<

clean:
	$(DEL) *.d64
