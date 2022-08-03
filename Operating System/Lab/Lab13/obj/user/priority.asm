
obj/__user_priority.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <__panic>:
  800020:	715d                	addi	sp,sp,-80
  800022:	8e2e                	mv	t3,a1
  800024:	e822                	sd	s0,16(sp)
  800026:	85aa                	mv	a1,a0
  800028:	8432                	mv	s0,a2
  80002a:	fc3e                	sd	a5,56(sp)
  80002c:	8672                	mv	a2,t3
  80002e:	103c                	addi	a5,sp,40
  800030:	00001517          	auipc	a0,0x1
  800034:	86050513          	addi	a0,a0,-1952 # 800890 <main+0x1bc>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	15a000ef          	jal	ra,80019e <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	12c000ef          	jal	ra,800178 <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	8b850513          	addi	a0,a0,-1864 # 800908 <main+0x234>
  800058:	146000ef          	jal	ra,80019e <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0ca000ef          	jal	ra,800128 <exit>

0000000000800062 <__warn>:
  800062:	715d                	addi	sp,sp,-80
  800064:	832e                	mv	t1,a1
  800066:	e822                	sd	s0,16(sp)
  800068:	85aa                	mv	a1,a0
  80006a:	8432                	mv	s0,a2
  80006c:	fc3e                	sd	a5,56(sp)
  80006e:	861a                	mv	a2,t1
  800070:	103c                	addi	a5,sp,40
  800072:	00001517          	auipc	a0,0x1
  800076:	83e50513          	addi	a0,a0,-1986 # 8008b0 <main+0x1dc>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	118000ef          	jal	ra,80019e <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0ea000ef          	jal	ra,800178 <vcprintf>
  800092:	00001517          	auipc	a0,0x1
  800096:	87650513          	addi	a0,a0,-1930 # 800908 <main+0x234>
  80009a:	104000ef          	jal	ra,80019e <cprintf>
  80009e:	60e2                	ld	ra,24(sp)
  8000a0:	6442                	ld	s0,16(sp)
  8000a2:	6161                	addi	sp,sp,80
  8000a4:	8082                	ret

00000000008000a6 <syscall>:
  8000a6:	7175                	addi	sp,sp,-144
  8000a8:	f8ba                	sd	a4,112(sp)
  8000aa:	e0ba                	sd	a4,64(sp)
  8000ac:	0118                	addi	a4,sp,128
  8000ae:	e42a                	sd	a0,8(sp)
  8000b0:	ecae                	sd	a1,88(sp)
  8000b2:	f0b2                	sd	a2,96(sp)
  8000b4:	f4b6                	sd	a3,104(sp)
  8000b6:	fcbe                	sd	a5,120(sp)
  8000b8:	e142                	sd	a6,128(sp)
  8000ba:	e546                	sd	a7,136(sp)
  8000bc:	f42e                	sd	a1,40(sp)
  8000be:	f832                	sd	a2,48(sp)
  8000c0:	fc36                	sd	a3,56(sp)
  8000c2:	f03a                	sd	a4,32(sp)
  8000c4:	e4be                	sd	a5,72(sp)
  8000c6:	4522                	lw	a0,8(sp)
  8000c8:	55a2                	lw	a1,40(sp)
  8000ca:	5642                	lw	a2,48(sp)
  8000cc:	56e2                	lw	a3,56(sp)
  8000ce:	4706                	lw	a4,64(sp)
  8000d0:	47a6                	lw	a5,72(sp)
  8000d2:	00000073          	ecall
  8000d6:	ce2a                	sw	a0,28(sp)
  8000d8:	4572                	lw	a0,28(sp)
  8000da:	6149                	addi	sp,sp,144
  8000dc:	8082                	ret

00000000008000de <sys_exit>:
  8000de:	85aa                	mv	a1,a0
  8000e0:	4505                	li	a0,1
  8000e2:	b7d1                	j	8000a6 <syscall>

00000000008000e4 <sys_fork>:
  8000e4:	4509                	li	a0,2
  8000e6:	b7c1                	j	8000a6 <syscall>

00000000008000e8 <sys_wait>:
  8000e8:	862e                	mv	a2,a1
  8000ea:	85aa                	mv	a1,a0
  8000ec:	450d                	li	a0,3
  8000ee:	bf65                	j	8000a6 <syscall>

00000000008000f0 <sys_kill>:
  8000f0:	85aa                	mv	a1,a0
  8000f2:	4531                	li	a0,12
  8000f4:	bf4d                	j	8000a6 <syscall>

00000000008000f6 <sys_getpid>:
  8000f6:	4549                	li	a0,18
  8000f8:	b77d                	j	8000a6 <syscall>

00000000008000fa <sys_putc>:
  8000fa:	85aa                	mv	a1,a0
  8000fc:	4579                	li	a0,30
  8000fe:	b765                	j	8000a6 <syscall>

0000000000800100 <sys_lab6_set_priority>:
  800100:	85aa                	mv	a1,a0
  800102:	0ff00513          	li	a0,255
  800106:	b745                	j	8000a6 <syscall>

0000000000800108 <sys_gettime>:
  800108:	4545                	li	a0,17
  80010a:	bf71                	j	8000a6 <syscall>

000000000080010c <sys_open>:
  80010c:	862e                	mv	a2,a1
  80010e:	85aa                	mv	a1,a0
  800110:	06400513          	li	a0,100
  800114:	bf49                	j	8000a6 <syscall>

0000000000800116 <sys_close>:
  800116:	85aa                	mv	a1,a0
  800118:	06500513          	li	a0,101
  80011c:	b769                	j	8000a6 <syscall>

000000000080011e <sys_dup>:
  80011e:	862e                	mv	a2,a1
  800120:	85aa                	mv	a1,a0
  800122:	08200513          	li	a0,130
  800126:	b741                	j	8000a6 <syscall>

0000000000800128 <exit>:
  800128:	1141                	addi	sp,sp,-16
  80012a:	e406                	sd	ra,8(sp)
  80012c:	fb3ff0ef          	jal	ra,8000de <sys_exit>
  800130:	00000517          	auipc	a0,0x0
  800134:	7a050513          	addi	a0,a0,1952 # 8008d0 <main+0x1fc>
  800138:	066000ef          	jal	ra,80019e <cprintf>
  80013c:	a001                	j	80013c <exit+0x14>

000000000080013e <fork>:
  80013e:	b75d                	j	8000e4 <sys_fork>

0000000000800140 <waitpid>:
  800140:	b765                	j	8000e8 <sys_wait>

0000000000800142 <kill>:
  800142:	b77d                	j	8000f0 <sys_kill>

0000000000800144 <getpid>:
  800144:	bf4d                	j	8000f6 <sys_getpid>

0000000000800146 <gettime_msec>:
  800146:	b7c9                	j	800108 <sys_gettime>

0000000000800148 <lab6_set_priority>:
  800148:	1502                	slli	a0,a0,0x20
  80014a:	9101                	srli	a0,a0,0x20
  80014c:	bf55                	j	800100 <sys_lab6_set_priority>

000000000080014e <_start>:
  80014e:	0d0000ef          	jal	ra,80021e <umain>
  800152:	a001                	j	800152 <_start+0x4>

0000000000800154 <open>:
  800154:	1582                	slli	a1,a1,0x20
  800156:	9181                	srli	a1,a1,0x20
  800158:	bf55                	j	80010c <sys_open>

000000000080015a <close>:
  80015a:	bf75                	j	800116 <sys_close>

000000000080015c <dup2>:
  80015c:	b7c9                	j	80011e <sys_dup>

000000000080015e <cputch>:
  80015e:	1141                	addi	sp,sp,-16
  800160:	e022                	sd	s0,0(sp)
  800162:	e406                	sd	ra,8(sp)
  800164:	842e                	mv	s0,a1
  800166:	f95ff0ef          	jal	ra,8000fa <sys_putc>
  80016a:	401c                	lw	a5,0(s0)
  80016c:	60a2                	ld	ra,8(sp)
  80016e:	2785                	addiw	a5,a5,1
  800170:	c01c                	sw	a5,0(s0)
  800172:	6402                	ld	s0,0(sp)
  800174:	0141                	addi	sp,sp,16
  800176:	8082                	ret

0000000000800178 <vcprintf>:
  800178:	1101                	addi	sp,sp,-32
  80017a:	872e                	mv	a4,a1
  80017c:	75dd                	lui	a1,0xffff7
  80017e:	86aa                	mv	a3,a0
  800180:	0070                	addi	a2,sp,12
  800182:	00000517          	auipc	a0,0x0
  800186:	fdc50513          	addi	a0,a0,-36 # 80015e <cputch>
  80018a:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <pids+0xffffffffff7f5aa9>
  80018e:	ec06                	sd	ra,24(sp)
  800190:	c602                	sw	zero,12(sp)
  800192:	1a4000ef          	jal	ra,800336 <vprintfmt>
  800196:	60e2                	ld	ra,24(sp)
  800198:	4532                	lw	a0,12(sp)
  80019a:	6105                	addi	sp,sp,32
  80019c:	8082                	ret

000000000080019e <cprintf>:
  80019e:	711d                	addi	sp,sp,-96
  8001a0:	02810313          	addi	t1,sp,40
  8001a4:	8e2a                	mv	t3,a0
  8001a6:	f42e                	sd	a1,40(sp)
  8001a8:	75dd                	lui	a1,0xffff7
  8001aa:	f832                	sd	a2,48(sp)
  8001ac:	fc36                	sd	a3,56(sp)
  8001ae:	e0ba                	sd	a4,64(sp)
  8001b0:	00000517          	auipc	a0,0x0
  8001b4:	fae50513          	addi	a0,a0,-82 # 80015e <cputch>
  8001b8:	0050                	addi	a2,sp,4
  8001ba:	871a                	mv	a4,t1
  8001bc:	86f2                	mv	a3,t3
  8001be:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <pids+0xffffffffff7f5aa9>
  8001c2:	ec06                	sd	ra,24(sp)
  8001c4:	e4be                	sd	a5,72(sp)
  8001c6:	e8c2                	sd	a6,80(sp)
  8001c8:	ecc6                	sd	a7,88(sp)
  8001ca:	e41a                	sd	t1,8(sp)
  8001cc:	c202                	sw	zero,4(sp)
  8001ce:	168000ef          	jal	ra,800336 <vprintfmt>
  8001d2:	60e2                	ld	ra,24(sp)
  8001d4:	4512                	lw	a0,4(sp)
  8001d6:	6125                	addi	sp,sp,96
  8001d8:	8082                	ret

00000000008001da <initfd>:
  8001da:	1101                	addi	sp,sp,-32
  8001dc:	87ae                	mv	a5,a1
  8001de:	e426                	sd	s1,8(sp)
  8001e0:	85b2                	mv	a1,a2
  8001e2:	84aa                	mv	s1,a0
  8001e4:	853e                	mv	a0,a5
  8001e6:	e822                	sd	s0,16(sp)
  8001e8:	ec06                	sd	ra,24(sp)
  8001ea:	f6bff0ef          	jal	ra,800154 <open>
  8001ee:	842a                	mv	s0,a0
  8001f0:	00054463          	bltz	a0,8001f8 <initfd+0x1e>
  8001f4:	00951863          	bne	a0,s1,800204 <initfd+0x2a>
  8001f8:	60e2                	ld	ra,24(sp)
  8001fa:	8522                	mv	a0,s0
  8001fc:	6442                	ld	s0,16(sp)
  8001fe:	64a2                	ld	s1,8(sp)
  800200:	6105                	addi	sp,sp,32
  800202:	8082                	ret
  800204:	8526                	mv	a0,s1
  800206:	f55ff0ef          	jal	ra,80015a <close>
  80020a:	85a6                	mv	a1,s1
  80020c:	8522                	mv	a0,s0
  80020e:	f4fff0ef          	jal	ra,80015c <dup2>
  800212:	84aa                	mv	s1,a0
  800214:	8522                	mv	a0,s0
  800216:	f45ff0ef          	jal	ra,80015a <close>
  80021a:	8426                	mv	s0,s1
  80021c:	bff1                	j	8001f8 <initfd+0x1e>

000000000080021e <umain>:
  80021e:	1101                	addi	sp,sp,-32
  800220:	e822                	sd	s0,16(sp)
  800222:	e426                	sd	s1,8(sp)
  800224:	842a                	mv	s0,a0
  800226:	84ae                	mv	s1,a1
  800228:	4601                	li	a2,0
  80022a:	00000597          	auipc	a1,0x0
  80022e:	6be58593          	addi	a1,a1,1726 # 8008e8 <main+0x214>
  800232:	4501                	li	a0,0
  800234:	ec06                	sd	ra,24(sp)
  800236:	fa5ff0ef          	jal	ra,8001da <initfd>
  80023a:	02054263          	bltz	a0,80025e <umain+0x40>
  80023e:	4605                	li	a2,1
  800240:	00000597          	auipc	a1,0x0
  800244:	6e858593          	addi	a1,a1,1768 # 800928 <main+0x254>
  800248:	4505                	li	a0,1
  80024a:	f91ff0ef          	jal	ra,8001da <initfd>
  80024e:	02054563          	bltz	a0,800278 <umain+0x5a>
  800252:	85a6                	mv	a1,s1
  800254:	8522                	mv	a0,s0
  800256:	47e000ef          	jal	ra,8006d4 <main>
  80025a:	ecfff0ef          	jal	ra,800128 <exit>
  80025e:	86aa                	mv	a3,a0
  800260:	00000617          	auipc	a2,0x0
  800264:	69060613          	addi	a2,a2,1680 # 8008f0 <main+0x21c>
  800268:	45e9                	li	a1,26
  80026a:	00000517          	auipc	a0,0x0
  80026e:	6a650513          	addi	a0,a0,1702 # 800910 <main+0x23c>
  800272:	df1ff0ef          	jal	ra,800062 <__warn>
  800276:	b7e1                	j	80023e <umain+0x20>
  800278:	86aa                	mv	a3,a0
  80027a:	00000617          	auipc	a2,0x0
  80027e:	6b660613          	addi	a2,a2,1718 # 800930 <main+0x25c>
  800282:	45f5                	li	a1,29
  800284:	00000517          	auipc	a0,0x0
  800288:	68c50513          	addi	a0,a0,1676 # 800910 <main+0x23c>
  80028c:	dd7ff0ef          	jal	ra,800062 <__warn>
  800290:	b7c9                	j	800252 <umain+0x34>

0000000000800292 <strnlen>:
  800292:	872a                	mv	a4,a0
  800294:	4501                	li	a0,0
  800296:	e589                	bnez	a1,8002a0 <strnlen+0xe>
  800298:	a811                	j	8002ac <strnlen+0x1a>
  80029a:	0505                	addi	a0,a0,1
  80029c:	00a58763          	beq	a1,a0,8002aa <strnlen+0x18>
  8002a0:	00a707b3          	add	a5,a4,a0
  8002a4:	0007c783          	lbu	a5,0(a5)
  8002a8:	fbed                	bnez	a5,80029a <strnlen+0x8>
  8002aa:	8082                	ret
  8002ac:	8082                	ret

00000000008002ae <memset>:
  8002ae:	ca01                	beqz	a2,8002be <memset+0x10>
  8002b0:	962a                	add	a2,a2,a0
  8002b2:	87aa                	mv	a5,a0
  8002b4:	0785                	addi	a5,a5,1
  8002b6:	feb78fa3          	sb	a1,-1(a5)
  8002ba:	fec79de3          	bne	a5,a2,8002b4 <memset+0x6>
  8002be:	8082                	ret

00000000008002c0 <printnum>:
  8002c0:	02071893          	slli	a7,a4,0x20
  8002c4:	7139                	addi	sp,sp,-64
  8002c6:	0208d893          	srli	a7,a7,0x20
  8002ca:	e456                	sd	s5,8(sp)
  8002cc:	0316fab3          	remu	s5,a3,a7
  8002d0:	f822                	sd	s0,48(sp)
  8002d2:	f426                	sd	s1,40(sp)
  8002d4:	f04a                	sd	s2,32(sp)
  8002d6:	ec4e                	sd	s3,24(sp)
  8002d8:	fc06                	sd	ra,56(sp)
  8002da:	e852                	sd	s4,16(sp)
  8002dc:	84aa                	mv	s1,a0
  8002de:	89ae                	mv	s3,a1
  8002e0:	8932                	mv	s2,a2
  8002e2:	fff7841b          	addiw	s0,a5,-1
  8002e6:	2a81                	sext.w	s5,s5
  8002e8:	0516f163          	bgeu	a3,a7,80032a <printnum+0x6a>
  8002ec:	8a42                	mv	s4,a6
  8002ee:	00805863          	blez	s0,8002fe <printnum+0x3e>
  8002f2:	347d                	addiw	s0,s0,-1
  8002f4:	864e                	mv	a2,s3
  8002f6:	85ca                	mv	a1,s2
  8002f8:	8552                	mv	a0,s4
  8002fa:	9482                	jalr	s1
  8002fc:	f87d                	bnez	s0,8002f2 <printnum+0x32>
  8002fe:	1a82                	slli	s5,s5,0x20
  800300:	020ada93          	srli	s5,s5,0x20
  800304:	00000797          	auipc	a5,0x0
  800308:	64c78793          	addi	a5,a5,1612 # 800950 <main+0x27c>
  80030c:	7442                	ld	s0,48(sp)
  80030e:	9abe                	add	s5,s5,a5
  800310:	000ac503          	lbu	a0,0(s5)
  800314:	70e2                	ld	ra,56(sp)
  800316:	6a42                	ld	s4,16(sp)
  800318:	6aa2                	ld	s5,8(sp)
  80031a:	864e                	mv	a2,s3
  80031c:	85ca                	mv	a1,s2
  80031e:	69e2                	ld	s3,24(sp)
  800320:	7902                	ld	s2,32(sp)
  800322:	8326                	mv	t1,s1
  800324:	74a2                	ld	s1,40(sp)
  800326:	6121                	addi	sp,sp,64
  800328:	8302                	jr	t1
  80032a:	0316d6b3          	divu	a3,a3,a7
  80032e:	87a2                	mv	a5,s0
  800330:	f91ff0ef          	jal	ra,8002c0 <printnum>
  800334:	b7e9                	j	8002fe <printnum+0x3e>

0000000000800336 <vprintfmt>:
  800336:	7119                	addi	sp,sp,-128
  800338:	f4a6                	sd	s1,104(sp)
  80033a:	f0ca                	sd	s2,96(sp)
  80033c:	ecce                	sd	s3,88(sp)
  80033e:	e8d2                	sd	s4,80(sp)
  800340:	e4d6                	sd	s5,72(sp)
  800342:	e0da                	sd	s6,64(sp)
  800344:	fc5e                	sd	s7,56(sp)
  800346:	ec6e                	sd	s11,24(sp)
  800348:	fc86                	sd	ra,120(sp)
  80034a:	f8a2                	sd	s0,112(sp)
  80034c:	f862                	sd	s8,48(sp)
  80034e:	f466                	sd	s9,40(sp)
  800350:	f06a                	sd	s10,32(sp)
  800352:	89aa                	mv	s3,a0
  800354:	892e                	mv	s2,a1
  800356:	84b2                	mv	s1,a2
  800358:	8db6                	mv	s11,a3
  80035a:	8aba                	mv	s5,a4
  80035c:	02500a13          	li	s4,37
  800360:	5bfd                	li	s7,-1
  800362:	00000b17          	auipc	s6,0x0
  800366:	622b0b13          	addi	s6,s6,1570 # 800984 <main+0x2b0>
  80036a:	000dc503          	lbu	a0,0(s11)
  80036e:	001d8413          	addi	s0,s11,1
  800372:	01450b63          	beq	a0,s4,800388 <vprintfmt+0x52>
  800376:	c129                	beqz	a0,8003b8 <vprintfmt+0x82>
  800378:	864a                	mv	a2,s2
  80037a:	85a6                	mv	a1,s1
  80037c:	0405                	addi	s0,s0,1
  80037e:	9982                	jalr	s3
  800380:	fff44503          	lbu	a0,-1(s0)
  800384:	ff4519e3          	bne	a0,s4,800376 <vprintfmt+0x40>
  800388:	00044583          	lbu	a1,0(s0)
  80038c:	02000813          	li	a6,32
  800390:	4d01                	li	s10,0
  800392:	4301                	li	t1,0
  800394:	5cfd                	li	s9,-1
  800396:	5c7d                	li	s8,-1
  800398:	05500513          	li	a0,85
  80039c:	48a5                	li	a7,9
  80039e:	fdd5861b          	addiw	a2,a1,-35
  8003a2:	0ff67613          	andi	a2,a2,255
  8003a6:	00140d93          	addi	s11,s0,1
  8003aa:	04c56263          	bltu	a0,a2,8003ee <vprintfmt+0xb8>
  8003ae:	060a                	slli	a2,a2,0x2
  8003b0:	965a                	add	a2,a2,s6
  8003b2:	4214                	lw	a3,0(a2)
  8003b4:	96da                	add	a3,a3,s6
  8003b6:	8682                	jr	a3
  8003b8:	70e6                	ld	ra,120(sp)
  8003ba:	7446                	ld	s0,112(sp)
  8003bc:	74a6                	ld	s1,104(sp)
  8003be:	7906                	ld	s2,96(sp)
  8003c0:	69e6                	ld	s3,88(sp)
  8003c2:	6a46                	ld	s4,80(sp)
  8003c4:	6aa6                	ld	s5,72(sp)
  8003c6:	6b06                	ld	s6,64(sp)
  8003c8:	7be2                	ld	s7,56(sp)
  8003ca:	7c42                	ld	s8,48(sp)
  8003cc:	7ca2                	ld	s9,40(sp)
  8003ce:	7d02                	ld	s10,32(sp)
  8003d0:	6de2                	ld	s11,24(sp)
  8003d2:	6109                	addi	sp,sp,128
  8003d4:	8082                	ret
  8003d6:	882e                	mv	a6,a1
  8003d8:	00144583          	lbu	a1,1(s0)
  8003dc:	846e                	mv	s0,s11
  8003de:	00140d93          	addi	s11,s0,1
  8003e2:	fdd5861b          	addiw	a2,a1,-35
  8003e6:	0ff67613          	andi	a2,a2,255
  8003ea:	fcc572e3          	bgeu	a0,a2,8003ae <vprintfmt+0x78>
  8003ee:	864a                	mv	a2,s2
  8003f0:	85a6                	mv	a1,s1
  8003f2:	02500513          	li	a0,37
  8003f6:	9982                	jalr	s3
  8003f8:	fff44783          	lbu	a5,-1(s0)
  8003fc:	8da2                	mv	s11,s0
  8003fe:	f74786e3          	beq	a5,s4,80036a <vprintfmt+0x34>
  800402:	ffedc783          	lbu	a5,-2(s11)
  800406:	1dfd                	addi	s11,s11,-1
  800408:	ff479de3          	bne	a5,s4,800402 <vprintfmt+0xcc>
  80040c:	bfb9                	j	80036a <vprintfmt+0x34>
  80040e:	fd058c9b          	addiw	s9,a1,-48
  800412:	00144583          	lbu	a1,1(s0)
  800416:	846e                	mv	s0,s11
  800418:	fd05869b          	addiw	a3,a1,-48
  80041c:	0005861b          	sext.w	a2,a1
  800420:	02d8e463          	bltu	a7,a3,800448 <vprintfmt+0x112>
  800424:	00144583          	lbu	a1,1(s0)
  800428:	002c969b          	slliw	a3,s9,0x2
  80042c:	0196873b          	addw	a4,a3,s9
  800430:	0017171b          	slliw	a4,a4,0x1
  800434:	9f31                	addw	a4,a4,a2
  800436:	fd05869b          	addiw	a3,a1,-48
  80043a:	0405                	addi	s0,s0,1
  80043c:	fd070c9b          	addiw	s9,a4,-48
  800440:	0005861b          	sext.w	a2,a1
  800444:	fed8f0e3          	bgeu	a7,a3,800424 <vprintfmt+0xee>
  800448:	f40c5be3          	bgez	s8,80039e <vprintfmt+0x68>
  80044c:	8c66                	mv	s8,s9
  80044e:	5cfd                	li	s9,-1
  800450:	b7b9                	j	80039e <vprintfmt+0x68>
  800452:	fffc4693          	not	a3,s8
  800456:	96fd                	srai	a3,a3,0x3f
  800458:	00dc77b3          	and	a5,s8,a3
  80045c:	00144583          	lbu	a1,1(s0)
  800460:	00078c1b          	sext.w	s8,a5
  800464:	846e                	mv	s0,s11
  800466:	bf25                	j	80039e <vprintfmt+0x68>
  800468:	000aac83          	lw	s9,0(s5)
  80046c:	00144583          	lbu	a1,1(s0)
  800470:	0aa1                	addi	s5,s5,8
  800472:	846e                	mv	s0,s11
  800474:	bfd1                	j	800448 <vprintfmt+0x112>
  800476:	4705                	li	a4,1
  800478:	008a8613          	addi	a2,s5,8
  80047c:	00674463          	blt	a4,t1,800484 <vprintfmt+0x14e>
  800480:	1c030c63          	beqz	t1,800658 <vprintfmt+0x322>
  800484:	000ab683          	ld	a3,0(s5)
  800488:	4741                	li	a4,16
  80048a:	8ab2                	mv	s5,a2
  80048c:	2801                	sext.w	a6,a6
  80048e:	87e2                	mv	a5,s8
  800490:	8626                	mv	a2,s1
  800492:	85ca                	mv	a1,s2
  800494:	854e                	mv	a0,s3
  800496:	e2bff0ef          	jal	ra,8002c0 <printnum>
  80049a:	bdc1                	j	80036a <vprintfmt+0x34>
  80049c:	000aa503          	lw	a0,0(s5)
  8004a0:	864a                	mv	a2,s2
  8004a2:	85a6                	mv	a1,s1
  8004a4:	0aa1                	addi	s5,s5,8
  8004a6:	9982                	jalr	s3
  8004a8:	b5c9                	j	80036a <vprintfmt+0x34>
  8004aa:	4705                	li	a4,1
  8004ac:	008a8613          	addi	a2,s5,8
  8004b0:	00674463          	blt	a4,t1,8004b8 <vprintfmt+0x182>
  8004b4:	18030d63          	beqz	t1,80064e <vprintfmt+0x318>
  8004b8:	000ab683          	ld	a3,0(s5)
  8004bc:	4729                	li	a4,10
  8004be:	8ab2                	mv	s5,a2
  8004c0:	b7f1                	j	80048c <vprintfmt+0x156>
  8004c2:	00144583          	lbu	a1,1(s0)
  8004c6:	4d05                	li	s10,1
  8004c8:	846e                	mv	s0,s11
  8004ca:	bdd1                	j	80039e <vprintfmt+0x68>
  8004cc:	864a                	mv	a2,s2
  8004ce:	85a6                	mv	a1,s1
  8004d0:	02500513          	li	a0,37
  8004d4:	9982                	jalr	s3
  8004d6:	bd51                	j	80036a <vprintfmt+0x34>
  8004d8:	00144583          	lbu	a1,1(s0)
  8004dc:	2305                	addiw	t1,t1,1
  8004de:	846e                	mv	s0,s11
  8004e0:	bd7d                	j	80039e <vprintfmt+0x68>
  8004e2:	4705                	li	a4,1
  8004e4:	008a8613          	addi	a2,s5,8
  8004e8:	00674463          	blt	a4,t1,8004f0 <vprintfmt+0x1ba>
  8004ec:	14030c63          	beqz	t1,800644 <vprintfmt+0x30e>
  8004f0:	000ab683          	ld	a3,0(s5)
  8004f4:	4721                	li	a4,8
  8004f6:	8ab2                	mv	s5,a2
  8004f8:	bf51                	j	80048c <vprintfmt+0x156>
  8004fa:	03000513          	li	a0,48
  8004fe:	864a                	mv	a2,s2
  800500:	85a6                	mv	a1,s1
  800502:	e042                	sd	a6,0(sp)
  800504:	9982                	jalr	s3
  800506:	864a                	mv	a2,s2
  800508:	85a6                	mv	a1,s1
  80050a:	07800513          	li	a0,120
  80050e:	9982                	jalr	s3
  800510:	0aa1                	addi	s5,s5,8
  800512:	6802                	ld	a6,0(sp)
  800514:	4741                	li	a4,16
  800516:	ff8ab683          	ld	a3,-8(s5)
  80051a:	bf8d                	j	80048c <vprintfmt+0x156>
  80051c:	000ab403          	ld	s0,0(s5)
  800520:	008a8793          	addi	a5,s5,8
  800524:	e03e                	sd	a5,0(sp)
  800526:	14040c63          	beqz	s0,80067e <vprintfmt+0x348>
  80052a:	11805063          	blez	s8,80062a <vprintfmt+0x2f4>
  80052e:	02d00693          	li	a3,45
  800532:	0cd81963          	bne	a6,a3,800604 <vprintfmt+0x2ce>
  800536:	00044683          	lbu	a3,0(s0)
  80053a:	0006851b          	sext.w	a0,a3
  80053e:	ce8d                	beqz	a3,800578 <vprintfmt+0x242>
  800540:	00140a93          	addi	s5,s0,1
  800544:	05e00413          	li	s0,94
  800548:	000cc563          	bltz	s9,800552 <vprintfmt+0x21c>
  80054c:	3cfd                	addiw	s9,s9,-1
  80054e:	037c8363          	beq	s9,s7,800574 <vprintfmt+0x23e>
  800552:	864a                	mv	a2,s2
  800554:	85a6                	mv	a1,s1
  800556:	100d0663          	beqz	s10,800662 <vprintfmt+0x32c>
  80055a:	3681                	addiw	a3,a3,-32
  80055c:	10d47363          	bgeu	s0,a3,800662 <vprintfmt+0x32c>
  800560:	03f00513          	li	a0,63
  800564:	9982                	jalr	s3
  800566:	000ac683          	lbu	a3,0(s5)
  80056a:	3c7d                	addiw	s8,s8,-1
  80056c:	0a85                	addi	s5,s5,1
  80056e:	0006851b          	sext.w	a0,a3
  800572:	faf9                	bnez	a3,800548 <vprintfmt+0x212>
  800574:	01805a63          	blez	s8,800588 <vprintfmt+0x252>
  800578:	3c7d                	addiw	s8,s8,-1
  80057a:	864a                	mv	a2,s2
  80057c:	85a6                	mv	a1,s1
  80057e:	02000513          	li	a0,32
  800582:	9982                	jalr	s3
  800584:	fe0c1ae3          	bnez	s8,800578 <vprintfmt+0x242>
  800588:	6a82                	ld	s5,0(sp)
  80058a:	b3c5                	j	80036a <vprintfmt+0x34>
  80058c:	4705                	li	a4,1
  80058e:	008a8d13          	addi	s10,s5,8
  800592:	00674463          	blt	a4,t1,80059a <vprintfmt+0x264>
  800596:	0a030463          	beqz	t1,80063e <vprintfmt+0x308>
  80059a:	000ab403          	ld	s0,0(s5)
  80059e:	0c044463          	bltz	s0,800666 <vprintfmt+0x330>
  8005a2:	86a2                	mv	a3,s0
  8005a4:	8aea                	mv	s5,s10
  8005a6:	4729                	li	a4,10
  8005a8:	b5d5                	j	80048c <vprintfmt+0x156>
  8005aa:	000aa783          	lw	a5,0(s5)
  8005ae:	46e1                	li	a3,24
  8005b0:	0aa1                	addi	s5,s5,8
  8005b2:	41f7d71b          	sraiw	a4,a5,0x1f
  8005b6:	8fb9                	xor	a5,a5,a4
  8005b8:	40e7873b          	subw	a4,a5,a4
  8005bc:	02e6c663          	blt	a3,a4,8005e8 <vprintfmt+0x2b2>
  8005c0:	00371793          	slli	a5,a4,0x3
  8005c4:	00000697          	auipc	a3,0x0
  8005c8:	6f468693          	addi	a3,a3,1780 # 800cb8 <error_string>
  8005cc:	97b6                	add	a5,a5,a3
  8005ce:	639c                	ld	a5,0(a5)
  8005d0:	cf81                	beqz	a5,8005e8 <vprintfmt+0x2b2>
  8005d2:	873e                	mv	a4,a5
  8005d4:	00000697          	auipc	a3,0x0
  8005d8:	3ac68693          	addi	a3,a3,940 # 800980 <main+0x2ac>
  8005dc:	8626                	mv	a2,s1
  8005de:	85ca                	mv	a1,s2
  8005e0:	854e                	mv	a0,s3
  8005e2:	0d4000ef          	jal	ra,8006b6 <printfmt>
  8005e6:	b351                	j	80036a <vprintfmt+0x34>
  8005e8:	00000697          	auipc	a3,0x0
  8005ec:	38868693          	addi	a3,a3,904 # 800970 <main+0x29c>
  8005f0:	8626                	mv	a2,s1
  8005f2:	85ca                	mv	a1,s2
  8005f4:	854e                	mv	a0,s3
  8005f6:	0c0000ef          	jal	ra,8006b6 <printfmt>
  8005fa:	bb85                	j	80036a <vprintfmt+0x34>
  8005fc:	00000417          	auipc	s0,0x0
  800600:	36c40413          	addi	s0,s0,876 # 800968 <main+0x294>
  800604:	85e6                	mv	a1,s9
  800606:	8522                	mv	a0,s0
  800608:	e442                	sd	a6,8(sp)
  80060a:	c89ff0ef          	jal	ra,800292 <strnlen>
  80060e:	40ac0c3b          	subw	s8,s8,a0
  800612:	01805c63          	blez	s8,80062a <vprintfmt+0x2f4>
  800616:	6822                	ld	a6,8(sp)
  800618:	00080a9b          	sext.w	s5,a6
  80061c:	3c7d                	addiw	s8,s8,-1
  80061e:	864a                	mv	a2,s2
  800620:	85a6                	mv	a1,s1
  800622:	8556                	mv	a0,s5
  800624:	9982                	jalr	s3
  800626:	fe0c1be3          	bnez	s8,80061c <vprintfmt+0x2e6>
  80062a:	00044683          	lbu	a3,0(s0)
  80062e:	00140a93          	addi	s5,s0,1
  800632:	0006851b          	sext.w	a0,a3
  800636:	daa9                	beqz	a3,800588 <vprintfmt+0x252>
  800638:	05e00413          	li	s0,94
  80063c:	b731                	j	800548 <vprintfmt+0x212>
  80063e:	000aa403          	lw	s0,0(s5)
  800642:	bfb1                	j	80059e <vprintfmt+0x268>
  800644:	000ae683          	lwu	a3,0(s5)
  800648:	4721                	li	a4,8
  80064a:	8ab2                	mv	s5,a2
  80064c:	b581                	j	80048c <vprintfmt+0x156>
  80064e:	000ae683          	lwu	a3,0(s5)
  800652:	4729                	li	a4,10
  800654:	8ab2                	mv	s5,a2
  800656:	bd1d                	j	80048c <vprintfmt+0x156>
  800658:	000ae683          	lwu	a3,0(s5)
  80065c:	4741                	li	a4,16
  80065e:	8ab2                	mv	s5,a2
  800660:	b535                	j	80048c <vprintfmt+0x156>
  800662:	9982                	jalr	s3
  800664:	b709                	j	800566 <vprintfmt+0x230>
  800666:	864a                	mv	a2,s2
  800668:	85a6                	mv	a1,s1
  80066a:	02d00513          	li	a0,45
  80066e:	e042                	sd	a6,0(sp)
  800670:	9982                	jalr	s3
  800672:	6802                	ld	a6,0(sp)
  800674:	8aea                	mv	s5,s10
  800676:	408006b3          	neg	a3,s0
  80067a:	4729                	li	a4,10
  80067c:	bd01                	j	80048c <vprintfmt+0x156>
  80067e:	03805163          	blez	s8,8006a0 <vprintfmt+0x36a>
  800682:	02d00693          	li	a3,45
  800686:	f6d81be3          	bne	a6,a3,8005fc <vprintfmt+0x2c6>
  80068a:	00000417          	auipc	s0,0x0
  80068e:	2de40413          	addi	s0,s0,734 # 800968 <main+0x294>
  800692:	02800693          	li	a3,40
  800696:	02800513          	li	a0,40
  80069a:	00140a93          	addi	s5,s0,1
  80069e:	b55d                	j	800544 <vprintfmt+0x20e>
  8006a0:	00000a97          	auipc	s5,0x0
  8006a4:	2c9a8a93          	addi	s5,s5,713 # 800969 <main+0x295>
  8006a8:	02800513          	li	a0,40
  8006ac:	02800693          	li	a3,40
  8006b0:	05e00413          	li	s0,94
  8006b4:	bd51                	j	800548 <vprintfmt+0x212>

00000000008006b6 <printfmt>:
  8006b6:	7139                	addi	sp,sp,-64
  8006b8:	02010313          	addi	t1,sp,32
  8006bc:	f03a                	sd	a4,32(sp)
  8006be:	871a                	mv	a4,t1
  8006c0:	ec06                	sd	ra,24(sp)
  8006c2:	f43e                	sd	a5,40(sp)
  8006c4:	f842                	sd	a6,48(sp)
  8006c6:	fc46                	sd	a7,56(sp)
  8006c8:	e41a                	sd	t1,8(sp)
  8006ca:	c6dff0ef          	jal	ra,800336 <vprintfmt>
  8006ce:	60e2                	ld	ra,24(sp)
  8006d0:	6121                	addi	sp,sp,64
  8006d2:	8082                	ret

00000000008006d4 <main>:
  8006d4:	711d                	addi	sp,sp,-96
  8006d6:	4651                	li	a2,20
  8006d8:	4581                	li	a1,0
  8006da:	00001517          	auipc	a0,0x1
  8006de:	95650513          	addi	a0,a0,-1706 # 801030 <pids>
  8006e2:	ec86                	sd	ra,88(sp)
  8006e4:	e8a2                	sd	s0,80(sp)
  8006e6:	e4a6                	sd	s1,72(sp)
  8006e8:	e0ca                	sd	s2,64(sp)
  8006ea:	fc4e                	sd	s3,56(sp)
  8006ec:	f852                	sd	s4,48(sp)
  8006ee:	f456                	sd	s5,40(sp)
  8006f0:	f05a                	sd	s6,32(sp)
  8006f2:	ec5e                	sd	s7,24(sp)
  8006f4:	bbbff0ef          	jal	ra,8002ae <memset>
  8006f8:	4519                	li	a0,6
  8006fa:	00001a97          	auipc	s5,0x1
  8006fe:	906a8a93          	addi	s5,s5,-1786 # 801000 <acc>
  800702:	00001917          	auipc	s2,0x1
  800706:	92e90913          	addi	s2,s2,-1746 # 801030 <pids>
  80070a:	a3fff0ef          	jal	ra,800148 <lab6_set_priority>
  80070e:	89d6                	mv	s3,s5
  800710:	84ca                	mv	s1,s2
  800712:	4401                	li	s0,0
  800714:	4a15                	li	s4,5
  800716:	0009a023          	sw	zero,0(s3)
  80071a:	a25ff0ef          	jal	ra,80013e <fork>
  80071e:	c088                	sw	a0,0(s1)
  800720:	c969                	beqz	a0,8007f2 <main+0x11e>
  800722:	12054d63          	bltz	a0,80085c <main+0x188>
  800726:	2405                	addiw	s0,s0,1
  800728:	0991                	addi	s3,s3,4
  80072a:	0491                	addi	s1,s1,4
  80072c:	ff4415e3          	bne	s0,s4,800716 <main+0x42>
  800730:	00001497          	auipc	s1,0x1
  800734:	8e848493          	addi	s1,s1,-1816 # 801018 <status>
  800738:	00000517          	auipc	a0,0x0
  80073c:	66850513          	addi	a0,a0,1640 # 800da0 <error_string+0xe8>
  800740:	a5fff0ef          	jal	ra,80019e <cprintf>
  800744:	00001997          	auipc	s3,0x1
  800748:	8e898993          	addi	s3,s3,-1816 # 80102c <status+0x14>
  80074c:	8a26                	mv	s4,s1
  80074e:	8426                	mv	s0,s1
  800750:	00000b97          	auipc	s7,0x0
  800754:	678b8b93          	addi	s7,s7,1656 # 800dc8 <error_string+0x110>
  800758:	00092503          	lw	a0,0(s2)
  80075c:	85a2                	mv	a1,s0
  80075e:	00042023          	sw	zero,0(s0)
  800762:	9dfff0ef          	jal	ra,800140 <waitpid>
  800766:	00092a83          	lw	s5,0(s2)
  80076a:	00042b03          	lw	s6,0(s0)
  80076e:	9d9ff0ef          	jal	ra,800146 <gettime_msec>
  800772:	0005069b          	sext.w	a3,a0
  800776:	865a                	mv	a2,s6
  800778:	85d6                	mv	a1,s5
  80077a:	855e                	mv	a0,s7
  80077c:	0411                	addi	s0,s0,4
  80077e:	a21ff0ef          	jal	ra,80019e <cprintf>
  800782:	0911                	addi	s2,s2,4
  800784:	fd341ae3          	bne	s0,s3,800758 <main+0x84>
  800788:	00000517          	auipc	a0,0x0
  80078c:	66050513          	addi	a0,a0,1632 # 800de8 <error_string+0x130>
  800790:	a0fff0ef          	jal	ra,80019e <cprintf>
  800794:	00000517          	auipc	a0,0x0
  800798:	66c50513          	addi	a0,a0,1644 # 800e00 <error_string+0x148>
  80079c:	a03ff0ef          	jal	ra,80019e <cprintf>
  8007a0:	00000417          	auipc	s0,0x0
  8007a4:	68040413          	addi	s0,s0,1664 # 800e20 <error_string+0x168>
  8007a8:	408c                	lw	a1,0(s1)
  8007aa:	000a2783          	lw	a5,0(s4)
  8007ae:	0491                	addi	s1,s1,4
  8007b0:	0015959b          	slliw	a1,a1,0x1
  8007b4:	02f5c5bb          	divw	a1,a1,a5
  8007b8:	8522                	mv	a0,s0
  8007ba:	2585                	addiw	a1,a1,1
  8007bc:	01f5d79b          	srliw	a5,a1,0x1f
  8007c0:	9dbd                	addw	a1,a1,a5
  8007c2:	4015d59b          	sraiw	a1,a1,0x1
  8007c6:	9d9ff0ef          	jal	ra,80019e <cprintf>
  8007ca:	fd349fe3          	bne	s1,s3,8007a8 <main+0xd4>
  8007ce:	00000517          	auipc	a0,0x0
  8007d2:	13a50513          	addi	a0,a0,314 # 800908 <main+0x234>
  8007d6:	9c9ff0ef          	jal	ra,80019e <cprintf>
  8007da:	60e6                	ld	ra,88(sp)
  8007dc:	6446                	ld	s0,80(sp)
  8007de:	64a6                	ld	s1,72(sp)
  8007e0:	6906                	ld	s2,64(sp)
  8007e2:	79e2                	ld	s3,56(sp)
  8007e4:	7a42                	ld	s4,48(sp)
  8007e6:	7aa2                	ld	s5,40(sp)
  8007e8:	7b02                	ld	s6,32(sp)
  8007ea:	6be2                	ld	s7,24(sp)
  8007ec:	4501                	li	a0,0
  8007ee:	6125                	addi	sp,sp,96
  8007f0:	8082                	ret
  8007f2:	0014051b          	addiw	a0,s0,1
  8007f6:	040a                	slli	s0,s0,0x2
  8007f8:	9456                	add	s0,s0,s5
  8007fa:	6485                	lui	s1,0x1
  8007fc:	6989                	lui	s3,0x2
  8007fe:	94bff0ef          	jal	ra,800148 <lab6_set_priority>
  800802:	fa04849b          	addiw	s1,s1,-96
  800806:	00042023          	sw	zero,0(s0)
  80080a:	71098993          	addi	s3,s3,1808 # 2710 <__panic-0x7fd910>
  80080e:	4014                	lw	a3,0(s0)
  800810:	2685                	addiw	a3,a3,1
  800812:	0c800713          	li	a4,200
  800816:	47b2                	lw	a5,12(sp)
  800818:	377d                	addiw	a4,a4,-1
  80081a:	2781                	sext.w	a5,a5
  80081c:	0017b793          	seqz	a5,a5
  800820:	c63e                	sw	a5,12(sp)
  800822:	fb75                	bnez	a4,800816 <main+0x142>
  800824:	0296f7bb          	remuw	a5,a3,s1
  800828:	0016871b          	addiw	a4,a3,1
  80082c:	c399                	beqz	a5,800832 <main+0x15e>
  80082e:	86ba                	mv	a3,a4
  800830:	b7cd                	j	800812 <main+0x13e>
  800832:	c014                	sw	a3,0(s0)
  800834:	913ff0ef          	jal	ra,800146 <gettime_msec>
  800838:	0005091b          	sext.w	s2,a0
  80083c:	fd29d9e3          	bge	s3,s2,80080e <main+0x13a>
  800840:	905ff0ef          	jal	ra,800144 <getpid>
  800844:	4010                	lw	a2,0(s0)
  800846:	85aa                	mv	a1,a0
  800848:	86ca                	mv	a3,s2
  80084a:	00000517          	auipc	a0,0x0
  80084e:	53650513          	addi	a0,a0,1334 # 800d80 <error_string+0xc8>
  800852:	94dff0ef          	jal	ra,80019e <cprintf>
  800856:	4008                	lw	a0,0(s0)
  800858:	8d1ff0ef          	jal	ra,800128 <exit>
  80085c:	00000417          	auipc	s0,0x0
  800860:	7e840413          	addi	s0,s0,2024 # 801044 <pids+0x14>
  800864:	00092503          	lw	a0,0(s2)
  800868:	00a05463          	blez	a0,800870 <main+0x19c>
  80086c:	8d7ff0ef          	jal	ra,800142 <kill>
  800870:	0911                	addi	s2,s2,4
  800872:	ff2419e3          	bne	s0,s2,800864 <main+0x190>
  800876:	00000617          	auipc	a2,0x0
  80087a:	5b260613          	addi	a2,a2,1458 # 800e28 <error_string+0x170>
  80087e:	04b00593          	li	a1,75
  800882:	00000517          	auipc	a0,0x0
  800886:	5b650513          	addi	a0,a0,1462 # 800e38 <error_string+0x180>
  80088a:	f96ff0ef          	jal	ra,800020 <__panic>
