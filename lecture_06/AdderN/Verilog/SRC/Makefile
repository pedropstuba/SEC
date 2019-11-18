adder: adder.v adder_tb.v
	iverilog -o adder  adder.v adder_tb.v
	./adder

clean: 
	rm -f adder *~ *.vcd

.PHONY: clean all
