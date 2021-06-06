all:
	gprclean avi.gpr
	gprbuild avi.gpr

clean:
	gprclean avi.gpr

build:
	gprbuild avi.gpr
