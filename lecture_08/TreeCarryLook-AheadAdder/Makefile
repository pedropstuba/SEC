CLA_top: CLA_A.v CLA_B.v CLA_top.v CLA_tb.v
	iverilog -o CLA_A.v CLA_B.v CLA_top.v CLA_tb.v
	./CLA_top

clean: 
	rm -f CLA_top *~ *.vcd

.PHONY: clean all
