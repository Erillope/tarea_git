	.file	"Main.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Ingresa tus credenciales (Puedes ver tus credenciales en el archivo usuarios.txt):\0"
.LC1:
	.ascii "\12Usuario: \0"
.LC2:
	.ascii "%s\0"
.LC3:
	.ascii "\12Clave: \0"
.LC4:
	.ascii "Ingreso exitoso al sistema\0"
	.align 8
.LC5:
	.ascii "Ingreso fallido usuario/clave err\303\263neo\0"
	.align 8
.LC6:
	.ascii "Usuario o clave invalida, revise el archivo usuarios.txt\0"
.LC7:
	.ascii "Salida del sistema\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$256, %rsp
	.seh_stackalloc	256
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	puts
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	.LC3(%rip), %rcx
	call	printf
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	-96(%rbp), %rdx
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	iniciarUsuario
	movb	%al, 127(%rbp)
	cmpb	$0, 127(%rbp)
	je	.L2
	leaq	16(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	guardar_log
	leaq	16(%rbp), %rax
	movq	%rax, %rcx
	call	init
	jmp	.L3
.L2:
	leaq	16(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	guardar_log
	leaq	.LC6(%rip), %rcx
	call	puts
.L3:
	leaq	16(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	guardar_log
	movl	$0, %eax
	addq	$256, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "Triangulo\0"
.LC9:
	.ascii "Paralelogramo\0"
.LC10:
	.ascii "Cuadrado\0"
.LC11:
	.ascii "Rectangulo\0"
.LC12:
	.ascii "Rombo\0"
.LC13:
	.ascii "Trapecio\0"
.LC14:
	.ascii "Circulo\0"
.LC15:
	.ascii "Poligono Regular\0"
.LC16:
	.ascii "Cubo\0"
.LC17:
	.ascii "Cuboide\0"
.LC18:
	.ascii "Cilindro Recto\0"
.LC19:
	.ascii "Esfera\0"
.LC20:
	.ascii "Cono Circular Recto\0"
	.text
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$1648, %rsp
	.seh_stackalloc	1648
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 1536(%rbp)
	leaq	-96(%rbp), %rax
	movl	$1600, %edx
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	leaq	.LC8(%rip), %rax
	movq	%rax, -96(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -88(%rbp)
	leaq	.LC10(%rip), %rax
	movq	%rax, -80(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC13(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC14(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC17(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	.LC18(%rip), %rax
	movq	%rax, -16(%rbp)
	leaq	.LC19(%rip), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC20(%rip), %rax
	movq	%rax, 0(%rbp)
	movb	$1, 1519(%rbp)
.L6:
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	preguntarFiguraGeometrica
	movl	%eax, 1512(%rbp)
	movl	1512(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	movq	1536(%rbp), %rcx
	call	guardar_log
	movl	1512(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-96(%rbp,%rax,8), %rdx
	movl	1512(%rbp), %eax
	movl	%eax, %ecx
	call	preguntarMetodo
	movl	%eax, 1508(%rbp)
	movl	1512(%rbp), %edx
	movl	1508(%rbp), %eax
	movl	%eax, %ecx
	call	calcular
	call	preguntarContinuar
	movb	%al, 1519(%rbp)
	cmpb	$0, 1519(%rbp)
	jne	.L6
	nop
	addq	$1648, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC21:
	.ascii "r\0"
.LC22:
	.ascii "usuarios.txt\0"
.LC23:
	.ascii "%[^-]-%s\0"
	.text
	.globl	iniciarUsuario
	.def	iniciarUsuario;	.scl	2;	.type	32;	.endef
	.seh_proc	iniciarUsuario
iniciarUsuario:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$368, %rsp
	.seh_stackalloc	368
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 256(%rbp)
	movq	%rdx, 264(%rbp)
	leaq	.LC21(%rip), %rdx
	leaq	.LC22(%rip), %rcx
	call	fopen
	movq	%rax, 232(%rbp)
	jmp	.L8
.L11:
	leaq	16(%rbp), %rcx
	leaq	-96(%rbp), %rdx
	leaq	128(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	leaq	.LC23(%rip), %rdx
	movq	%rax, %rcx
	call	sscanf
	cmpl	$2, %eax
	jne	.L8
	leaq	-96(%rbp), %rax
	movq	%rax, %rdx
	movq	256(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L8
	leaq	16(%rbp), %rax
	movq	264(%rbp), %rcx
	movq	%rax, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L8
	movq	232(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$1, %eax
	jmp	.L12
.L8:
	movq	232(%rbp), %rdx
	leaq	128(%rbp), %rax
	movq	%rdx, %r8
	movl	$100, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L11
	movl	$0, %eax
.L12:
	addq	$368, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC24:
	.ascii "a\0"
.LC25:
	.ascii "log.txt\0"
.LC26:
	.ascii "%s-%s-%s\12\0"
	.text
	.globl	guardar_log
	.def	guardar_log;	.scl	2;	.type	32;	.endef
	.seh_proc	guardar_log
guardar_log:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	leaq	.LC24(%rip), %rdx
	leaq	.LC25(%rip), %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	call	fecha
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	16(%rbp), %r9
	movq	%rcx, %r8
	leaq	.LC26(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC27:
	.ascii "%Y-%m-%d %H:%M:%S\0"
	.text
	.globl	fecha
	.def	fecha;	.scl	2;	.type	32;	.endef
	.seh_proc	fecha
fecha:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$0, %ecx
	call	time
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	localtime
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %r9
	leaq	.LC27(%rip), %r8
	movl	$50, %edx
	leaq	fecha_formateada.5049(%rip), %rcx
	call	strftime
	leaq	fecha_formateada.5049(%rip), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "%d. %s\12\0"
.LC29:
	.ascii "\12Elige una figura:\12%s\12\0"
	.text
	.globl	preguntarFiguraGeometrica
	.def	preguntarFiguraGeometrica;	.scl	2;	.type	32;	.endef
	.seh_proc	preguntarFiguraGeometrica
preguntarFiguraGeometrica:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	subq	$600, %rsp
	.seh_stackalloc	600
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 496(%rbp)
	movq	$0, -48(%rbp)
	leaq	-40(%rbp), %rdx
	movl	$0, %eax
	movl	$61, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	movl	$0, 460(%rbp)
	jmp	.L17
.L18:
	movl	460(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	496(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	460(%rbp), %eax
	leal	1(%rax), %edx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r9
	movl	%edx, %r8d
	leaq	.LC28(%rip), %rdx
	movq	%rax, %rcx
	call	sprintf
	leaq	-96(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strcat
	addl	$1, 460(%rbp)
.L17:
	cmpl	$12, 460(%rbp)
	jle	.L18
	leaq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC29(%rip), %rcx
	call	printf
	leaq	-50(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	-50(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	addq	$600, %rsp
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "\12\302\277Desea calcular perimetro o area de la figura %s?:\12"
	.ascii "1.Perimetro\12"
	.ascii "2.Area\12\0"
	.align 8
.LC31:
	.ascii "\12\302\277Desea calcular superficie o volumen de la figura %s?:\12"
	.ascii "1.Superficie\12"
	.ascii "2.Volumen\12\0"
	.text
	.globl	preguntarMetodo
	.def	preguntarMetodo;	.scl	2;	.type	32;	.endef
	.seh_proc	preguntarMetodo
preguntarMetodo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpl	$8, 16(%rbp)
	jg	.L21
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rcx
	call	printf
	leaq	-2(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	-2(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	jmp	.L23
.L21:
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC31(%rip), %rcx
	call	printf
	leaq	-2(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	-2(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	addl	$2, %eax
.L23:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calcularPerimetro
	.def	calcularPerimetro;	.scl	2;	.type	32;	.endef
	.seh_proc	calcularPerimetro
calcularPerimetro:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$8, 16(%rbp)
	ja	.L35
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L27(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L27(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L27:
	.long	.L35-.L27
	.long	.L34-.L27
	.long	.L33-.L27
	.long	.L32-.L27
	.long	.L31-.L27
	.long	.L30-.L27
	.long	.L29-.L27
	.long	.L28-.L27
	.long	.L26-.L27
	.text
.L34:
	call	preguntarPerimetroTriangulo
	jmp	.L25
.L33:
	call	preguntarPerimetroParalelogramo
	jmp	.L25
.L32:
	call	preguntarPerimetroCuadrado
	jmp	.L25
.L31:
	call	preguntarPerimetroRectangulo
	jmp	.L25
.L30:
	call	preguntarPerimetroRombo
	jmp	.L25
.L29:
	call	preguntarPerimetroTrapecio
	jmp	.L25
.L28:
	call	preguntarPerimetroCirculo
	jmp	.L25
.L26:
	call	preguntarPerimetroPoligonoRegular
	nop
.L25:
.L35:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calcularArea
	.def	calcularArea;	.scl	2;	.type	32;	.endef
	.seh_proc	calcularArea
calcularArea:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$8, 16(%rbp)
	ja	.L47
	movl	16(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L39(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L39(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L39:
	.long	.L47-.L39
	.long	.L46-.L39
	.long	.L45-.L39
	.long	.L44-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L46:
	call	preguntarAreaTriangulo
	jmp	.L37
.L45:
	call	preguntarAreaParalelogramo
	jmp	.L37
.L44:
	call	preguntarAreaCuadrado
	jmp	.L37
.L43:
	call	preguntarAreaRectangulo
	jmp	.L37
.L42:
	call	preguntarAreaRombo
	jmp	.L37
.L41:
	call	preguntarAreaTrapecio
	jmp	.L37
.L40:
	call	preguntarAreaCirculo
	jmp	.L37
.L38:
	call	preguntarAreaPoligonoRegular
	nop
.L37:
.L47:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calcularSuperficie
	.def	calcularSuperficie;	.scl	2;	.type	32;	.endef
	.seh_proc	calcularSuperficie
calcularSuperficie:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	subl	$9, %eax
	cmpl	$4, %eax
	ja	.L56
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L51(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L51(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L51:
	.long	.L55-.L51
	.long	.L54-.L51
	.long	.L53-.L51
	.long	.L52-.L51
	.long	.L50-.L51
	.text
.L55:
	call	preguntarSuperficieCubo
	jmp	.L49
.L54:
	call	preguntarSuperficieCuboide
	jmp	.L49
.L53:
	call	preguntarSuperficieCilindroRecto
	jmp	.L49
.L52:
	call	preguntarSuperficieEsfera
	jmp	.L49
.L50:
	call	preguntarSuperficieConoCircularRecto
	nop
.L49:
.L56:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calcularVolumen
	.def	calcularVolumen;	.scl	2;	.type	32;	.endef
	.seh_proc	calcularVolumen
calcularVolumen:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	subl	$9, %eax
	cmpl	$4, %eax
	ja	.L65
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L60(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L60(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L60:
	.long	.L64-.L60
	.long	.L63-.L60
	.long	.L62-.L60
	.long	.L61-.L60
	.long	.L59-.L60
	.text
.L64:
	call	preguntarVolumenCubo
	jmp	.L58
.L63:
	call	preguntarVolumenCuboide
	jmp	.L58
.L62:
	call	preguntarVolumenCilindroRecto
	jmp	.L58
.L61:
	call	preguntarVolumenEsfera
	jmp	.L58
.L59:
	call	preguntarVolumenConoCircularRecto
	nop
.L58:
.L65:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calcular
	.def	calcular;	.scl	2;	.type	32;	.endef
	.seh_proc	calcular
calcular:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$2, 16(%rbp)
	je	.L67
	cmpl	$2, 16(%rbp)
	jg	.L68
	cmpl	$1, 16(%rbp)
	je	.L69
	jmp	.L73
.L68:
	cmpl	$3, 16(%rbp)
	je	.L71
	cmpl	$4, 16(%rbp)
	je	.L72
	jmp	.L73
.L69:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	calcularPerimetro
	jmp	.L70
.L67:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	calcularArea
	jmp	.L70
.L71:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	calcularSuperficie
	jmp	.L70
.L72:
	movl	24(%rbp), %eax
	movl	%eax, %ecx
	call	calcularVolumen
	nop
.L70:
.L73:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC32:
	.ascii "\12\302\277Desea calcular algo mas? (Presione 1 para si, 0 para no):\0"
	.text
	.globl	preguntarContinuar
	.def	preguntarContinuar;	.scl	2;	.type	32;	.endef
	.seh_proc	preguntarContinuar
preguntarContinuar:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC32(%rip), %rcx
	call	puts
	leaq	-2(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	scanf
	leaq	-2(%rbp), %rax
	movq	%rax, %rcx
	call	atoi
	cmpl	$1, %eax
	sete	%al
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
.lcomm fecha_formateada.5049,50,32
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	sscanf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	localtime;	.scl	2;	.type	32;	.endef
	.def	strftime;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroTriangulo;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroParalelogramo;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroCuadrado;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroRectangulo;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroRombo;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroTrapecio;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroCirculo;	.scl	2;	.type	32;	.endef
	.def	preguntarPerimetroPoligonoRegular;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaTriangulo;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaParalelogramo;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaCuadrado;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaRectangulo;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaRombo;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaTrapecio;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaCirculo;	.scl	2;	.type	32;	.endef
	.def	preguntarAreaPoligonoRegular;	.scl	2;	.type	32;	.endef
	.def	preguntarSuperficieCubo;	.scl	2;	.type	32;	.endef
	.def	preguntarSuperficieCuboide;	.scl	2;	.type	32;	.endef
	.def	preguntarSuperficieCilindroRecto;	.scl	2;	.type	32;	.endef
	.def	preguntarSuperficieEsfera;	.scl	2;	.type	32;	.endef
	.def	preguntarSuperficieConoCircularRecto;	.scl	2;	.type	32;	.endef
	.def	preguntarVolumenCubo;	.scl	2;	.type	32;	.endef
	.def	preguntarVolumenCuboide;	.scl	2;	.type	32;	.endef
	.def	preguntarVolumenCilindroRecto;	.scl	2;	.type	32;	.endef
	.def	preguntarVolumenEsfera;	.scl	2;	.type	32;	.endef
	.def	preguntarVolumenConoCircularRecto;	.scl	2;	.type	32;	.endef
