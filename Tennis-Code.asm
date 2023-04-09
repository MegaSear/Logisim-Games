asect  0xee
error_y: ds 1
error_x: ds 1
y: ds 1
x: ds 1
dy: ds 1
dx: ds 1
y_r0_new: ds 1
y_r0_old: ds 1
change_dir: ds 1
y_r1: ds 1
y_max: ds 1
x_max: ds 1
sign: ds 1
asect  0x00
ldi r0, error_x
ldi r1, 0
st r0, r1
ldi r0, error_y
ldi r1, 0
st r0, r1
ldi r0, dy
ldi r1, 1
st r0, r1
ldi r0, dx
ldi r1, -1
st r0, r1
ldi r0, y
ldi r1, 10
st r0, r1
ldi r0, x
ldi r1, 20
st r0, r1
ldi r0, y_r1
ldi r1, 15
st r0, r1
ldi r0, y_max
ldi r1, 2
st r0, r1
ldi r0, x_max
ldi r1, 2
st r0, r1
ldi r0, sign
ldi r1, 1
st r0, r1
jsr start
my_program:
ldi r1, 31
ldi r2, 0
ldi r0, y
ld r0, r0
if 
	cmp r0, r1
is eq
	ldi r0, dy
	ldi r3, -1
	st r0, r3
else
	if
		cmp r0, r2
	is eq
		ldi r0, dy
		ldi r3, 1
		st r0, r3
	fi		
fi

ldi r0, x
ld r0, r0
if 
	cmp r0, r1
is eq
	ldi r0, dx
	ldi r3, -1
	st r0, r3
else
	if
		cmp r0, r2
	is eq
		ldi r0, dx
		ldi r3, 1
		st r0, r3
	fi		
fi
jsr start
###############INFO##########################
start:
pop r0
if
	ldi r2, 1
	ldi r3, change_dir
	ld r3, r3
	cmp r3, r2
is eq
	ldi r0, dx
	ld r0, r1
	neg r1
	st r0, r1
fi

####################Bresenham##################
ldi r0, sign
ld r0, r0
ldi r1, 1
if
	cmp r0, r1
is eq
ldi r0, 2 #delx + 1
ldi r3, error_x
ld r3, r1
add r0, r1
st r3, r1     #error update
if
	ld r3, r1
	cmp r1, r0
is pl
	ldi r0, dx
	ld r0, r0
	ldi r1, x
	ld r1, r2
	add r0, r2
	st r1, r2 #x update
	ld r3, r1
	ldi r2, y_max #error_max #error_max = 2 =  delx+1
	ld r2, r2
	sub r1, r2
	st r3, r2 #error update
fi
ldi r3, y
ld r3, r1
ldi r0, dy
ld r0, r0
add r0, r1
st r3, r1 #y update
else 
ldi r0, 2 #dely + 1
ldi r3, error_y
ld r3, r1
add r0, r1
st r3, r1     #error update
if
	ld r3, r1
	cmp r1, r0
is pl
	ldi r0, dy
	ld r0, r0
	ldi r1, y
	ld r1, r2
	add r0, r2
	st r1, r2 #y update
	ld r3, r1
	ldi r2, x_max #error_max #error_max = 2 =  dely+1
	ld r2, r2
	sub r1, r2
	st r3, r2 #error update
fi
ldi r3, x
ld r3, r1
ldi r0, dx
ld r0, r0
add r0, r1
st r3, r1 #x update
fi
br my_program
		
end

