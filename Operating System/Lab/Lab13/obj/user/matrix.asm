
obj/__user_matrix.out:     file format elf64-littleriscv


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
  800034:	8c050513          	addi	a0,a0,-1856 # 8008f0 <main+0xc6>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	150000ef          	jal	ra,800194 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	122000ef          	jal	ra,80016e <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	91850513          	addi	a0,a0,-1768 # 800968 <main+0x13e>
  800058:	13c000ef          	jal	ra,800194 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0c2000ef          	jal	ra,800120 <exit>

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
  800076:	89e50513          	addi	a0,a0,-1890 # 800910 <main+0xe6>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	10e000ef          	jal	ra,800194 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0e0000ef          	jal	ra,80016e <vcprintf>
  800092:	00001517          	auipc	a0,0x1
  800096:	8d650513          	addi	a0,a0,-1834 # 800968 <main+0x13e>
  80009a:	0fa000ef          	jal	ra,800194 <cprintf>
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

00000000008000f0 <sys_yield>:
  8000f0:	4529                	li	a0,10
  8000f2:	bf55                	j	8000a6 <syscall>

00000000008000f4 <sys_kill>:
  8000f4:	85aa                	mv	a1,a0
  8000f6:	4531                	li	a0,12
  8000f8:	b77d                	j	8000a6 <syscall>

00000000008000fa <sys_getpid>:
  8000fa:	4549                	li	a0,18
  8000fc:	b76d                	j	8000a6 <syscall>

00000000008000fe <sys_putc>:
  8000fe:	85aa                	mv	a1,a0
  800100:	4579                	li	a0,30
  800102:	b755                	j	8000a6 <syscall>

0000000000800104 <sys_open>:
  800104:	862e                	mv	a2,a1
  800106:	85aa                	mv	a1,a0
  800108:	06400513          	li	a0,100
  80010c:	bf69                	j	8000a6 <syscall>

000000000080010e <sys_close>:
  80010e:	85aa                	mv	a1,a0
  800110:	06500513          	li	a0,101
  800114:	bf49                	j	8000a6 <syscall>

0000000000800116 <sys_dup>:
  800116:	862e                	mv	a2,a1
  800118:	85aa                	mv	a1,a0
  80011a:	08200513          	li	a0,130
  80011e:	b761                	j	8000a6 <syscall>

0000000000800120 <exit>:
  800120:	1141                	addi	sp,sp,-16
  800122:	e406                	sd	ra,8(sp)
  800124:	fbbff0ef          	jal	ra,8000de <sys_exit>
  800128:	00001517          	auipc	a0,0x1
  80012c:	80850513          	addi	a0,a0,-2040 # 800930 <main+0x106>
  800130:	064000ef          	jal	ra,800194 <cprintf>
  800134:	a001                	j	800134 <exit+0x14>

0000000000800136 <fork>:
  800136:	b77d                	j	8000e4 <sys_fork>

0000000000800138 <wait>:
  800138:	4581                	li	a1,0
  80013a:	4501                	li	a0,0
  80013c:	b775                	j	8000e8 <sys_wait>

000000000080013e <yield>:
  80013e:	bf4d                	j	8000f0 <sys_yield>

0000000000800140 <kill>:
  800140:	bf55                	j	8000f4 <sys_kill>

0000000000800142 <getpid>:
  800142:	bf65                	j	8000fa <sys_getpid>

0000000000800144 <_start>:
  800144:	0d0000ef          	jal	ra,800214 <umain>
  800148:	a001                	j	800148 <_start+0x4>

000000000080014a <open>:
  80014a:	1582                	slli	a1,a1,0x20
  80014c:	9181                	srli	a1,a1,0x20
  80014e:	bf5d                	j	800104 <sys_open>

0000000000800150 <close>:
  800150:	bf7d                	j	80010e <sys_close>

0000000000800152 <dup2>:
  800152:	b7d1                	j	800116 <sys_dup>

0000000000800154 <cputch>:
  800154:	1141                	addi	sp,sp,-16
  800156:	e022                	sd	s0,0(sp)
  800158:	e406                	sd	ra,8(sp)
  80015a:	842e                	mv	s0,a1
  80015c:	fa3ff0ef          	jal	ra,8000fe <sys_putc>
  800160:	401c                	lw	a5,0(s0)
  800162:	60a2                	ld	ra,8(sp)
  800164:	2785                	addiw	a5,a5,1
  800166:	c01c                	sw	a5,0(s0)
  800168:	6402                	ld	s0,0(sp)
  80016a:	0141                	addi	sp,sp,16
  80016c:	8082                	ret

000000000080016e <vcprintf>:
  80016e:	1101                	addi	sp,sp,-32
  800170:	872e                	mv	a4,a1
  800172:	75dd                	lui	a1,0xffff7
  800174:	86aa                	mv	a3,a0
  800176:	0070                	addi	a2,sp,12
  800178:	00000517          	auipc	a0,0x0
  80017c:	fdc50513          	addi	a0,a0,-36 # 800154 <cputch>
  800180:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <matc+0xffffffffff7f57b1>
  800184:	ec06                	sd	ra,24(sp)
  800186:	c602                	sw	zero,12(sp)
  800188:	1a4000ef          	jal	ra,80032c <vprintfmt>
  80018c:	60e2                	ld	ra,24(sp)
  80018e:	4532                	lw	a0,12(sp)
  800190:	6105                	addi	sp,sp,32
  800192:	8082                	ret

0000000000800194 <cprintf>:
  800194:	711d                	addi	sp,sp,-96
  800196:	02810313          	addi	t1,sp,40
  80019a:	8e2a                	mv	t3,a0
  80019c:	f42e                	sd	a1,40(sp)
  80019e:	75dd                	lui	a1,0xffff7
  8001a0:	f832                	sd	a2,48(sp)
  8001a2:	fc36                	sd	a3,56(sp)
  8001a4:	e0ba                	sd	a4,64(sp)
  8001a6:	00000517          	auipc	a0,0x0
  8001aa:	fae50513          	addi	a0,a0,-82 # 800154 <cputch>
  8001ae:	0050                	addi	a2,sp,4
  8001b0:	871a                	mv	a4,t1
  8001b2:	86f2                	mv	a3,t3
  8001b4:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <matc+0xffffffffff7f57b1>
  8001b8:	ec06                	sd	ra,24(sp)
  8001ba:	e4be                	sd	a5,72(sp)
  8001bc:	e8c2                	sd	a6,80(sp)
  8001be:	ecc6                	sd	a7,88(sp)
  8001c0:	e41a                	sd	t1,8(sp)
  8001c2:	c202                	sw	zero,4(sp)
  8001c4:	168000ef          	jal	ra,80032c <vprintfmt>
  8001c8:	60e2                	ld	ra,24(sp)
  8001ca:	4512                	lw	a0,4(sp)
  8001cc:	6125                	addi	sp,sp,96
  8001ce:	8082                	ret

00000000008001d0 <initfd>:
  8001d0:	1101                	addi	sp,sp,-32
  8001d2:	87ae                	mv	a5,a1
  8001d4:	e426                	sd	s1,8(sp)
  8001d6:	85b2                	mv	a1,a2
  8001d8:	84aa                	mv	s1,a0
  8001da:	853e                	mv	a0,a5
  8001dc:	e822                	sd	s0,16(sp)
  8001de:	ec06                	sd	ra,24(sp)
  8001e0:	f6bff0ef          	jal	ra,80014a <open>
  8001e4:	842a                	mv	s0,a0
  8001e6:	00054463          	bltz	a0,8001ee <initfd+0x1e>
  8001ea:	00951863          	bne	a0,s1,8001fa <initfd+0x2a>
  8001ee:	60e2                	ld	ra,24(sp)
  8001f0:	8522                	mv	a0,s0
  8001f2:	6442                	ld	s0,16(sp)
  8001f4:	64a2                	ld	s1,8(sp)
  8001f6:	6105                	addi	sp,sp,32
  8001f8:	8082                	ret
  8001fa:	8526                	mv	a0,s1
  8001fc:	f55ff0ef          	jal	ra,800150 <close>
  800200:	85a6                	mv	a1,s1
  800202:	8522                	mv	a0,s0
  800204:	f4fff0ef          	jal	ra,800152 <dup2>
  800208:	84aa                	mv	s1,a0
  80020a:	8522                	mv	a0,s0
  80020c:	f45ff0ef          	jal	ra,800150 <close>
  800210:	8426                	mv	s0,s1
  800212:	bff1                	j	8001ee <initfd+0x1e>

0000000000800214 <umain>:
  800214:	1101                	addi	sp,sp,-32
  800216:	e822                	sd	s0,16(sp)
  800218:	e426                	sd	s1,8(sp)
  80021a:	842a                	mv	s0,a0
  80021c:	84ae                	mv	s1,a1
  80021e:	4601                	li	a2,0
  800220:	00000597          	auipc	a1,0x0
  800224:	72858593          	addi	a1,a1,1832 # 800948 <main+0x11e>
  800228:	4501                	li	a0,0
  80022a:	ec06                	sd	ra,24(sp)
  80022c:	fa5ff0ef          	jal	ra,8001d0 <initfd>
  800230:	02054263          	bltz	a0,800254 <umain+0x40>
  800234:	4605                	li	a2,1
  800236:	00000597          	auipc	a1,0x0
  80023a:	75258593          	addi	a1,a1,1874 # 800988 <main+0x15e>
  80023e:	4505                	li	a0,1
  800240:	f91ff0ef          	jal	ra,8001d0 <initfd>
  800244:	02054563          	bltz	a0,80026e <umain+0x5a>
  800248:	85a6                	mv	a1,s1
  80024a:	8522                	mv	a0,s0
  80024c:	5de000ef          	jal	ra,80082a <main>
  800250:	ed1ff0ef          	jal	ra,800120 <exit>
  800254:	86aa                	mv	a3,a0
  800256:	00000617          	auipc	a2,0x0
  80025a:	6fa60613          	addi	a2,a2,1786 # 800950 <main+0x126>
  80025e:	45e9                	li	a1,26
  800260:	00000517          	auipc	a0,0x0
  800264:	71050513          	addi	a0,a0,1808 # 800970 <main+0x146>
  800268:	dfbff0ef          	jal	ra,800062 <__warn>
  80026c:	b7e1                	j	800234 <umain+0x20>
  80026e:	86aa                	mv	a3,a0
  800270:	00000617          	auipc	a2,0x0
  800274:	72060613          	addi	a2,a2,1824 # 800990 <main+0x166>
  800278:	45f5                	li	a1,29
  80027a:	00000517          	auipc	a0,0x0
  80027e:	6f650513          	addi	a0,a0,1782 # 800970 <main+0x146>
  800282:	de1ff0ef          	jal	ra,800062 <__warn>
  800286:	b7c9                	j	800248 <umain+0x34>

0000000000800288 <strnlen>:
  800288:	872a                	mv	a4,a0
  80028a:	4501                	li	a0,0
  80028c:	e589                	bnez	a1,800296 <strnlen+0xe>
  80028e:	a811                	j	8002a2 <strnlen+0x1a>
  800290:	0505                	addi	a0,a0,1
  800292:	00a58763          	beq	a1,a0,8002a0 <strnlen+0x18>
  800296:	00a707b3          	add	a5,a4,a0
  80029a:	0007c783          	lbu	a5,0(a5)
  80029e:	fbed                	bnez	a5,800290 <strnlen+0x8>
  8002a0:	8082                	ret
  8002a2:	8082                	ret

00000000008002a4 <memset>:
  8002a4:	ca01                	beqz	a2,8002b4 <memset+0x10>
  8002a6:	962a                	add	a2,a2,a0
  8002a8:	87aa                	mv	a5,a0
  8002aa:	0785                	addi	a5,a5,1
  8002ac:	feb78fa3          	sb	a1,-1(a5)
  8002b0:	fec79de3          	bne	a5,a2,8002aa <memset+0x6>
  8002b4:	8082                	ret

00000000008002b6 <printnum>:
  8002b6:	02071893          	slli	a7,a4,0x20
  8002ba:	7139                	addi	sp,sp,-64
  8002bc:	0208d893          	srli	a7,a7,0x20
  8002c0:	e456                	sd	s5,8(sp)
  8002c2:	0316fab3          	remu	s5,a3,a7
  8002c6:	f822                	sd	s0,48(sp)
  8002c8:	f426                	sd	s1,40(sp)
  8002ca:	f04a                	sd	s2,32(sp)
  8002cc:	ec4e                	sd	s3,24(sp)
  8002ce:	fc06                	sd	ra,56(sp)
  8002d0:	e852                	sd	s4,16(sp)
  8002d2:	84aa                	mv	s1,a0
  8002d4:	89ae                	mv	s3,a1
  8002d6:	8932                	mv	s2,a2
  8002d8:	fff7841b          	addiw	s0,a5,-1
  8002dc:	2a81                	sext.w	s5,s5
  8002de:	0516f163          	bgeu	a3,a7,800320 <printnum+0x6a>
  8002e2:	8a42                	mv	s4,a6
  8002e4:	00805863          	blez	s0,8002f4 <printnum+0x3e>
  8002e8:	347d                	addiw	s0,s0,-1
  8002ea:	864e                	mv	a2,s3
  8002ec:	85ca                	mv	a1,s2
  8002ee:	8552                	mv	a0,s4
  8002f0:	9482                	jalr	s1
  8002f2:	f87d                	bnez	s0,8002e8 <printnum+0x32>
  8002f4:	1a82                	slli	s5,s5,0x20
  8002f6:	020ada93          	srli	s5,s5,0x20
  8002fa:	00000797          	auipc	a5,0x0
  8002fe:	6b678793          	addi	a5,a5,1718 # 8009b0 <main+0x186>
  800302:	7442                	ld	s0,48(sp)
  800304:	9abe                	add	s5,s5,a5
  800306:	000ac503          	lbu	a0,0(s5)
  80030a:	70e2                	ld	ra,56(sp)
  80030c:	6a42                	ld	s4,16(sp)
  80030e:	6aa2                	ld	s5,8(sp)
  800310:	864e                	mv	a2,s3
  800312:	85ca                	mv	a1,s2
  800314:	69e2                	ld	s3,24(sp)
  800316:	7902                	ld	s2,32(sp)
  800318:	8326                	mv	t1,s1
  80031a:	74a2                	ld	s1,40(sp)
  80031c:	6121                	addi	sp,sp,64
  80031e:	8302                	jr	t1
  800320:	0316d6b3          	divu	a3,a3,a7
  800324:	87a2                	mv	a5,s0
  800326:	f91ff0ef          	jal	ra,8002b6 <printnum>
  80032a:	b7e9                	j	8002f4 <printnum+0x3e>

000000000080032c <vprintfmt>:
  80032c:	7119                	addi	sp,sp,-128
  80032e:	f4a6                	sd	s1,104(sp)
  800330:	f0ca                	sd	s2,96(sp)
  800332:	ecce                	sd	s3,88(sp)
  800334:	e8d2                	sd	s4,80(sp)
  800336:	e4d6                	sd	s5,72(sp)
  800338:	e0da                	sd	s6,64(sp)
  80033a:	fc5e                	sd	s7,56(sp)
  80033c:	ec6e                	sd	s11,24(sp)
  80033e:	fc86                	sd	ra,120(sp)
  800340:	f8a2                	sd	s0,112(sp)
  800342:	f862                	sd	s8,48(sp)
  800344:	f466                	sd	s9,40(sp)
  800346:	f06a                	sd	s10,32(sp)
  800348:	89aa                	mv	s3,a0
  80034a:	892e                	mv	s2,a1
  80034c:	84b2                	mv	s1,a2
  80034e:	8db6                	mv	s11,a3
  800350:	8aba                	mv	s5,a4
  800352:	02500a13          	li	s4,37
  800356:	5bfd                	li	s7,-1
  800358:	00000b17          	auipc	s6,0x0
  80035c:	68cb0b13          	addi	s6,s6,1676 # 8009e4 <main+0x1ba>
  800360:	000dc503          	lbu	a0,0(s11)
  800364:	001d8413          	addi	s0,s11,1
  800368:	01450b63          	beq	a0,s4,80037e <vprintfmt+0x52>
  80036c:	c129                	beqz	a0,8003ae <vprintfmt+0x82>
  80036e:	864a                	mv	a2,s2
  800370:	85a6                	mv	a1,s1
  800372:	0405                	addi	s0,s0,1
  800374:	9982                	jalr	s3
  800376:	fff44503          	lbu	a0,-1(s0)
  80037a:	ff4519e3          	bne	a0,s4,80036c <vprintfmt+0x40>
  80037e:	00044583          	lbu	a1,0(s0)
  800382:	02000813          	li	a6,32
  800386:	4d01                	li	s10,0
  800388:	4301                	li	t1,0
  80038a:	5cfd                	li	s9,-1
  80038c:	5c7d                	li	s8,-1
  80038e:	05500513          	li	a0,85
  800392:	48a5                	li	a7,9
  800394:	fdd5861b          	addiw	a2,a1,-35
  800398:	0ff67613          	andi	a2,a2,255
  80039c:	00140d93          	addi	s11,s0,1
  8003a0:	04c56263          	bltu	a0,a2,8003e4 <vprintfmt+0xb8>
  8003a4:	060a                	slli	a2,a2,0x2
  8003a6:	965a                	add	a2,a2,s6
  8003a8:	4214                	lw	a3,0(a2)
  8003aa:	96da                	add	a3,a3,s6
  8003ac:	8682                	jr	a3
  8003ae:	70e6                	ld	ra,120(sp)
  8003b0:	7446                	ld	s0,112(sp)
  8003b2:	74a6                	ld	s1,104(sp)
  8003b4:	7906                	ld	s2,96(sp)
  8003b6:	69e6                	ld	s3,88(sp)
  8003b8:	6a46                	ld	s4,80(sp)
  8003ba:	6aa6                	ld	s5,72(sp)
  8003bc:	6b06                	ld	s6,64(sp)
  8003be:	7be2                	ld	s7,56(sp)
  8003c0:	7c42                	ld	s8,48(sp)
  8003c2:	7ca2                	ld	s9,40(sp)
  8003c4:	7d02                	ld	s10,32(sp)
  8003c6:	6de2                	ld	s11,24(sp)
  8003c8:	6109                	addi	sp,sp,128
  8003ca:	8082                	ret
  8003cc:	882e                	mv	a6,a1
  8003ce:	00144583          	lbu	a1,1(s0)
  8003d2:	846e                	mv	s0,s11
  8003d4:	00140d93          	addi	s11,s0,1
  8003d8:	fdd5861b          	addiw	a2,a1,-35
  8003dc:	0ff67613          	andi	a2,a2,255
  8003e0:	fcc572e3          	bgeu	a0,a2,8003a4 <vprintfmt+0x78>
  8003e4:	864a                	mv	a2,s2
  8003e6:	85a6                	mv	a1,s1
  8003e8:	02500513          	li	a0,37
  8003ec:	9982                	jalr	s3
  8003ee:	fff44783          	lbu	a5,-1(s0)
  8003f2:	8da2                	mv	s11,s0
  8003f4:	f74786e3          	beq	a5,s4,800360 <vprintfmt+0x34>
  8003f8:	ffedc783          	lbu	a5,-2(s11)
  8003fc:	1dfd                	addi	s11,s11,-1
  8003fe:	ff479de3          	bne	a5,s4,8003f8 <vprintfmt+0xcc>
  800402:	bfb9                	j	800360 <vprintfmt+0x34>
  800404:	fd058c9b          	addiw	s9,a1,-48
  800408:	00144583          	lbu	a1,1(s0)
  80040c:	846e                	mv	s0,s11
  80040e:	fd05869b          	addiw	a3,a1,-48
  800412:	0005861b          	sext.w	a2,a1
  800416:	02d8e463          	bltu	a7,a3,80043e <vprintfmt+0x112>
  80041a:	00144583          	lbu	a1,1(s0)
  80041e:	002c969b          	slliw	a3,s9,0x2
  800422:	0196873b          	addw	a4,a3,s9
  800426:	0017171b          	slliw	a4,a4,0x1
  80042a:	9f31                	addw	a4,a4,a2
  80042c:	fd05869b          	addiw	a3,a1,-48
  800430:	0405                	addi	s0,s0,1
  800432:	fd070c9b          	addiw	s9,a4,-48
  800436:	0005861b          	sext.w	a2,a1
  80043a:	fed8f0e3          	bgeu	a7,a3,80041a <vprintfmt+0xee>
  80043e:	f40c5be3          	bgez	s8,800394 <vprintfmt+0x68>
  800442:	8c66                	mv	s8,s9
  800444:	5cfd                	li	s9,-1
  800446:	b7b9                	j	800394 <vprintfmt+0x68>
  800448:	fffc4693          	not	a3,s8
  80044c:	96fd                	srai	a3,a3,0x3f
  80044e:	00dc77b3          	and	a5,s8,a3
  800452:	00144583          	lbu	a1,1(s0)
  800456:	00078c1b          	sext.w	s8,a5
  80045a:	846e                	mv	s0,s11
  80045c:	bf25                	j	800394 <vprintfmt+0x68>
  80045e:	000aac83          	lw	s9,0(s5)
  800462:	00144583          	lbu	a1,1(s0)
  800466:	0aa1                	addi	s5,s5,8
  800468:	846e                	mv	s0,s11
  80046a:	bfd1                	j	80043e <vprintfmt+0x112>
  80046c:	4705                	li	a4,1
  80046e:	008a8613          	addi	a2,s5,8
  800472:	00674463          	blt	a4,t1,80047a <vprintfmt+0x14e>
  800476:	1c030c63          	beqz	t1,80064e <vprintfmt+0x322>
  80047a:	000ab683          	ld	a3,0(s5)
  80047e:	4741                	li	a4,16
  800480:	8ab2                	mv	s5,a2
  800482:	2801                	sext.w	a6,a6
  800484:	87e2                	mv	a5,s8
  800486:	8626                	mv	a2,s1
  800488:	85ca                	mv	a1,s2
  80048a:	854e                	mv	a0,s3
  80048c:	e2bff0ef          	jal	ra,8002b6 <printnum>
  800490:	bdc1                	j	800360 <vprintfmt+0x34>
  800492:	000aa503          	lw	a0,0(s5)
  800496:	864a                	mv	a2,s2
  800498:	85a6                	mv	a1,s1
  80049a:	0aa1                	addi	s5,s5,8
  80049c:	9982                	jalr	s3
  80049e:	b5c9                	j	800360 <vprintfmt+0x34>
  8004a0:	4705                	li	a4,1
  8004a2:	008a8613          	addi	a2,s5,8
  8004a6:	00674463          	blt	a4,t1,8004ae <vprintfmt+0x182>
  8004aa:	18030d63          	beqz	t1,800644 <vprintfmt+0x318>
  8004ae:	000ab683          	ld	a3,0(s5)
  8004b2:	4729                	li	a4,10
  8004b4:	8ab2                	mv	s5,a2
  8004b6:	b7f1                	j	800482 <vprintfmt+0x156>
  8004b8:	00144583          	lbu	a1,1(s0)
  8004bc:	4d05                	li	s10,1
  8004be:	846e                	mv	s0,s11
  8004c0:	bdd1                	j	800394 <vprintfmt+0x68>
  8004c2:	864a                	mv	a2,s2
  8004c4:	85a6                	mv	a1,s1
  8004c6:	02500513          	li	a0,37
  8004ca:	9982                	jalr	s3
  8004cc:	bd51                	j	800360 <vprintfmt+0x34>
  8004ce:	00144583          	lbu	a1,1(s0)
  8004d2:	2305                	addiw	t1,t1,1
  8004d4:	846e                	mv	s0,s11
  8004d6:	bd7d                	j	800394 <vprintfmt+0x68>
  8004d8:	4705                	li	a4,1
  8004da:	008a8613          	addi	a2,s5,8
  8004de:	00674463          	blt	a4,t1,8004e6 <vprintfmt+0x1ba>
  8004e2:	14030c63          	beqz	t1,80063a <vprintfmt+0x30e>
  8004e6:	000ab683          	ld	a3,0(s5)
  8004ea:	4721                	li	a4,8
  8004ec:	8ab2                	mv	s5,a2
  8004ee:	bf51                	j	800482 <vprintfmt+0x156>
  8004f0:	03000513          	li	a0,48
  8004f4:	864a                	mv	a2,s2
  8004f6:	85a6                	mv	a1,s1
  8004f8:	e042                	sd	a6,0(sp)
  8004fa:	9982                	jalr	s3
  8004fc:	864a                	mv	a2,s2
  8004fe:	85a6                	mv	a1,s1
  800500:	07800513          	li	a0,120
  800504:	9982                	jalr	s3
  800506:	0aa1                	addi	s5,s5,8
  800508:	6802                	ld	a6,0(sp)
  80050a:	4741                	li	a4,16
  80050c:	ff8ab683          	ld	a3,-8(s5)
  800510:	bf8d                	j	800482 <vprintfmt+0x156>
  800512:	000ab403          	ld	s0,0(s5)
  800516:	008a8793          	addi	a5,s5,8
  80051a:	e03e                	sd	a5,0(sp)
  80051c:	14040c63          	beqz	s0,800674 <vprintfmt+0x348>
  800520:	11805063          	blez	s8,800620 <vprintfmt+0x2f4>
  800524:	02d00693          	li	a3,45
  800528:	0cd81963          	bne	a6,a3,8005fa <vprintfmt+0x2ce>
  80052c:	00044683          	lbu	a3,0(s0)
  800530:	0006851b          	sext.w	a0,a3
  800534:	ce8d                	beqz	a3,80056e <vprintfmt+0x242>
  800536:	00140a93          	addi	s5,s0,1
  80053a:	05e00413          	li	s0,94
  80053e:	000cc563          	bltz	s9,800548 <vprintfmt+0x21c>
  800542:	3cfd                	addiw	s9,s9,-1
  800544:	037c8363          	beq	s9,s7,80056a <vprintfmt+0x23e>
  800548:	864a                	mv	a2,s2
  80054a:	85a6                	mv	a1,s1
  80054c:	100d0663          	beqz	s10,800658 <vprintfmt+0x32c>
  800550:	3681                	addiw	a3,a3,-32
  800552:	10d47363          	bgeu	s0,a3,800658 <vprintfmt+0x32c>
  800556:	03f00513          	li	a0,63
  80055a:	9982                	jalr	s3
  80055c:	000ac683          	lbu	a3,0(s5)
  800560:	3c7d                	addiw	s8,s8,-1
  800562:	0a85                	addi	s5,s5,1
  800564:	0006851b          	sext.w	a0,a3
  800568:	faf9                	bnez	a3,80053e <vprintfmt+0x212>
  80056a:	01805a63          	blez	s8,80057e <vprintfmt+0x252>
  80056e:	3c7d                	addiw	s8,s8,-1
  800570:	864a                	mv	a2,s2
  800572:	85a6                	mv	a1,s1
  800574:	02000513          	li	a0,32
  800578:	9982                	jalr	s3
  80057a:	fe0c1ae3          	bnez	s8,80056e <vprintfmt+0x242>
  80057e:	6a82                	ld	s5,0(sp)
  800580:	b3c5                	j	800360 <vprintfmt+0x34>
  800582:	4705                	li	a4,1
  800584:	008a8d13          	addi	s10,s5,8
  800588:	00674463          	blt	a4,t1,800590 <vprintfmt+0x264>
  80058c:	0a030463          	beqz	t1,800634 <vprintfmt+0x308>
  800590:	000ab403          	ld	s0,0(s5)
  800594:	0c044463          	bltz	s0,80065c <vprintfmt+0x330>
  800598:	86a2                	mv	a3,s0
  80059a:	8aea                	mv	s5,s10
  80059c:	4729                	li	a4,10
  80059e:	b5d5                	j	800482 <vprintfmt+0x156>
  8005a0:	000aa783          	lw	a5,0(s5)
  8005a4:	46e1                	li	a3,24
  8005a6:	0aa1                	addi	s5,s5,8
  8005a8:	41f7d71b          	sraiw	a4,a5,0x1f
  8005ac:	8fb9                	xor	a5,a5,a4
  8005ae:	40e7873b          	subw	a4,a5,a4
  8005b2:	02e6c663          	blt	a3,a4,8005de <vprintfmt+0x2b2>
  8005b6:	00371793          	slli	a5,a4,0x3
  8005ba:	00000697          	auipc	a3,0x0
  8005be:	75e68693          	addi	a3,a3,1886 # 800d18 <error_string>
  8005c2:	97b6                	add	a5,a5,a3
  8005c4:	639c                	ld	a5,0(a5)
  8005c6:	cf81                	beqz	a5,8005de <vprintfmt+0x2b2>
  8005c8:	873e                	mv	a4,a5
  8005ca:	00000697          	auipc	a3,0x0
  8005ce:	41668693          	addi	a3,a3,1046 # 8009e0 <main+0x1b6>
  8005d2:	8626                	mv	a2,s1
  8005d4:	85ca                	mv	a1,s2
  8005d6:	854e                	mv	a0,s3
  8005d8:	0d4000ef          	jal	ra,8006ac <printfmt>
  8005dc:	b351                	j	800360 <vprintfmt+0x34>
  8005de:	00000697          	auipc	a3,0x0
  8005e2:	3f268693          	addi	a3,a3,1010 # 8009d0 <main+0x1a6>
  8005e6:	8626                	mv	a2,s1
  8005e8:	85ca                	mv	a1,s2
  8005ea:	854e                	mv	a0,s3
  8005ec:	0c0000ef          	jal	ra,8006ac <printfmt>
  8005f0:	bb85                	j	800360 <vprintfmt+0x34>
  8005f2:	00000417          	auipc	s0,0x0
  8005f6:	3d640413          	addi	s0,s0,982 # 8009c8 <main+0x19e>
  8005fa:	85e6                	mv	a1,s9
  8005fc:	8522                	mv	a0,s0
  8005fe:	e442                	sd	a6,8(sp)
  800600:	c89ff0ef          	jal	ra,800288 <strnlen>
  800604:	40ac0c3b          	subw	s8,s8,a0
  800608:	01805c63          	blez	s8,800620 <vprintfmt+0x2f4>
  80060c:	6822                	ld	a6,8(sp)
  80060e:	00080a9b          	sext.w	s5,a6
  800612:	3c7d                	addiw	s8,s8,-1
  800614:	864a                	mv	a2,s2
  800616:	85a6                	mv	a1,s1
  800618:	8556                	mv	a0,s5
  80061a:	9982                	jalr	s3
  80061c:	fe0c1be3          	bnez	s8,800612 <vprintfmt+0x2e6>
  800620:	00044683          	lbu	a3,0(s0)
  800624:	00140a93          	addi	s5,s0,1
  800628:	0006851b          	sext.w	a0,a3
  80062c:	daa9                	beqz	a3,80057e <vprintfmt+0x252>
  80062e:	05e00413          	li	s0,94
  800632:	b731                	j	80053e <vprintfmt+0x212>
  800634:	000aa403          	lw	s0,0(s5)
  800638:	bfb1                	j	800594 <vprintfmt+0x268>
  80063a:	000ae683          	lwu	a3,0(s5)
  80063e:	4721                	li	a4,8
  800640:	8ab2                	mv	s5,a2
  800642:	b581                	j	800482 <vprintfmt+0x156>
  800644:	000ae683          	lwu	a3,0(s5)
  800648:	4729                	li	a4,10
  80064a:	8ab2                	mv	s5,a2
  80064c:	bd1d                	j	800482 <vprintfmt+0x156>
  80064e:	000ae683          	lwu	a3,0(s5)
  800652:	4741                	li	a4,16
  800654:	8ab2                	mv	s5,a2
  800656:	b535                	j	800482 <vprintfmt+0x156>
  800658:	9982                	jalr	s3
  80065a:	b709                	j	80055c <vprintfmt+0x230>
  80065c:	864a                	mv	a2,s2
  80065e:	85a6                	mv	a1,s1
  800660:	02d00513          	li	a0,45
  800664:	e042                	sd	a6,0(sp)
  800666:	9982                	jalr	s3
  800668:	6802                	ld	a6,0(sp)
  80066a:	8aea                	mv	s5,s10
  80066c:	408006b3          	neg	a3,s0
  800670:	4729                	li	a4,10
  800672:	bd01                	j	800482 <vprintfmt+0x156>
  800674:	03805163          	blez	s8,800696 <vprintfmt+0x36a>
  800678:	02d00693          	li	a3,45
  80067c:	f6d81be3          	bne	a6,a3,8005f2 <vprintfmt+0x2c6>
  800680:	00000417          	auipc	s0,0x0
  800684:	34840413          	addi	s0,s0,840 # 8009c8 <main+0x19e>
  800688:	02800693          	li	a3,40
  80068c:	02800513          	li	a0,40
  800690:	00140a93          	addi	s5,s0,1
  800694:	b55d                	j	80053a <vprintfmt+0x20e>
  800696:	00000a97          	auipc	s5,0x0
  80069a:	333a8a93          	addi	s5,s5,819 # 8009c9 <main+0x19f>
  80069e:	02800513          	li	a0,40
  8006a2:	02800693          	li	a3,40
  8006a6:	05e00413          	li	s0,94
  8006aa:	bd51                	j	80053e <vprintfmt+0x212>

00000000008006ac <printfmt>:
  8006ac:	7139                	addi	sp,sp,-64
  8006ae:	02010313          	addi	t1,sp,32
  8006b2:	f03a                	sd	a4,32(sp)
  8006b4:	871a                	mv	a4,t1
  8006b6:	ec06                	sd	ra,24(sp)
  8006b8:	f43e                	sd	a5,40(sp)
  8006ba:	f842                	sd	a6,48(sp)
  8006bc:	fc46                	sd	a7,56(sp)
  8006be:	e41a                	sd	t1,8(sp)
  8006c0:	c6dff0ef          	jal	ra,80032c <vprintfmt>
  8006c4:	60e2                	ld	ra,24(sp)
  8006c6:	6121                	addi	sp,sp,64
  8006c8:	8082                	ret

00000000008006ca <rand>:
  8006ca:	00001697          	auipc	a3,0x1
  8006ce:	93668693          	addi	a3,a3,-1738 # 801000 <next>
  8006d2:	629c                	ld	a5,0(a3)
  8006d4:	00000717          	auipc	a4,0x0
  8006d8:	78c73703          	ld	a4,1932(a4) # 800e60 <error_string+0x148>
  8006dc:	02e787b3          	mul	a5,a5,a4
  8006e0:	80000737          	lui	a4,0x80000
  8006e4:	fff74713          	not	a4,a4
  8006e8:	07ad                	addi	a5,a5,11
  8006ea:	07c2                	slli	a5,a5,0x10
  8006ec:	83c1                	srli	a5,a5,0x10
  8006ee:	00c7d513          	srli	a0,a5,0xc
  8006f2:	02e57533          	remu	a0,a0,a4
  8006f6:	e29c                	sd	a5,0(a3)
  8006f8:	2505                	addiw	a0,a0,1
  8006fa:	8082                	ret

00000000008006fc <srand>:
  8006fc:	1502                	slli	a0,a0,0x20
  8006fe:	9101                	srli	a0,a0,0x20
  800700:	00001797          	auipc	a5,0x1
  800704:	90a7b023          	sd	a0,-1792(a5) # 801000 <next>
  800708:	8082                	ret

000000000080070a <work>:
  80070a:	7179                	addi	sp,sp,-48
  80070c:	ec26                	sd	s1,24(sp)
  80070e:	00001497          	auipc	s1,0x1
  800712:	8fa48493          	addi	s1,s1,-1798 # 801008 <mata>
  800716:	f022                	sd	s0,32(sp)
  800718:	e84a                	sd	s2,16(sp)
  80071a:	e44e                	sd	s3,8(sp)
  80071c:	f406                	sd	ra,40(sp)
  80071e:	89aa                	mv	s3,a0
  800720:	00001917          	auipc	s2,0x1
  800724:	a7890913          	addi	s2,s2,-1416 # 801198 <matb>
  800728:	00001597          	auipc	a1,0x1
  80072c:	a9858593          	addi	a1,a1,-1384 # 8011c0 <matb+0x28>
  800730:	00001417          	auipc	s0,0x1
  800734:	c2040413          	addi	s0,s0,-992 # 801350 <matc+0x28>
  800738:	8626                	mv	a2,s1
  80073a:	4685                	li	a3,1
  80073c:	fd858793          	addi	a5,a1,-40
  800740:	8732                	mv	a4,a2
  800742:	c394                	sw	a3,0(a5)
  800744:	c314                	sw	a3,0(a4)
  800746:	0791                	addi	a5,a5,4
  800748:	0711                	addi	a4,a4,4
  80074a:	feb79ce3          	bne	a5,a1,800742 <work+0x38>
  80074e:	02878593          	addi	a1,a5,40
  800752:	02860613          	addi	a2,a2,40
  800756:	fe8593e3          	bne	a1,s0,80073c <work+0x32>
  80075a:	9e5ff0ef          	jal	ra,80013e <yield>
  80075e:	9e5ff0ef          	jal	ra,800142 <getpid>
  800762:	85aa                	mv	a1,a0
  800764:	864e                	mv	a2,s3
  800766:	00000517          	auipc	a0,0x0
  80076a:	67a50513          	addi	a0,a0,1658 # 800de0 <error_string+0xc8>
  80076e:	a27ff0ef          	jal	ra,800194 <cprintf>
  800772:	fff9839b          	addiw	t2,s3,-1
  800776:	00001297          	auipc	t0,0x1
  80077a:	d4228293          	addi	t0,t0,-702 # 8014b8 <matc+0x190>
  80077e:	00001f97          	auipc	t6,0x1
  800782:	a1af8f93          	addi	t6,t6,-1510 # 801198 <matb>
  800786:	00001f17          	auipc	t5,0x1
  80078a:	ba2f0f13          	addi	t5,t5,-1118 # 801328 <matc>
  80078e:	02800e13          	li	t3,40
  800792:	50fd                	li	ra,-1
  800794:	06098f63          	beqz	s3,800812 <work+0x108>
  800798:	00001897          	auipc	a7,0x1
  80079c:	b9088893          	addi	a7,a7,-1136 # 801328 <matc>
  8007a0:	8ec6                	mv	t4,a7
  8007a2:	8326                	mv	t1,s1
  8007a4:	857a                	mv	a0,t5
  8007a6:	8876                	mv	a6,t4
  8007a8:	e7050793          	addi	a5,a0,-400
  8007ac:	869a                	mv	a3,t1
  8007ae:	4601                	li	a2,0
  8007b0:	4298                	lw	a4,0(a3)
  8007b2:	438c                	lw	a1,0(a5)
  8007b4:	02878793          	addi	a5,a5,40
  8007b8:	0691                	addi	a3,a3,4
  8007ba:	02b7073b          	mulw	a4,a4,a1
  8007be:	9e39                	addw	a2,a2,a4
  8007c0:	fea798e3          	bne	a5,a0,8007b0 <work+0xa6>
  8007c4:	00c82023          	sw	a2,0(a6)
  8007c8:	00478513          	addi	a0,a5,4
  8007cc:	0811                	addi	a6,a6,4
  8007ce:	fc851de3          	bne	a0,s0,8007a8 <work+0x9e>
  8007d2:	02830313          	addi	t1,t1,40
  8007d6:	028e8e93          	addi	t4,t4,40
  8007da:	fc6f95e3          	bne	t6,t1,8007a4 <work+0x9a>
  8007de:	8526                	mv	a0,s1
  8007e0:	85ca                	mv	a1,s2
  8007e2:	4781                	li	a5,0
  8007e4:	00f88733          	add	a4,a7,a5
  8007e8:	4318                	lw	a4,0(a4)
  8007ea:	00f58633          	add	a2,a1,a5
  8007ee:	00f506b3          	add	a3,a0,a5
  8007f2:	c218                	sw	a4,0(a2)
  8007f4:	c298                	sw	a4,0(a3)
  8007f6:	0791                	addi	a5,a5,4
  8007f8:	ffc796e3          	bne	a5,t3,8007e4 <work+0xda>
  8007fc:	02888893          	addi	a7,a7,40
  800800:	02858593          	addi	a1,a1,40
  800804:	02850513          	addi	a0,a0,40
  800808:	fc589de3          	bne	a7,t0,8007e2 <work+0xd8>
  80080c:	33fd                	addiw	t2,t2,-1
  80080e:	f81395e3          	bne	t2,ra,800798 <work+0x8e>
  800812:	931ff0ef          	jal	ra,800142 <getpid>
  800816:	85aa                	mv	a1,a0
  800818:	00000517          	auipc	a0,0x0
  80081c:	5e850513          	addi	a0,a0,1512 # 800e00 <error_string+0xe8>
  800820:	975ff0ef          	jal	ra,800194 <cprintf>
  800824:	4501                	li	a0,0
  800826:	8fbff0ef          	jal	ra,800120 <exit>

000000000080082a <main>:
  80082a:	7175                	addi	sp,sp,-144
  80082c:	f4ce                	sd	s3,104(sp)
  80082e:	05400613          	li	a2,84
  800832:	4581                	li	a1,0
  800834:	0028                	addi	a0,sp,8
  800836:	00810993          	addi	s3,sp,8
  80083a:	e122                	sd	s0,128(sp)
  80083c:	fca6                	sd	s1,120(sp)
  80083e:	f8ca                	sd	s2,112(sp)
  800840:	e506                	sd	ra,136(sp)
  800842:	84ce                	mv	s1,s3
  800844:	a61ff0ef          	jal	ra,8002a4 <memset>
  800848:	4401                	li	s0,0
  80084a:	4955                	li	s2,21
  80084c:	8ebff0ef          	jal	ra,800136 <fork>
  800850:	c088                	sw	a0,0(s1)
  800852:	cd2d                	beqz	a0,8008cc <main+0xa2>
  800854:	04054663          	bltz	a0,8008a0 <main+0x76>
  800858:	2405                	addiw	s0,s0,1
  80085a:	0491                	addi	s1,s1,4
  80085c:	ff2418e3          	bne	s0,s2,80084c <main+0x22>
  800860:	00000517          	auipc	a0,0x0
  800864:	5b050513          	addi	a0,a0,1456 # 800e10 <error_string+0xf8>
  800868:	92dff0ef          	jal	ra,800194 <cprintf>
  80086c:	4455                	li	s0,21
  80086e:	8cbff0ef          	jal	ra,800138 <wait>
  800872:	e10d                	bnez	a0,800894 <main+0x6a>
  800874:	347d                	addiw	s0,s0,-1
  800876:	fc65                	bnez	s0,80086e <main+0x44>
  800878:	00000517          	auipc	a0,0x0
  80087c:	5b850513          	addi	a0,a0,1464 # 800e30 <error_string+0x118>
  800880:	915ff0ef          	jal	ra,800194 <cprintf>
  800884:	60aa                	ld	ra,136(sp)
  800886:	640a                	ld	s0,128(sp)
  800888:	74e6                	ld	s1,120(sp)
  80088a:	7946                	ld	s2,112(sp)
  80088c:	79a6                	ld	s3,104(sp)
  80088e:	4501                	li	a0,0
  800890:	6149                	addi	sp,sp,144
  800892:	8082                	ret
  800894:	00000517          	auipc	a0,0x0
  800898:	58c50513          	addi	a0,a0,1420 # 800e20 <error_string+0x108>
  80089c:	8f9ff0ef          	jal	ra,800194 <cprintf>
  8008a0:	08e0                	addi	s0,sp,92
  8008a2:	0009a503          	lw	a0,0(s3)
  8008a6:	00a05463          	blez	a0,8008ae <main+0x84>
  8008aa:	897ff0ef          	jal	ra,800140 <kill>
  8008ae:	0991                	addi	s3,s3,4
  8008b0:	fe8999e3          	bne	s3,s0,8008a2 <main+0x78>
  8008b4:	00000617          	auipc	a2,0x0
  8008b8:	58c60613          	addi	a2,a2,1420 # 800e40 <error_string+0x128>
  8008bc:	05200593          	li	a1,82
  8008c0:	00000517          	auipc	a0,0x0
  8008c4:	59050513          	addi	a0,a0,1424 # 800e50 <error_string+0x138>
  8008c8:	f58ff0ef          	jal	ra,800020 <__panic>
  8008cc:	0284053b          	mulw	a0,s0,s0
  8008d0:	e2dff0ef          	jal	ra,8006fc <srand>
  8008d4:	df7ff0ef          	jal	ra,8006ca <rand>
  8008d8:	47d5                	li	a5,21
  8008da:	02f577bb          	remuw	a5,a0,a5
  8008de:	06400513          	li	a0,100
  8008e2:	02f787bb          	mulw	a5,a5,a5
  8008e6:	27a9                	addiw	a5,a5,10
  8008e8:	02f5053b          	mulw	a0,a0,a5
  8008ec:	e1fff0ef          	jal	ra,80070a <work>
