TOP_ENTITY = tb           
OUTPUT = out.vcd             
STOP_TIME = 50ms            

WORK_FILE = work-obj08.cf
OPTIONS = --std=08 --ieee=synopsys
VHDL_FILES = $(wildcard *.vhdl) $(wildcard *.vhd) $(wildcard *.v)

all: build simulate

syntax: ${VHDL_FILES}
	@ghdl -s ${OPTIONS} ${VHDL_FILES} || echo "ERRO!!!"

build: ${WORK_FILE}

${WORK_FILE}: ${VHDL_FILES}
	ghdl -a ${OPTIONS} ${VHDL_FILES}
	ghdl -e ${OPTIONS} ${TOP_ENTITY}

${OUTPUT}: ${WORK_FILE}
	ghdl -r ${OPTIONS} ${TOP_ENTITY} --vcd=${OUTPUT} --stop-time=${STOP_TIME}

simulate: ${OUTPUT}
	gtkwave ${OUTPUT}

clean:
	@rm -f ${OUTPUT} *.o *.exe *.cf