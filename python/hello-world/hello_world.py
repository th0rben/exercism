import time
print("hello world")

def hello(name=''):
	print("Nice to meet you " + name + "!")

name = input("What's your name? ")
hello(name)
age = input("Your age? ")
print("So, you are already " + str(age) + " years old, " + name + "!")

