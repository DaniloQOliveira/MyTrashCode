INPUTSIZE=1
NTIMES=10
export INPUTSIZE
export NTIMES

compile:
	gcc -O2 -o counting_sort counting_sort.c
	gcc -O2 -o insertion_sort insertion_sort.c
	gcc -O2 -o quick_sort quick_sort.c

run:
	./counting_sort $(INPUTSIZE)
	./insertion_sort $(INPUTSIZE)
	./quick_sort $(INPUTSIZE)

measure: 
	sudo ../RAPL/main "counting_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 counting_sort.py $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "insertion_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 insertion_sort.py $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "quick_sort $(INPUTSIZE)" $(NTIMES)
	sudo ../RAPL/main "python3 quick_sort.py $(INPUTSIZE)" $(NTIMES)

clean:
	rm -rf counting_sort insertion_sort quick_sort *.o
