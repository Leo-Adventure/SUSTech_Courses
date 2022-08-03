
obj/__user_forktree.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <__warn>:
  800020:	715d                	addi	sp,sp,-80
  800022:	832e                	mv	t1,a1
  800024:	e822                	sd	s0,16(sp)
  800026:	85aa                	mv	a1,a0
  800028:	8432                	mv	s0,a2
  80002a:	fc3e                	sd	a5,56(sp)
  80002c:	861a                	mv	a2,t1
  80002e:	103c                	addi	a5,sp,40
  800030:	00000517          	auipc	a0,0x0
  800034:	77850513          	addi	a0,a0,1912 # 8007a8 <main+0x38>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0f8000ef          	jal	ra,80013c <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0ca000ef          	jal	ra,800116 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	7b050513          	addi	a0,a0,1968 # 800800 <main+0x90>
  800058:	0e4000ef          	jal	ra,80013c <cprintf>
  80005c:	60e2                	ld	ra,24(sp)
  80005e:	6442                	ld	s0,16(sp)
  800060:	6161                	addi	sp,sp,80
  800062:	8082                	ret

0000000000800064 <syscall>:
  800064:	7175                	addi	sp,sp,-144
  800066:	f8ba                	sd	a4,112(sp)
  800068:	e0ba                	sd	a4,64(sp)
  80006a:	0118                	addi	a4,sp,128
  80006c:	e42a                	sd	a0,8(sp)
  80006e:	ecae                	sd	a1,88(sp)
  800070:	f0b2                	sd	a2,96(sp)
  800072:	f4b6                	sd	a3,104(sp)
  800074:	fcbe                	sd	a5,120(sp)
  800076:	e142                	sd	a6,128(sp)
  800078:	e546                	sd	a7,136(sp)
  80007a:	f42e                	sd	a1,40(sp)
  80007c:	f832                	sd	a2,48(sp)
  80007e:	fc36                	sd	a3,56(sp)
  800080:	f03a                	sd	a4,32(sp)
  800082:	e4be                	sd	a5,72(sp)
  800084:	4522                	lw	a0,8(sp)
  800086:	55a2                	lw	a1,40(sp)
  800088:	5642                	lw	a2,48(sp)
  80008a:	56e2                	lw	a3,56(sp)
  80008c:	4706                	lw	a4,64(sp)
  80008e:	47a6                	lw	a5,72(sp)
  800090:	00000073          	ecall
  800094:	ce2a                	sw	a0,28(sp)
  800096:	4572                	lw	a0,28(sp)
  800098:	6149                	addi	sp,sp,144
  80009a:	8082                	ret

000000000080009c <sys_exit>:
  80009c:	85aa                	mv	a1,a0
  80009e:	4505                	li	a0,1
  8000a0:	b7d1                	j	800064 <syscall>

00000000008000a2 <sys_fork>:
  8000a2:	4509                	li	a0,2
  8000a4:	b7c1                	j	800064 <syscall>

00000000008000a6 <sys_yield>:
  8000a6:	4529                	li	a0,10
  8000a8:	bf75                	j	800064 <syscall>

00000000008000aa <sys_getpid>:
  8000aa:	4549                	li	a0,18
  8000ac:	bf65                	j	800064 <syscall>

00000000008000ae <sys_putc>:
  8000ae:	85aa                	mv	a1,a0
  8000b0:	4579                	li	a0,30
  8000b2:	bf4d                	j	800064 <syscall>

00000000008000b4 <sys_open>:
  8000b4:	862e                	mv	a2,a1
  8000b6:	85aa                	mv	a1,a0
  8000b8:	06400513          	li	a0,100
  8000bc:	b765                	j	800064 <syscall>

00000000008000be <sys_close>:
  8000be:	85aa                	mv	a1,a0
  8000c0:	06500513          	li	a0,101
  8000c4:	b745                	j	800064 <syscall>

00000000008000c6 <sys_dup>:
  8000c6:	862e                	mv	a2,a1
  8000c8:	85aa                	mv	a1,a0
  8000ca:	08200513          	li	a0,130
  8000ce:	bf59                	j	800064 <syscall>

00000000008000d0 <exit>:
  8000d0:	1141                	addi	sp,sp,-16
  8000d2:	e406                	sd	ra,8(sp)
  8000d4:	fc9ff0ef          	jal	ra,80009c <sys_exit>
  8000d8:	00000517          	auipc	a0,0x0
  8000dc:	6f050513          	addi	a0,a0,1776 # 8007c8 <main+0x58>
  8000e0:	05c000ef          	jal	ra,80013c <cprintf>
  8000e4:	a001                	j	8000e4 <exit+0x14>

00000000008000e6 <fork>:
  8000e6:	bf75                	j	8000a2 <sys_fork>

00000000008000e8 <yield>:
  8000e8:	bf7d                	j	8000a6 <sys_yield>

00000000008000ea <getpid>:
  8000ea:	b7c1                	j	8000aa <sys_getpid>

00000000008000ec <_start>:
  8000ec:	0d0000ef          	jal	ra,8001bc <umain>
  8000f0:	a001                	j	8000f0 <_start+0x4>

00000000008000f2 <open>:
  8000f2:	1582                	slli	a1,a1,0x20
  8000f4:	9181                	srli	a1,a1,0x20
  8000f6:	bf7d                	j	8000b4 <sys_open>

00000000008000f8 <close>:
  8000f8:	b7d9                	j	8000be <sys_close>

00000000008000fa <dup2>:
  8000fa:	b7f1                	j	8000c6 <sys_dup>

00000000008000fc <cputch>:
  8000fc:	1141                	addi	sp,sp,-16
  8000fe:	e022                	sd	s0,0(sp)
  800100:	e406                	sd	ra,8(sp)
  800102:	842e                	mv	s0,a1
  800104:	fabff0ef          	jal	ra,8000ae <sys_putc>
  800108:	401c                	lw	a5,0(s0)
  80010a:	60a2                	ld	ra,8(sp)
  80010c:	2785                	addiw	a5,a5,1
  80010e:	c01c                	sw	a5,0(s0)
  800110:	6402                	ld	s0,0(sp)
  800112:	0141                	addi	sp,sp,16
  800114:	8082                	ret

0000000000800116 <vcprintf>:
  800116:	1101                	addi	sp,sp,-32
  800118:	872e                	mv	a4,a1
  80011a:	75dd                	lui	a1,0xffff7
  80011c:	86aa                	mv	a3,a0
  80011e:	0070                	addi	a2,sp,12
  800120:	00000517          	auipc	a0,0x0
  800124:	fdc50513          	addi	a0,a0,-36 # 8000fc <cputch>
  800128:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f29>
  80012c:	ec06                	sd	ra,24(sp)
  80012e:	c602                	sw	zero,12(sp)
  800130:	1c6000ef          	jal	ra,8002f6 <vprintfmt>
  800134:	60e2                	ld	ra,24(sp)
  800136:	4532                	lw	a0,12(sp)
  800138:	6105                	addi	sp,sp,32
  80013a:	8082                	ret

000000000080013c <cprintf>:
  80013c:	711d                	addi	sp,sp,-96
  80013e:	02810313          	addi	t1,sp,40
  800142:	8e2a                	mv	t3,a0
  800144:	f42e                	sd	a1,40(sp)
  800146:	75dd                	lui	a1,0xffff7
  800148:	f832                	sd	a2,48(sp)
  80014a:	fc36                	sd	a3,56(sp)
  80014c:	e0ba                	sd	a4,64(sp)
  80014e:	00000517          	auipc	a0,0x0
  800152:	fae50513          	addi	a0,a0,-82 # 8000fc <cputch>
  800156:	0050                	addi	a2,sp,4
  800158:	871a                	mv	a4,t1
  80015a:	86f2                	mv	a3,t3
  80015c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f29>
  800160:	ec06                	sd	ra,24(sp)
  800162:	e4be                	sd	a5,72(sp)
  800164:	e8c2                	sd	a6,80(sp)
  800166:	ecc6                	sd	a7,88(sp)
  800168:	e41a                	sd	t1,8(sp)
  80016a:	c202                	sw	zero,4(sp)
  80016c:	18a000ef          	jal	ra,8002f6 <vprintfmt>
  800170:	60e2                	ld	ra,24(sp)
  800172:	4512                	lw	a0,4(sp)
  800174:	6125                	addi	sp,sp,96
  800176:	8082                	ret

0000000000800178 <initfd>:
  800178:	1101                	addi	sp,sp,-32
  80017a:	87ae                	mv	a5,a1
  80017c:	e426                	sd	s1,8(sp)
  80017e:	85b2                	mv	a1,a2
  800180:	84aa                	mv	s1,a0
  800182:	853e                	mv	a0,a5
  800184:	e822                	sd	s0,16(sp)
  800186:	ec06                	sd	ra,24(sp)
  800188:	f6bff0ef          	jal	ra,8000f2 <open>
  80018c:	842a                	mv	s0,a0
  80018e:	00054463          	bltz	a0,800196 <initfd+0x1e>
  800192:	00951863          	bne	a0,s1,8001a2 <initfd+0x2a>
  800196:	60e2                	ld	ra,24(sp)
  800198:	8522                	mv	a0,s0
  80019a:	6442                	ld	s0,16(sp)
  80019c:	64a2                	ld	s1,8(sp)
  80019e:	6105                	addi	sp,sp,32
  8001a0:	8082                	ret
  8001a2:	8526                	mv	a0,s1
  8001a4:	f55ff0ef          	jal	ra,8000f8 <close>
  8001a8:	85a6                	mv	a1,s1
  8001aa:	8522                	mv	a0,s0
  8001ac:	f4fff0ef          	jal	ra,8000fa <dup2>
  8001b0:	84aa                	mv	s1,a0
  8001b2:	8522                	mv	a0,s0
  8001b4:	f45ff0ef          	jal	ra,8000f8 <close>
  8001b8:	8426                	mv	s0,s1
  8001ba:	bff1                	j	800196 <initfd+0x1e>

00000000008001bc <umain>:
  8001bc:	1101                	addi	sp,sp,-32
  8001be:	e822                	sd	s0,16(sp)
  8001c0:	e426                	sd	s1,8(sp)
  8001c2:	842a                	mv	s0,a0
  8001c4:	84ae                	mv	s1,a1
  8001c6:	4601                	li	a2,0
  8001c8:	00000597          	auipc	a1,0x0
  8001cc:	61858593          	addi	a1,a1,1560 # 8007e0 <main+0x70>
  8001d0:	4501                	li	a0,0
  8001d2:	ec06                	sd	ra,24(sp)
  8001d4:	fa5ff0ef          	jal	ra,800178 <initfd>
  8001d8:	02054263          	bltz	a0,8001fc <umain+0x40>
  8001dc:	4605                	li	a2,1
  8001de:	00000597          	auipc	a1,0x0
  8001e2:	64258593          	addi	a1,a1,1602 # 800820 <main+0xb0>
  8001e6:	4505                	li	a0,1
  8001e8:	f91ff0ef          	jal	ra,800178 <initfd>
  8001ec:	02054563          	bltz	a0,800216 <umain+0x5a>
  8001f0:	85a6                	mv	a1,s1
  8001f2:	8522                	mv	a0,s0
  8001f4:	57c000ef          	jal	ra,800770 <main>
  8001f8:	ed9ff0ef          	jal	ra,8000d0 <exit>
  8001fc:	86aa                	mv	a3,a0
  8001fe:	00000617          	auipc	a2,0x0
  800202:	5ea60613          	addi	a2,a2,1514 # 8007e8 <main+0x78>
  800206:	45e9                	li	a1,26
  800208:	00000517          	auipc	a0,0x0
  80020c:	60050513          	addi	a0,a0,1536 # 800808 <main+0x98>
  800210:	e11ff0ef          	jal	ra,800020 <__warn>
  800214:	b7e1                	j	8001dc <umain+0x20>
  800216:	86aa                	mv	a3,a0
  800218:	00000617          	auipc	a2,0x0
  80021c:	61060613          	addi	a2,a2,1552 # 800828 <main+0xb8>
  800220:	45f5                	li	a1,29
  800222:	00000517          	auipc	a0,0x0
  800226:	5e650513          	addi	a0,a0,1510 # 800808 <main+0x98>
  80022a:	df7ff0ef          	jal	ra,800020 <__warn>
  80022e:	b7c9                	j	8001f0 <umain+0x34>

0000000000800230 <strlen>:
  800230:	00054783          	lbu	a5,0(a0)
  800234:	872a                	mv	a4,a0
  800236:	4501                	li	a0,0
  800238:	cb81                	beqz	a5,800248 <strlen+0x18>
  80023a:	0505                	addi	a0,a0,1
  80023c:	00a707b3          	add	a5,a4,a0
  800240:	0007c783          	lbu	a5,0(a5)
  800244:	fbfd                	bnez	a5,80023a <strlen+0xa>
  800246:	8082                	ret
  800248:	8082                	ret

000000000080024a <strnlen>:
  80024a:	872a                	mv	a4,a0
  80024c:	4501                	li	a0,0
  80024e:	e589                	bnez	a1,800258 <strnlen+0xe>
  800250:	a811                	j	800264 <strnlen+0x1a>
  800252:	0505                	addi	a0,a0,1
  800254:	00a58763          	beq	a1,a0,800262 <strnlen+0x18>
  800258:	00a707b3          	add	a5,a4,a0
  80025c:	0007c783          	lbu	a5,0(a5)
  800260:	fbed                	bnez	a5,800252 <strnlen+0x8>
  800262:	8082                	ret
  800264:	8082                	ret

0000000000800266 <printnum>:
  800266:	02071893          	slli	a7,a4,0x20
  80026a:	7139                	addi	sp,sp,-64
  80026c:	0208d893          	srli	a7,a7,0x20
  800270:	e456                	sd	s5,8(sp)
  800272:	0316fab3          	remu	s5,a3,a7
  800276:	f822                	sd	s0,48(sp)
  800278:	f426                	sd	s1,40(sp)
  80027a:	f04a                	sd	s2,32(sp)
  80027c:	ec4e                	sd	s3,24(sp)
  80027e:	fc06                	sd	ra,56(sp)
  800280:	e852                	sd	s4,16(sp)
  800282:	84aa                	mv	s1,a0
  800284:	89ae                	mv	s3,a1
  800286:	8932                	mv	s2,a2
  800288:	fff7841b          	addiw	s0,a5,-1
  80028c:	2a81                	sext.w	s5,s5
  80028e:	0516f163          	bgeu	a3,a7,8002d0 <printnum+0x6a>
  800292:	8a42                	mv	s4,a6
  800294:	00805863          	blez	s0,8002a4 <printnum+0x3e>
  800298:	347d                	addiw	s0,s0,-1
  80029a:	864e                	mv	a2,s3
  80029c:	85ca                	mv	a1,s2
  80029e:	8552                	mv	a0,s4
  8002a0:	9482                	jalr	s1
  8002a2:	f87d                	bnez	s0,800298 <printnum+0x32>
  8002a4:	1a82                	slli	s5,s5,0x20
  8002a6:	020ada93          	srli	s5,s5,0x20
  8002aa:	00000797          	auipc	a5,0x0
  8002ae:	59e78793          	addi	a5,a5,1438 # 800848 <main+0xd8>
  8002b2:	7442                	ld	s0,48(sp)
  8002b4:	9abe                	add	s5,s5,a5
  8002b6:	000ac503          	lbu	a0,0(s5)
  8002ba:	70e2                	ld	ra,56(sp)
  8002bc:	6a42                	ld	s4,16(sp)
  8002be:	6aa2                	ld	s5,8(sp)
  8002c0:	864e                	mv	a2,s3
  8002c2:	85ca                	mv	a1,s2
  8002c4:	69e2                	ld	s3,24(sp)
  8002c6:	7902                	ld	s2,32(sp)
  8002c8:	8326                	mv	t1,s1
  8002ca:	74a2                	ld	s1,40(sp)
  8002cc:	6121                	addi	sp,sp,64
  8002ce:	8302                	jr	t1
  8002d0:	0316d6b3          	divu	a3,a3,a7
  8002d4:	87a2                	mv	a5,s0
  8002d6:	f91ff0ef          	jal	ra,800266 <printnum>
  8002da:	b7e9                	j	8002a4 <printnum+0x3e>

00000000008002dc <sprintputch>:
  8002dc:	499c                	lw	a5,16(a1)
  8002de:	6198                	ld	a4,0(a1)
  8002e0:	6594                	ld	a3,8(a1)
  8002e2:	2785                	addiw	a5,a5,1
  8002e4:	c99c                	sw	a5,16(a1)
  8002e6:	00d77763          	bgeu	a4,a3,8002f4 <sprintputch+0x18>
  8002ea:	00170793          	addi	a5,a4,1
  8002ee:	e19c                	sd	a5,0(a1)
  8002f0:	00a70023          	sb	a0,0(a4)
  8002f4:	8082                	ret

00000000008002f6 <vprintfmt>:
  8002f6:	7119                	addi	sp,sp,-128
  8002f8:	f4a6                	sd	s1,104(sp)
  8002fa:	f0ca                	sd	s2,96(sp)
  8002fc:	ecce                	sd	s3,88(sp)
  8002fe:	e8d2                	sd	s4,80(sp)
  800300:	e4d6                	sd	s5,72(sp)
  800302:	e0da                	sd	s6,64(sp)
  800304:	fc5e                	sd	s7,56(sp)
  800306:	ec6e                	sd	s11,24(sp)
  800308:	fc86                	sd	ra,120(sp)
  80030a:	f8a2                	sd	s0,112(sp)
  80030c:	f862                	sd	s8,48(sp)
  80030e:	f466                	sd	s9,40(sp)
  800310:	f06a                	sd	s10,32(sp)
  800312:	89aa                	mv	s3,a0
  800314:	892e                	mv	s2,a1
  800316:	84b2                	mv	s1,a2
  800318:	8db6                	mv	s11,a3
  80031a:	8aba                	mv	s5,a4
  80031c:	02500a13          	li	s4,37
  800320:	5bfd                	li	s7,-1
  800322:	00000b17          	auipc	s6,0x0
  800326:	55ab0b13          	addi	s6,s6,1370 # 80087c <main+0x10c>
  80032a:	000dc503          	lbu	a0,0(s11)
  80032e:	001d8413          	addi	s0,s11,1
  800332:	01450b63          	beq	a0,s4,800348 <vprintfmt+0x52>
  800336:	c129                	beqz	a0,800378 <vprintfmt+0x82>
  800338:	864a                	mv	a2,s2
  80033a:	85a6                	mv	a1,s1
  80033c:	0405                	addi	s0,s0,1
  80033e:	9982                	jalr	s3
  800340:	fff44503          	lbu	a0,-1(s0)
  800344:	ff4519e3          	bne	a0,s4,800336 <vprintfmt+0x40>
  800348:	00044583          	lbu	a1,0(s0)
  80034c:	02000813          	li	a6,32
  800350:	4d01                	li	s10,0
  800352:	4301                	li	t1,0
  800354:	5cfd                	li	s9,-1
  800356:	5c7d                	li	s8,-1
  800358:	05500513          	li	a0,85
  80035c:	48a5                	li	a7,9
  80035e:	fdd5861b          	addiw	a2,a1,-35
  800362:	0ff67613          	andi	a2,a2,255
  800366:	00140d93          	addi	s11,s0,1
  80036a:	04c56263          	bltu	a0,a2,8003ae <vprintfmt+0xb8>
  80036e:	060a                	slli	a2,a2,0x2
  800370:	965a                	add	a2,a2,s6
  800372:	4214                	lw	a3,0(a2)
  800374:	96da                	add	a3,a3,s6
  800376:	8682                	jr	a3
  800378:	70e6                	ld	ra,120(sp)
  80037a:	7446                	ld	s0,112(sp)
  80037c:	74a6                	ld	s1,104(sp)
  80037e:	7906                	ld	s2,96(sp)
  800380:	69e6                	ld	s3,88(sp)
  800382:	6a46                	ld	s4,80(sp)
  800384:	6aa6                	ld	s5,72(sp)
  800386:	6b06                	ld	s6,64(sp)
  800388:	7be2                	ld	s7,56(sp)
  80038a:	7c42                	ld	s8,48(sp)
  80038c:	7ca2                	ld	s9,40(sp)
  80038e:	7d02                	ld	s10,32(sp)
  800390:	6de2                	ld	s11,24(sp)
  800392:	6109                	addi	sp,sp,128
  800394:	8082                	ret
  800396:	882e                	mv	a6,a1
  800398:	00144583          	lbu	a1,1(s0)
  80039c:	846e                	mv	s0,s11
  80039e:	00140d93          	addi	s11,s0,1
  8003a2:	fdd5861b          	addiw	a2,a1,-35
  8003a6:	0ff67613          	andi	a2,a2,255
  8003aa:	fcc572e3          	bgeu	a0,a2,80036e <vprintfmt+0x78>
  8003ae:	864a                	mv	a2,s2
  8003b0:	85a6                	mv	a1,s1
  8003b2:	02500513          	li	a0,37
  8003b6:	9982                	jalr	s3
  8003b8:	fff44783          	lbu	a5,-1(s0)
  8003bc:	8da2                	mv	s11,s0
  8003be:	f74786e3          	beq	a5,s4,80032a <vprintfmt+0x34>
  8003c2:	ffedc783          	lbu	a5,-2(s11)
  8003c6:	1dfd                	addi	s11,s11,-1
  8003c8:	ff479de3          	bne	a5,s4,8003c2 <vprintfmt+0xcc>
  8003cc:	bfb9                	j	80032a <vprintfmt+0x34>
  8003ce:	fd058c9b          	addiw	s9,a1,-48
  8003d2:	00144583          	lbu	a1,1(s0)
  8003d6:	846e                	mv	s0,s11
  8003d8:	fd05869b          	addiw	a3,a1,-48
  8003dc:	0005861b          	sext.w	a2,a1
  8003e0:	02d8e463          	bltu	a7,a3,800408 <vprintfmt+0x112>
  8003e4:	00144583          	lbu	a1,1(s0)
  8003e8:	002c969b          	slliw	a3,s9,0x2
  8003ec:	0196873b          	addw	a4,a3,s9
  8003f0:	0017171b          	slliw	a4,a4,0x1
  8003f4:	9f31                	addw	a4,a4,a2
  8003f6:	fd05869b          	addiw	a3,a1,-48
  8003fa:	0405                	addi	s0,s0,1
  8003fc:	fd070c9b          	addiw	s9,a4,-48
  800400:	0005861b          	sext.w	a2,a1
  800404:	fed8f0e3          	bgeu	a7,a3,8003e4 <vprintfmt+0xee>
  800408:	f40c5be3          	bgez	s8,80035e <vprintfmt+0x68>
  80040c:	8c66                	mv	s8,s9
  80040e:	5cfd                	li	s9,-1
  800410:	b7b9                	j	80035e <vprintfmt+0x68>
  800412:	fffc4693          	not	a3,s8
  800416:	96fd                	srai	a3,a3,0x3f
  800418:	00dc77b3          	and	a5,s8,a3
  80041c:	00144583          	lbu	a1,1(s0)
  800420:	00078c1b          	sext.w	s8,a5
  800424:	846e                	mv	s0,s11
  800426:	bf25                	j	80035e <vprintfmt+0x68>
  800428:	000aac83          	lw	s9,0(s5)
  80042c:	00144583          	lbu	a1,1(s0)
  800430:	0aa1                	addi	s5,s5,8
  800432:	846e                	mv	s0,s11
  800434:	bfd1                	j	800408 <vprintfmt+0x112>
  800436:	4705                	li	a4,1
  800438:	008a8613          	addi	a2,s5,8
  80043c:	00674463          	blt	a4,t1,800444 <vprintfmt+0x14e>
  800440:	1c030c63          	beqz	t1,800618 <vprintfmt+0x322>
  800444:	000ab683          	ld	a3,0(s5)
  800448:	4741                	li	a4,16
  80044a:	8ab2                	mv	s5,a2
  80044c:	2801                	sext.w	a6,a6
  80044e:	87e2                	mv	a5,s8
  800450:	8626                	mv	a2,s1
  800452:	85ca                	mv	a1,s2
  800454:	854e                	mv	a0,s3
  800456:	e11ff0ef          	jal	ra,800266 <printnum>
  80045a:	bdc1                	j	80032a <vprintfmt+0x34>
  80045c:	000aa503          	lw	a0,0(s5)
  800460:	864a                	mv	a2,s2
  800462:	85a6                	mv	a1,s1
  800464:	0aa1                	addi	s5,s5,8
  800466:	9982                	jalr	s3
  800468:	b5c9                	j	80032a <vprintfmt+0x34>
  80046a:	4705                	li	a4,1
  80046c:	008a8613          	addi	a2,s5,8
  800470:	00674463          	blt	a4,t1,800478 <vprintfmt+0x182>
  800474:	18030d63          	beqz	t1,80060e <vprintfmt+0x318>
  800478:	000ab683          	ld	a3,0(s5)
  80047c:	4729                	li	a4,10
  80047e:	8ab2                	mv	s5,a2
  800480:	b7f1                	j	80044c <vprintfmt+0x156>
  800482:	00144583          	lbu	a1,1(s0)
  800486:	4d05                	li	s10,1
  800488:	846e                	mv	s0,s11
  80048a:	bdd1                	j	80035e <vprintfmt+0x68>
  80048c:	864a                	mv	a2,s2
  80048e:	85a6                	mv	a1,s1
  800490:	02500513          	li	a0,37
  800494:	9982                	jalr	s3
  800496:	bd51                	j	80032a <vprintfmt+0x34>
  800498:	00144583          	lbu	a1,1(s0)
  80049c:	2305                	addiw	t1,t1,1
  80049e:	846e                	mv	s0,s11
  8004a0:	bd7d                	j	80035e <vprintfmt+0x68>
  8004a2:	4705                	li	a4,1
  8004a4:	008a8613          	addi	a2,s5,8
  8004a8:	00674463          	blt	a4,t1,8004b0 <vprintfmt+0x1ba>
  8004ac:	14030c63          	beqz	t1,800604 <vprintfmt+0x30e>
  8004b0:	000ab683          	ld	a3,0(s5)
  8004b4:	4721                	li	a4,8
  8004b6:	8ab2                	mv	s5,a2
  8004b8:	bf51                	j	80044c <vprintfmt+0x156>
  8004ba:	03000513          	li	a0,48
  8004be:	864a                	mv	a2,s2
  8004c0:	85a6                	mv	a1,s1
  8004c2:	e042                	sd	a6,0(sp)
  8004c4:	9982                	jalr	s3
  8004c6:	864a                	mv	a2,s2
  8004c8:	85a6                	mv	a1,s1
  8004ca:	07800513          	li	a0,120
  8004ce:	9982                	jalr	s3
  8004d0:	0aa1                	addi	s5,s5,8
  8004d2:	6802                	ld	a6,0(sp)
  8004d4:	4741                	li	a4,16
  8004d6:	ff8ab683          	ld	a3,-8(s5)
  8004da:	bf8d                	j	80044c <vprintfmt+0x156>
  8004dc:	000ab403          	ld	s0,0(s5)
  8004e0:	008a8793          	addi	a5,s5,8
  8004e4:	e03e                	sd	a5,0(sp)
  8004e6:	14040c63          	beqz	s0,80063e <vprintfmt+0x348>
  8004ea:	11805063          	blez	s8,8005ea <vprintfmt+0x2f4>
  8004ee:	02d00693          	li	a3,45
  8004f2:	0cd81963          	bne	a6,a3,8005c4 <vprintfmt+0x2ce>
  8004f6:	00044683          	lbu	a3,0(s0)
  8004fa:	0006851b          	sext.w	a0,a3
  8004fe:	ce8d                	beqz	a3,800538 <vprintfmt+0x242>
  800500:	00140a93          	addi	s5,s0,1
  800504:	05e00413          	li	s0,94
  800508:	000cc563          	bltz	s9,800512 <vprintfmt+0x21c>
  80050c:	3cfd                	addiw	s9,s9,-1
  80050e:	037c8363          	beq	s9,s7,800534 <vprintfmt+0x23e>
  800512:	864a                	mv	a2,s2
  800514:	85a6                	mv	a1,s1
  800516:	100d0663          	beqz	s10,800622 <vprintfmt+0x32c>
  80051a:	3681                	addiw	a3,a3,-32
  80051c:	10d47363          	bgeu	s0,a3,800622 <vprintfmt+0x32c>
  800520:	03f00513          	li	a0,63
  800524:	9982                	jalr	s3
  800526:	000ac683          	lbu	a3,0(s5)
  80052a:	3c7d                	addiw	s8,s8,-1
  80052c:	0a85                	addi	s5,s5,1
  80052e:	0006851b          	sext.w	a0,a3
  800532:	faf9                	bnez	a3,800508 <vprintfmt+0x212>
  800534:	01805a63          	blez	s8,800548 <vprintfmt+0x252>
  800538:	3c7d                	addiw	s8,s8,-1
  80053a:	864a                	mv	a2,s2
  80053c:	85a6                	mv	a1,s1
  80053e:	02000513          	li	a0,32
  800542:	9982                	jalr	s3
  800544:	fe0c1ae3          	bnez	s8,800538 <vprintfmt+0x242>
  800548:	6a82                	ld	s5,0(sp)
  80054a:	b3c5                	j	80032a <vprintfmt+0x34>
  80054c:	4705                	li	a4,1
  80054e:	008a8d13          	addi	s10,s5,8
  800552:	00674463          	blt	a4,t1,80055a <vprintfmt+0x264>
  800556:	0a030463          	beqz	t1,8005fe <vprintfmt+0x308>
  80055a:	000ab403          	ld	s0,0(s5)
  80055e:	0c044463          	bltz	s0,800626 <vprintfmt+0x330>
  800562:	86a2                	mv	a3,s0
  800564:	8aea                	mv	s5,s10
  800566:	4729                	li	a4,10
  800568:	b5d5                	j	80044c <vprintfmt+0x156>
  80056a:	000aa783          	lw	a5,0(s5)
  80056e:	46e1                	li	a3,24
  800570:	0aa1                	addi	s5,s5,8
  800572:	41f7d71b          	sraiw	a4,a5,0x1f
  800576:	8fb9                	xor	a5,a5,a4
  800578:	40e7873b          	subw	a4,a5,a4
  80057c:	02e6c663          	blt	a3,a4,8005a8 <vprintfmt+0x2b2>
  800580:	00371793          	slli	a5,a4,0x3
  800584:	00000697          	auipc	a3,0x0
  800588:	62c68693          	addi	a3,a3,1580 # 800bb0 <error_string>
  80058c:	97b6                	add	a5,a5,a3
  80058e:	639c                	ld	a5,0(a5)
  800590:	cf81                	beqz	a5,8005a8 <vprintfmt+0x2b2>
  800592:	873e                	mv	a4,a5
  800594:	00000697          	auipc	a3,0x0
  800598:	2e468693          	addi	a3,a3,740 # 800878 <main+0x108>
  80059c:	8626                	mv	a2,s1
  80059e:	85ca                	mv	a1,s2
  8005a0:	854e                	mv	a0,s3
  8005a2:	0d4000ef          	jal	ra,800676 <printfmt>
  8005a6:	b351                	j	80032a <vprintfmt+0x34>
  8005a8:	00000697          	auipc	a3,0x0
  8005ac:	2c068693          	addi	a3,a3,704 # 800868 <main+0xf8>
  8005b0:	8626                	mv	a2,s1
  8005b2:	85ca                	mv	a1,s2
  8005b4:	854e                	mv	a0,s3
  8005b6:	0c0000ef          	jal	ra,800676 <printfmt>
  8005ba:	bb85                	j	80032a <vprintfmt+0x34>
  8005bc:	00000417          	auipc	s0,0x0
  8005c0:	2a440413          	addi	s0,s0,676 # 800860 <main+0xf0>
  8005c4:	85e6                	mv	a1,s9
  8005c6:	8522                	mv	a0,s0
  8005c8:	e442                	sd	a6,8(sp)
  8005ca:	c81ff0ef          	jal	ra,80024a <strnlen>
  8005ce:	40ac0c3b          	subw	s8,s8,a0
  8005d2:	01805c63          	blez	s8,8005ea <vprintfmt+0x2f4>
  8005d6:	6822                	ld	a6,8(sp)
  8005d8:	00080a9b          	sext.w	s5,a6
  8005dc:	3c7d                	addiw	s8,s8,-1
  8005de:	864a                	mv	a2,s2
  8005e0:	85a6                	mv	a1,s1
  8005e2:	8556                	mv	a0,s5
  8005e4:	9982                	jalr	s3
  8005e6:	fe0c1be3          	bnez	s8,8005dc <vprintfmt+0x2e6>
  8005ea:	00044683          	lbu	a3,0(s0)
  8005ee:	00140a93          	addi	s5,s0,1
  8005f2:	0006851b          	sext.w	a0,a3
  8005f6:	daa9                	beqz	a3,800548 <vprintfmt+0x252>
  8005f8:	05e00413          	li	s0,94
  8005fc:	b731                	j	800508 <vprintfmt+0x212>
  8005fe:	000aa403          	lw	s0,0(s5)
  800602:	bfb1                	j	80055e <vprintfmt+0x268>
  800604:	000ae683          	lwu	a3,0(s5)
  800608:	4721                	li	a4,8
  80060a:	8ab2                	mv	s5,a2
  80060c:	b581                	j	80044c <vprintfmt+0x156>
  80060e:	000ae683          	lwu	a3,0(s5)
  800612:	4729                	li	a4,10
  800614:	8ab2                	mv	s5,a2
  800616:	bd1d                	j	80044c <vprintfmt+0x156>
  800618:	000ae683          	lwu	a3,0(s5)
  80061c:	4741                	li	a4,16
  80061e:	8ab2                	mv	s5,a2
  800620:	b535                	j	80044c <vprintfmt+0x156>
  800622:	9982                	jalr	s3
  800624:	b709                	j	800526 <vprintfmt+0x230>
  800626:	864a                	mv	a2,s2
  800628:	85a6                	mv	a1,s1
  80062a:	02d00513          	li	a0,45
  80062e:	e042                	sd	a6,0(sp)
  800630:	9982                	jalr	s3
  800632:	6802                	ld	a6,0(sp)
  800634:	8aea                	mv	s5,s10
  800636:	408006b3          	neg	a3,s0
  80063a:	4729                	li	a4,10
  80063c:	bd01                	j	80044c <vprintfmt+0x156>
  80063e:	03805163          	blez	s8,800660 <vprintfmt+0x36a>
  800642:	02d00693          	li	a3,45
  800646:	f6d81be3          	bne	a6,a3,8005bc <vprintfmt+0x2c6>
  80064a:	00000417          	auipc	s0,0x0
  80064e:	21640413          	addi	s0,s0,534 # 800860 <main+0xf0>
  800652:	02800693          	li	a3,40
  800656:	02800513          	li	a0,40
  80065a:	00140a93          	addi	s5,s0,1
  80065e:	b55d                	j	800504 <vprintfmt+0x20e>
  800660:	00000a97          	auipc	s5,0x0
  800664:	201a8a93          	addi	s5,s5,513 # 800861 <main+0xf1>
  800668:	02800513          	li	a0,40
  80066c:	02800693          	li	a3,40
  800670:	05e00413          	li	s0,94
  800674:	bd51                	j	800508 <vprintfmt+0x212>

0000000000800676 <printfmt>:
  800676:	7139                	addi	sp,sp,-64
  800678:	02010313          	addi	t1,sp,32
  80067c:	f03a                	sd	a4,32(sp)
  80067e:	871a                	mv	a4,t1
  800680:	ec06                	sd	ra,24(sp)
  800682:	f43e                	sd	a5,40(sp)
  800684:	f842                	sd	a6,48(sp)
  800686:	fc46                	sd	a7,56(sp)
  800688:	e41a                	sd	t1,8(sp)
  80068a:	c6dff0ef          	jal	ra,8002f6 <vprintfmt>
  80068e:	60e2                	ld	ra,24(sp)
  800690:	6121                	addi	sp,sp,64
  800692:	8082                	ret

0000000000800694 <vsnprintf>:
  800694:	15fd                	addi	a1,a1,-1
  800696:	7179                	addi	sp,sp,-48
  800698:	95aa                	add	a1,a1,a0
  80069a:	f406                	sd	ra,40(sp)
  80069c:	e42a                	sd	a0,8(sp)
  80069e:	e82e                	sd	a1,16(sp)
  8006a0:	cc02                	sw	zero,24(sp)
  8006a2:	c515                	beqz	a0,8006ce <vsnprintf+0x3a>
  8006a4:	02a5e563          	bltu	a1,a0,8006ce <vsnprintf+0x3a>
  8006a8:	75dd                	lui	a1,0xffff7
  8006aa:	8736                	mv	a4,a3
  8006ac:	00000517          	auipc	a0,0x0
  8006b0:	c3050513          	addi	a0,a0,-976 # 8002dc <sprintputch>
  8006b4:	86b2                	mv	a3,a2
  8006b6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f29>
  8006ba:	0030                	addi	a2,sp,8
  8006bc:	c3bff0ef          	jal	ra,8002f6 <vprintfmt>
  8006c0:	67a2                	ld	a5,8(sp)
  8006c2:	00078023          	sb	zero,0(a5)
  8006c6:	4562                	lw	a0,24(sp)
  8006c8:	70a2                	ld	ra,40(sp)
  8006ca:	6145                	addi	sp,sp,48
  8006cc:	8082                	ret
  8006ce:	5575                	li	a0,-3
  8006d0:	bfe5                	j	8006c8 <vsnprintf+0x34>

00000000008006d2 <snprintf>:
  8006d2:	715d                	addi	sp,sp,-80
  8006d4:	02810313          	addi	t1,sp,40
  8006d8:	f436                	sd	a3,40(sp)
  8006da:	869a                	mv	a3,t1
  8006dc:	ec06                	sd	ra,24(sp)
  8006de:	f83a                	sd	a4,48(sp)
  8006e0:	fc3e                	sd	a5,56(sp)
  8006e2:	e0c2                	sd	a6,64(sp)
  8006e4:	e4c6                	sd	a7,72(sp)
  8006e6:	e41a                	sd	t1,8(sp)
  8006e8:	fadff0ef          	jal	ra,800694 <vsnprintf>
  8006ec:	60e2                	ld	ra,24(sp)
  8006ee:	6161                	addi	sp,sp,80
  8006f0:	8082                	ret

00000000008006f2 <forktree>:
  8006f2:	1141                	addi	sp,sp,-16
  8006f4:	e406                	sd	ra,8(sp)
  8006f6:	e022                	sd	s0,0(sp)
  8006f8:	842a                	mv	s0,a0
  8006fa:	9f1ff0ef          	jal	ra,8000ea <getpid>
  8006fe:	85aa                	mv	a1,a0
  800700:	8622                	mv	a2,s0
  800702:	00000517          	auipc	a0,0x0
  800706:	57650513          	addi	a0,a0,1398 # 800c78 <error_string+0xc8>
  80070a:	a33ff0ef          	jal	ra,80013c <cprintf>
  80070e:	8522                	mv	a0,s0
  800710:	03000593          	li	a1,48
  800714:	012000ef          	jal	ra,800726 <forkchild>
  800718:	8522                	mv	a0,s0
  80071a:	6402                	ld	s0,0(sp)
  80071c:	60a2                	ld	ra,8(sp)
  80071e:	03100593          	li	a1,49
  800722:	0141                	addi	sp,sp,16
  800724:	a009                	j	800726 <forkchild>

0000000000800726 <forkchild>:
  800726:	7179                	addi	sp,sp,-48
  800728:	f022                	sd	s0,32(sp)
  80072a:	ec26                	sd	s1,24(sp)
  80072c:	f406                	sd	ra,40(sp)
  80072e:	842a                	mv	s0,a0
  800730:	84ae                	mv	s1,a1
  800732:	affff0ef          	jal	ra,800230 <strlen>
  800736:	478d                	li	a5,3
  800738:	00a7f763          	bgeu	a5,a0,800746 <forkchild+0x20>
  80073c:	70a2                	ld	ra,40(sp)
  80073e:	7402                	ld	s0,32(sp)
  800740:	64e2                	ld	s1,24(sp)
  800742:	6145                	addi	sp,sp,48
  800744:	8082                	ret
  800746:	8726                	mv	a4,s1
  800748:	86a2                	mv	a3,s0
  80074a:	00000617          	auipc	a2,0x0
  80074e:	54660613          	addi	a2,a2,1350 # 800c90 <error_string+0xe0>
  800752:	4595                	li	a1,5
  800754:	0028                	addi	a0,sp,8
  800756:	f7dff0ef          	jal	ra,8006d2 <snprintf>
  80075a:	98dff0ef          	jal	ra,8000e6 <fork>
  80075e:	fd79                	bnez	a0,80073c <forkchild+0x16>
  800760:	0028                	addi	a0,sp,8
  800762:	f91ff0ef          	jal	ra,8006f2 <forktree>
  800766:	983ff0ef          	jal	ra,8000e8 <yield>
  80076a:	4501                	li	a0,0
  80076c:	965ff0ef          	jal	ra,8000d0 <exit>

0000000000800770 <main>:
  800770:	1141                	addi	sp,sp,-16
  800772:	00000517          	auipc	a0,0x0
  800776:	51650513          	addi	a0,a0,1302 # 800c88 <error_string+0xd8>
  80077a:	e406                	sd	ra,8(sp)
  80077c:	f77ff0ef          	jal	ra,8006f2 <forktree>
  800780:	60a2                	ld	ra,8(sp)
  800782:	4501                	li	a0,0
  800784:	0141                	addi	sp,sp,16
  800786:	8082                	ret
