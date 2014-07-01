from time import time
def fib(n):
    if n < 2:
        return n
    else:
        return fib(n-1) + fib(n-2)
start = time()
f=fib(36)
stop = time()
print('time taken: %0.4f' % (stop - start))
print('result:', f)
