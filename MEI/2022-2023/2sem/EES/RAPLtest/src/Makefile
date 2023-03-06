INPUTSIZE=1
NTIMES=10
export INPUTSIZE
export NTIMES

compile:
	gcc -O2 -o c_counting_sort c_counting_sort.c
	gcc -O2 -o c_insertion_sort c_insertion_sort.c
	gcc -O2 -o c_quick_sort c_quick_sort.c

run:
	./c_counting_sort $(INPUTSIZE)
	./c_insertion_sort $(INPUTSIZE)
	./c_quick_sort $(INPUTSIZE)

measure: 
	sudo ../RAPL/main "c_counting_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 python_counting_sort.py $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "c_insertion_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 python_insertion_sort.py $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "c_quick_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 python_quick_sort.py $(INPUTSIZE)" $(NTIMES)

clean:
	rm -rf c_counting_sort c_insertion_sort c_quick_sort *.o
