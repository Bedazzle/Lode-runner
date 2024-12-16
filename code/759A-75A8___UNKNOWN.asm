L759A:  
	PUSH BC
	CALL wait_for_key

	CP $FF
	POP BC
	RET Z

	POP BC
	POP BC
	POP BC
	EI
	JP print_menu
