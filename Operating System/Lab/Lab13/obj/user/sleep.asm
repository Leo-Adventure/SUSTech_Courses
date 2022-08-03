
obj/__user_sleep.out:     file format elf64-littleriscv


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
  800030:	00000517          	auipc	a0,0x0
  800034:	72850513          	addi	a0,a0,1832 # 800758 <main+0x70>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	14a000ef          	jal	ra,80018e <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	11c000ef          	jal	ra,800168 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	78050513          	addi	a0,a0,1920 # 8007d0 <main+0xe8>
  800058:	136000ef          	jal	ra,80018e <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0be000ef          	jal	ra,80011c <exit>

0000000000800062 <__warn>:
  800062:	715d                	addi	sp,sp,-80
  800064:	832e                	mv	t1,a1
  800066:	e822                	sd	s0,16(sp)
  800068:	85aa                	mv	a1,a0
  80006a:	8432                	mv	s0,a2
  80006c:	fc3e                	sd	a5,56(sp)
  80006e:	861a                	mv	a2,t1
  800070:	103c                	addi	a5,sp,40
  800072:	00000517          	auipc	a0,0x0
  800076:	70650513          	addi	a0,a0,1798 # 800778 <main+0x90>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	108000ef          	jal	ra,80018e <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0da000ef          	jal	ra,800168 <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	73e50513          	addi	a0,a0,1854 # 8007d0 <main+0xe8>
  80009a:	0f4000ef          	jal	ra,80018e <cprintf>
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

00000000008000f0 <sys_putc>:
  8000f0:	85aa                	mv	a1,a0
  8000f2:	4579                	li	a0,30
  8000f4:	bf4d                	j	8000a6 <syscall>

00000000008000f6 <sys_sleep>:
  8000f6:	85aa                	mv	a1,a0
  8000f8:	452d                	li	a0,11
  8000fa:	b775                	j	8000a6 <syscall>

00000000008000fc <sys_gettime>:
  8000fc:	4545                	li	a0,17
  8000fe:	b765                	j	8000a6 <syscall>

0000000000800100 <sys_open>:
  800100:	862e                	mv	a2,a1
  800102:	85aa                	mv	a1,a0
  800104:	06400513          	li	a0,100
  800108:	bf79                	j	8000a6 <syscall>

000000000080010a <sys_close>:
  80010a:	85aa                	mv	a1,a0
  80010c:	06500513          	li	a0,101
  800110:	bf59                	j	8000a6 <syscall>

0000000000800112 <sys_dup>:
  800112:	862e                	mv	a2,a1
  800114:	85aa                	mv	a1,a0
  800116:	08200513          	li	a0,130
  80011a:	b771                	j	8000a6 <syscall>

000000000080011c <exit>:
  80011c:	1141                	addi	sp,sp,-16
  80011e:	e406                	sd	ra,8(sp)
  800120:	fbfff0ef          	jal	ra,8000de <sys_exit>
  800124:	00000517          	auipc	a0,0x0
  800128:	67450513          	addi	a0,a0,1652 # 800798 <main+0xb0>
  80012c:	062000ef          	jal	ra,80018e <cprintf>
  800130:	a001                	j	800130 <exit+0x14>

0000000000800132 <fork>:
  800132:	bf4d                	j	8000e4 <sys_fork>

0000000000800134 <waitpid>:
  800134:	bf55                	j	8000e8 <sys_wait>

0000000000800136 <gettime_msec>:
  800136:	b7d9                	j	8000fc <sys_gettime>

0000000000800138 <sleep>:
  800138:	1502                	slli	a0,a0,0x20
  80013a:	9101                	srli	a0,a0,0x20
  80013c:	bf6d                	j	8000f6 <sys_sleep>

000000000080013e <_start>:
  80013e:	0d0000ef          	jal	ra,80020e <umain>
  800142:	a001                	j	800142 <_start+0x4>

0000000000800144 <open>:
  800144:	1582                	slli	a1,a1,0x20
  800146:	9181                	srli	a1,a1,0x20
  800148:	bf65                	j	800100 <sys_open>

000000000080014a <close>:
  80014a:	b7c1                	j	80010a <sys_close>

000000000080014c <dup2>:
  80014c:	b7d9                	j	800112 <sys_dup>

000000000080014e <cputch>:
  80014e:	1141                	addi	sp,sp,-16
  800150:	e022                	sd	s0,0(sp)
  800152:	e406                	sd	ra,8(sp)
  800154:	842e                	mv	s0,a1
  800156:	f9bff0ef          	jal	ra,8000f0 <sys_putc>
  80015a:	401c                	lw	a5,0(s0)
  80015c:	60a2                	ld	ra,8(sp)
  80015e:	2785                	addiw	a5,a5,1
  800160:	c01c                	sw	a5,0(s0)
  800162:	6402                	ld	s0,0(sp)
  800164:	0141                	addi	sp,sp,16
  800166:	8082                	ret

0000000000800168 <vcprintf>:
  800168:	1101                	addi	sp,sp,-32
  80016a:	872e                	mv	a4,a1
  80016c:	75dd                	lui	a1,0xffff7
  80016e:	86aa                	mv	a3,a0
  800170:	0070                	addi	a2,sp,12
  800172:	00000517          	auipc	a0,0x0
  800176:	fdc50513          	addi	a0,a0,-36 # 80014e <cputch>
  80017a:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f59>
  80017e:	ec06                	sd	ra,24(sp)
  800180:	c602                	sw	zero,12(sp)
  800182:	192000ef          	jal	ra,800314 <vprintfmt>
  800186:	60e2                	ld	ra,24(sp)
  800188:	4532                	lw	a0,12(sp)
  80018a:	6105                	addi	sp,sp,32
  80018c:	8082                	ret

000000000080018e <cprintf>:
  80018e:	711d                	addi	sp,sp,-96
  800190:	02810313          	addi	t1,sp,40
  800194:	8e2a                	mv	t3,a0
  800196:	f42e                	sd	a1,40(sp)
  800198:	75dd                	lui	a1,0xffff7
  80019a:	f832                	sd	a2,48(sp)
  80019c:	fc36                	sd	a3,56(sp)
  80019e:	e0ba                	sd	a4,64(sp)
  8001a0:	00000517          	auipc	a0,0x0
  8001a4:	fae50513          	addi	a0,a0,-82 # 80014e <cputch>
  8001a8:	0050                	addi	a2,sp,4
  8001aa:	871a                	mv	a4,t1
  8001ac:	86f2                	mv	a3,t3
  8001ae:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f59>
  8001b2:	ec06                	sd	ra,24(sp)
  8001b4:	e4be                	sd	a5,72(sp)
  8001b6:	e8c2                	sd	a6,80(sp)
  8001b8:	ecc6                	sd	a7,88(sp)
  8001ba:	e41a                	sd	t1,8(sp)
  8001bc:	c202                	sw	zero,4(sp)
  8001be:	156000ef          	jal	ra,800314 <vprintfmt>
  8001c2:	60e2                	ld	ra,24(sp)
  8001c4:	4512                	lw	a0,4(sp)
  8001c6:	6125                	addi	sp,sp,96
  8001c8:	8082                	ret

00000000008001ca <initfd>:
  8001ca:	1101                	addi	sp,sp,-32
  8001cc:	87ae                	mv	a5,a1
  8001ce:	e426                	sd	s1,8(sp)
  8001d0:	85b2                	mv	a1,a2
  8001d2:	84aa                	mv	s1,a0
  8001d4:	853e                	mv	a0,a5
  8001d6:	e822                	sd	s0,16(sp)
  8001d8:	ec06                	sd	ra,24(sp)
  8001da:	f6bff0ef          	jal	ra,800144 <open>
  8001de:	842a                	mv	s0,a0
  8001e0:	00054463          	bltz	a0,8001e8 <initfd+0x1e>
  8001e4:	00951863          	bne	a0,s1,8001f4 <initfd+0x2a>
  8001e8:	60e2                	ld	ra,24(sp)
  8001ea:	8522                	mv	a0,s0
  8001ec:	6442                	ld	s0,16(sp)
  8001ee:	64a2                	ld	s1,8(sp)
  8001f0:	6105                	addi	sp,sp,32
  8001f2:	8082                	ret
  8001f4:	8526                	mv	a0,s1
  8001f6:	f55ff0ef          	jal	ra,80014a <close>
  8001fa:	85a6                	mv	a1,s1
  8001fc:	8522                	mv	a0,s0
  8001fe:	f4fff0ef          	jal	ra,80014c <dup2>
  800202:	84aa                	mv	s1,a0
  800204:	8522                	mv	a0,s0
  800206:	f45ff0ef          	jal	ra,80014a <close>
  80020a:	8426                	mv	s0,s1
  80020c:	bff1                	j	8001e8 <initfd+0x1e>

000000000080020e <umain>:
  80020e:	1101                	addi	sp,sp,-32
  800210:	e822                	sd	s0,16(sp)
  800212:	e426                	sd	s1,8(sp)
  800214:	842a                	mv	s0,a0
  800216:	84ae                	mv	s1,a1
  800218:	4601                	li	a2,0
  80021a:	00000597          	auipc	a1,0x0
  80021e:	59658593          	addi	a1,a1,1430 # 8007b0 <main+0xc8>
  800222:	4501                	li	a0,0
  800224:	ec06                	sd	ra,24(sp)
  800226:	fa5ff0ef          	jal	ra,8001ca <initfd>
  80022a:	02054263          	bltz	a0,80024e <umain+0x40>
  80022e:	4605                	li	a2,1
  800230:	00000597          	auipc	a1,0x0
  800234:	5c058593          	addi	a1,a1,1472 # 8007f0 <main+0x108>
  800238:	4505                	li	a0,1
  80023a:	f91ff0ef          	jal	ra,8001ca <initfd>
  80023e:	02054563          	bltz	a0,800268 <umain+0x5a>
  800242:	85a6                	mv	a1,s1
  800244:	8522                	mv	a0,s0
  800246:	4a2000ef          	jal	ra,8006e8 <main>
  80024a:	ed3ff0ef          	jal	ra,80011c <exit>
  80024e:	86aa                	mv	a3,a0
  800250:	00000617          	auipc	a2,0x0
  800254:	56860613          	addi	a2,a2,1384 # 8007b8 <main+0xd0>
  800258:	45e9                	li	a1,26
  80025a:	00000517          	auipc	a0,0x0
  80025e:	57e50513          	addi	a0,a0,1406 # 8007d8 <main+0xf0>
  800262:	e01ff0ef          	jal	ra,800062 <__warn>
  800266:	b7e1                	j	80022e <umain+0x20>
  800268:	86aa                	mv	a3,a0
  80026a:	00000617          	auipc	a2,0x0
  80026e:	58e60613          	addi	a2,a2,1422 # 8007f8 <main+0x110>
  800272:	45f5                	li	a1,29
  800274:	00000517          	auipc	a0,0x0
  800278:	56450513          	addi	a0,a0,1380 # 8007d8 <main+0xf0>
  80027c:	de7ff0ef          	jal	ra,800062 <__warn>
  800280:	b7c9                	j	800242 <umain+0x34>

0000000000800282 <strnlen>:
  800282:	872a                	mv	a4,a0
  800284:	4501                	li	a0,0
  800286:	e589                	bnez	a1,800290 <strnlen+0xe>
  800288:	a811                	j	80029c <strnlen+0x1a>
  80028a:	0505                	addi	a0,a0,1
  80028c:	00a58763          	beq	a1,a0,80029a <strnlen+0x18>
  800290:	00a707b3          	add	a5,a4,a0
  800294:	0007c783          	lbu	a5,0(a5)
  800298:	fbed                	bnez	a5,80028a <strnlen+0x8>
  80029a:	8082                	ret
  80029c:	8082                	ret

000000000080029e <printnum>:
  80029e:	02071893          	slli	a7,a4,0x20
  8002a2:	7139                	addi	sp,sp,-64
  8002a4:	0208d893          	srli	a7,a7,0x20
  8002a8:	e456                	sd	s5,8(sp)
  8002aa:	0316fab3          	remu	s5,a3,a7
  8002ae:	f822                	sd	s0,48(sp)
  8002b0:	f426                	sd	s1,40(sp)
  8002b2:	f04a                	sd	s2,32(sp)
  8002b4:	ec4e                	sd	s3,24(sp)
  8002b6:	fc06                	sd	ra,56(sp)
  8002b8:	e852                	sd	s4,16(sp)
  8002ba:	84aa                	mv	s1,a0
  8002bc:	89ae                	mv	s3,a1
  8002be:	8932                	mv	s2,a2
  8002c0:	fff7841b          	addiw	s0,a5,-1
  8002c4:	2a81                	sext.w	s5,s5
  8002c6:	0516f163          	bgeu	a3,a7,800308 <printnum+0x6a>
  8002ca:	8a42                	mv	s4,a6
  8002cc:	00805863          	blez	s0,8002dc <printnum+0x3e>
  8002d0:	347d                	addiw	s0,s0,-1
  8002d2:	864e                	mv	a2,s3
  8002d4:	85ca                	mv	a1,s2
  8002d6:	8552                	mv	a0,s4
  8002d8:	9482                	jalr	s1
  8002da:	f87d                	bnez	s0,8002d0 <printnum+0x32>
  8002dc:	1a82                	slli	s5,s5,0x20
  8002de:	020ada93          	srli	s5,s5,0x20
  8002e2:	00000797          	auipc	a5,0x0
  8002e6:	53678793          	addi	a5,a5,1334 # 800818 <main+0x130>
  8002ea:	7442                	ld	s0,48(sp)
  8002ec:	9abe                	add	s5,s5,a5
  8002ee:	000ac503          	lbu	a0,0(s5)
  8002f2:	70e2                	ld	ra,56(sp)
  8002f4:	6a42                	ld	s4,16(sp)
  8002f6:	6aa2                	ld	s5,8(sp)
  8002f8:	864e                	mv	a2,s3
  8002fa:	85ca                	mv	a1,s2
  8002fc:	69e2                	ld	s3,24(sp)
  8002fe:	7902                	ld	s2,32(sp)
  800300:	8326                	mv	t1,s1
  800302:	74a2                	ld	s1,40(sp)
  800304:	6121                	addi	sp,sp,64
  800306:	8302                	jr	t1
  800308:	0316d6b3          	divu	a3,a3,a7
  80030c:	87a2                	mv	a5,s0
  80030e:	f91ff0ef          	jal	ra,80029e <printnum>
  800312:	b7e9                	j	8002dc <printnum+0x3e>

0000000000800314 <vprintfmt>:
  800314:	7119                	addi	sp,sp,-128
  800316:	f4a6                	sd	s1,104(sp)
  800318:	f0ca                	sd	s2,96(sp)
  80031a:	ecce                	sd	s3,88(sp)
  80031c:	e8d2                	sd	s4,80(sp)
  80031e:	e4d6                	sd	s5,72(sp)
  800320:	e0da                	sd	s6,64(sp)
  800322:	fc5e                	sd	s7,56(sp)
  800324:	ec6e                	sd	s11,24(sp)
  800326:	fc86                	sd	ra,120(sp)
  800328:	f8a2                	sd	s0,112(sp)
  80032a:	f862                	sd	s8,48(sp)
  80032c:	f466                	sd	s9,40(sp)
  80032e:	f06a                	sd	s10,32(sp)
  800330:	89aa                	mv	s3,a0
  800332:	892e                	mv	s2,a1
  800334:	84b2                	mv	s1,a2
  800336:	8db6                	mv	s11,a3
  800338:	8aba                	mv	s5,a4
  80033a:	02500a13          	li	s4,37
  80033e:	5bfd                	li	s7,-1
  800340:	00000b17          	auipc	s6,0x0
  800344:	50cb0b13          	addi	s6,s6,1292 # 80084c <main+0x164>
  800348:	000dc503          	lbu	a0,0(s11)
  80034c:	001d8413          	addi	s0,s11,1
  800350:	01450b63          	beq	a0,s4,800366 <vprintfmt+0x52>
  800354:	c129                	beqz	a0,800396 <vprintfmt+0x82>
  800356:	864a                	mv	a2,s2
  800358:	85a6                	mv	a1,s1
  80035a:	0405                	addi	s0,s0,1
  80035c:	9982                	jalr	s3
  80035e:	fff44503          	lbu	a0,-1(s0)
  800362:	ff4519e3          	bne	a0,s4,800354 <vprintfmt+0x40>
  800366:	00044583          	lbu	a1,0(s0)
  80036a:	02000813          	li	a6,32
  80036e:	4d01                	li	s10,0
  800370:	4301                	li	t1,0
  800372:	5cfd                	li	s9,-1
  800374:	5c7d                	li	s8,-1
  800376:	05500513          	li	a0,85
  80037a:	48a5                	li	a7,9
  80037c:	fdd5861b          	addiw	a2,a1,-35
  800380:	0ff67613          	andi	a2,a2,255
  800384:	00140d93          	addi	s11,s0,1
  800388:	04c56263          	bltu	a0,a2,8003cc <vprintfmt+0xb8>
  80038c:	060a                	slli	a2,a2,0x2
  80038e:	965a                	add	a2,a2,s6
  800390:	4214                	lw	a3,0(a2)
  800392:	96da                	add	a3,a3,s6
  800394:	8682                	jr	a3
  800396:	70e6                	ld	ra,120(sp)
  800398:	7446                	ld	s0,112(sp)
  80039a:	74a6                	ld	s1,104(sp)
  80039c:	7906                	ld	s2,96(sp)
  80039e:	69e6                	ld	s3,88(sp)
  8003a0:	6a46                	ld	s4,80(sp)
  8003a2:	6aa6                	ld	s5,72(sp)
  8003a4:	6b06                	ld	s6,64(sp)
  8003a6:	7be2                	ld	s7,56(sp)
  8003a8:	7c42                	ld	s8,48(sp)
  8003aa:	7ca2                	ld	s9,40(sp)
  8003ac:	7d02                	ld	s10,32(sp)
  8003ae:	6de2                	ld	s11,24(sp)
  8003b0:	6109                	addi	sp,sp,128
  8003b2:	8082                	ret
  8003b4:	882e                	mv	a6,a1
  8003b6:	00144583          	lbu	a1,1(s0)
  8003ba:	846e                	mv	s0,s11
  8003bc:	00140d93          	addi	s11,s0,1
  8003c0:	fdd5861b          	addiw	a2,a1,-35
  8003c4:	0ff67613          	andi	a2,a2,255
  8003c8:	fcc572e3          	bgeu	a0,a2,80038c <vprintfmt+0x78>
  8003cc:	864a                	mv	a2,s2
  8003ce:	85a6                	mv	a1,s1
  8003d0:	02500513          	li	a0,37
  8003d4:	9982                	jalr	s3
  8003d6:	fff44783          	lbu	a5,-1(s0)
  8003da:	8da2                	mv	s11,s0
  8003dc:	f74786e3          	beq	a5,s4,800348 <vprintfmt+0x34>
  8003e0:	ffedc783          	lbu	a5,-2(s11)
  8003e4:	1dfd                	addi	s11,s11,-1
  8003e6:	ff479de3          	bne	a5,s4,8003e0 <vprintfmt+0xcc>
  8003ea:	bfb9                	j	800348 <vprintfmt+0x34>
  8003ec:	fd058c9b          	addiw	s9,a1,-48
  8003f0:	00144583          	lbu	a1,1(s0)
  8003f4:	846e                	mv	s0,s11
  8003f6:	fd05869b          	addiw	a3,a1,-48
  8003fa:	0005861b          	sext.w	a2,a1
  8003fe:	02d8e463          	bltu	a7,a3,800426 <vprintfmt+0x112>
  800402:	00144583          	lbu	a1,1(s0)
  800406:	002c969b          	slliw	a3,s9,0x2
  80040a:	0196873b          	addw	a4,a3,s9
  80040e:	0017171b          	slliw	a4,a4,0x1
  800412:	9f31                	addw	a4,a4,a2
  800414:	fd05869b          	addiw	a3,a1,-48
  800418:	0405                	addi	s0,s0,1
  80041a:	fd070c9b          	addiw	s9,a4,-48
  80041e:	0005861b          	sext.w	a2,a1
  800422:	fed8f0e3          	bgeu	a7,a3,800402 <vprintfmt+0xee>
  800426:	f40c5be3          	bgez	s8,80037c <vprintfmt+0x68>
  80042a:	8c66                	mv	s8,s9
  80042c:	5cfd                	li	s9,-1
  80042e:	b7b9                	j	80037c <vprintfmt+0x68>
  800430:	fffc4693          	not	a3,s8
  800434:	96fd                	srai	a3,a3,0x3f
  800436:	00dc77b3          	and	a5,s8,a3
  80043a:	00144583          	lbu	a1,1(s0)
  80043e:	00078c1b          	sext.w	s8,a5
  800442:	846e                	mv	s0,s11
  800444:	bf25                	j	80037c <vprintfmt+0x68>
  800446:	000aac83          	lw	s9,0(s5)
  80044a:	00144583          	lbu	a1,1(s0)
  80044e:	0aa1                	addi	s5,s5,8
  800450:	846e                	mv	s0,s11
  800452:	bfd1                	j	800426 <vprintfmt+0x112>
  800454:	4705                	li	a4,1
  800456:	008a8613          	addi	a2,s5,8
  80045a:	00674463          	blt	a4,t1,800462 <vprintfmt+0x14e>
  80045e:	1c030c63          	beqz	t1,800636 <vprintfmt+0x322>
  800462:	000ab683          	ld	a3,0(s5)
  800466:	4741                	li	a4,16
  800468:	8ab2                	mv	s5,a2
  80046a:	2801                	sext.w	a6,a6
  80046c:	87e2                	mv	a5,s8
  80046e:	8626                	mv	a2,s1
  800470:	85ca                	mv	a1,s2
  800472:	854e                	mv	a0,s3
  800474:	e2bff0ef          	jal	ra,80029e <printnum>
  800478:	bdc1                	j	800348 <vprintfmt+0x34>
  80047a:	000aa503          	lw	a0,0(s5)
  80047e:	864a                	mv	a2,s2
  800480:	85a6                	mv	a1,s1
  800482:	0aa1                	addi	s5,s5,8
  800484:	9982                	jalr	s3
  800486:	b5c9                	j	800348 <vprintfmt+0x34>
  800488:	4705                	li	a4,1
  80048a:	008a8613          	addi	a2,s5,8
  80048e:	00674463          	blt	a4,t1,800496 <vprintfmt+0x182>
  800492:	18030d63          	beqz	t1,80062c <vprintfmt+0x318>
  800496:	000ab683          	ld	a3,0(s5)
  80049a:	4729                	li	a4,10
  80049c:	8ab2                	mv	s5,a2
  80049e:	b7f1                	j	80046a <vprintfmt+0x156>
  8004a0:	00144583          	lbu	a1,1(s0)
  8004a4:	4d05                	li	s10,1
  8004a6:	846e                	mv	s0,s11
  8004a8:	bdd1                	j	80037c <vprintfmt+0x68>
  8004aa:	864a                	mv	a2,s2
  8004ac:	85a6                	mv	a1,s1
  8004ae:	02500513          	li	a0,37
  8004b2:	9982                	jalr	s3
  8004b4:	bd51                	j	800348 <vprintfmt+0x34>
  8004b6:	00144583          	lbu	a1,1(s0)
  8004ba:	2305                	addiw	t1,t1,1
  8004bc:	846e                	mv	s0,s11
  8004be:	bd7d                	j	80037c <vprintfmt+0x68>
  8004c0:	4705                	li	a4,1
  8004c2:	008a8613          	addi	a2,s5,8
  8004c6:	00674463          	blt	a4,t1,8004ce <vprintfmt+0x1ba>
  8004ca:	14030c63          	beqz	t1,800622 <vprintfmt+0x30e>
  8004ce:	000ab683          	ld	a3,0(s5)
  8004d2:	4721                	li	a4,8
  8004d4:	8ab2                	mv	s5,a2
  8004d6:	bf51                	j	80046a <vprintfmt+0x156>
  8004d8:	03000513          	li	a0,48
  8004dc:	864a                	mv	a2,s2
  8004de:	85a6                	mv	a1,s1
  8004e0:	e042                	sd	a6,0(sp)
  8004e2:	9982                	jalr	s3
  8004e4:	864a                	mv	a2,s2
  8004e6:	85a6                	mv	a1,s1
  8004e8:	07800513          	li	a0,120
  8004ec:	9982                	jalr	s3
  8004ee:	0aa1                	addi	s5,s5,8
  8004f0:	6802                	ld	a6,0(sp)
  8004f2:	4741                	li	a4,16
  8004f4:	ff8ab683          	ld	a3,-8(s5)
  8004f8:	bf8d                	j	80046a <vprintfmt+0x156>
  8004fa:	000ab403          	ld	s0,0(s5)
  8004fe:	008a8793          	addi	a5,s5,8
  800502:	e03e                	sd	a5,0(sp)
  800504:	14040c63          	beqz	s0,80065c <vprintfmt+0x348>
  800508:	11805063          	blez	s8,800608 <vprintfmt+0x2f4>
  80050c:	02d00693          	li	a3,45
  800510:	0cd81963          	bne	a6,a3,8005e2 <vprintfmt+0x2ce>
  800514:	00044683          	lbu	a3,0(s0)
  800518:	0006851b          	sext.w	a0,a3
  80051c:	ce8d                	beqz	a3,800556 <vprintfmt+0x242>
  80051e:	00140a93          	addi	s5,s0,1
  800522:	05e00413          	li	s0,94
  800526:	000cc563          	bltz	s9,800530 <vprintfmt+0x21c>
  80052a:	3cfd                	addiw	s9,s9,-1
  80052c:	037c8363          	beq	s9,s7,800552 <vprintfmt+0x23e>
  800530:	864a                	mv	a2,s2
  800532:	85a6                	mv	a1,s1
  800534:	100d0663          	beqz	s10,800640 <vprintfmt+0x32c>
  800538:	3681                	addiw	a3,a3,-32
  80053a:	10d47363          	bgeu	s0,a3,800640 <vprintfmt+0x32c>
  80053e:	03f00513          	li	a0,63
  800542:	9982                	jalr	s3
  800544:	000ac683          	lbu	a3,0(s5)
  800548:	3c7d                	addiw	s8,s8,-1
  80054a:	0a85                	addi	s5,s5,1
  80054c:	0006851b          	sext.w	a0,a3
  800550:	faf9                	bnez	a3,800526 <vprintfmt+0x212>
  800552:	01805a63          	blez	s8,800566 <vprintfmt+0x252>
  800556:	3c7d                	addiw	s8,s8,-1
  800558:	864a                	mv	a2,s2
  80055a:	85a6                	mv	a1,s1
  80055c:	02000513          	li	a0,32
  800560:	9982                	jalr	s3
  800562:	fe0c1ae3          	bnez	s8,800556 <vprintfmt+0x242>
  800566:	6a82                	ld	s5,0(sp)
  800568:	b3c5                	j	800348 <vprintfmt+0x34>
  80056a:	4705                	li	a4,1
  80056c:	008a8d13          	addi	s10,s5,8
  800570:	00674463          	blt	a4,t1,800578 <vprintfmt+0x264>
  800574:	0a030463          	beqz	t1,80061c <vprintfmt+0x308>
  800578:	000ab403          	ld	s0,0(s5)
  80057c:	0c044463          	bltz	s0,800644 <vprintfmt+0x330>
  800580:	86a2                	mv	a3,s0
  800582:	8aea                	mv	s5,s10
  800584:	4729                	li	a4,10
  800586:	b5d5                	j	80046a <vprintfmt+0x156>
  800588:	000aa783          	lw	a5,0(s5)
  80058c:	46e1                	li	a3,24
  80058e:	0aa1                	addi	s5,s5,8
  800590:	41f7d71b          	sraiw	a4,a5,0x1f
  800594:	8fb9                	xor	a5,a5,a4
  800596:	40e7873b          	subw	a4,a5,a4
  80059a:	02e6c663          	blt	a3,a4,8005c6 <vprintfmt+0x2b2>
  80059e:	00371793          	slli	a5,a4,0x3
  8005a2:	00000697          	auipc	a3,0x0
  8005a6:	5de68693          	addi	a3,a3,1502 # 800b80 <error_string>
  8005aa:	97b6                	add	a5,a5,a3
  8005ac:	639c                	ld	a5,0(a5)
  8005ae:	cf81                	beqz	a5,8005c6 <vprintfmt+0x2b2>
  8005b0:	873e                	mv	a4,a5
  8005b2:	00000697          	auipc	a3,0x0
  8005b6:	29668693          	addi	a3,a3,662 # 800848 <main+0x160>
  8005ba:	8626                	mv	a2,s1
  8005bc:	85ca                	mv	a1,s2
  8005be:	854e                	mv	a0,s3
  8005c0:	0d4000ef          	jal	ra,800694 <printfmt>
  8005c4:	b351                	j	800348 <vprintfmt+0x34>
  8005c6:	00000697          	auipc	a3,0x0
  8005ca:	27268693          	addi	a3,a3,626 # 800838 <main+0x150>
  8005ce:	8626                	mv	a2,s1
  8005d0:	85ca                	mv	a1,s2
  8005d2:	854e                	mv	a0,s3
  8005d4:	0c0000ef          	jal	ra,800694 <printfmt>
  8005d8:	bb85                	j	800348 <vprintfmt+0x34>
  8005da:	00000417          	auipc	s0,0x0
  8005de:	25640413          	addi	s0,s0,598 # 800830 <main+0x148>
  8005e2:	85e6                	mv	a1,s9
  8005e4:	8522                	mv	a0,s0
  8005e6:	e442                	sd	a6,8(sp)
  8005e8:	c9bff0ef          	jal	ra,800282 <strnlen>
  8005ec:	40ac0c3b          	subw	s8,s8,a0
  8005f0:	01805c63          	blez	s8,800608 <vprintfmt+0x2f4>
  8005f4:	6822                	ld	a6,8(sp)
  8005f6:	00080a9b          	sext.w	s5,a6
  8005fa:	3c7d                	addiw	s8,s8,-1
  8005fc:	864a                	mv	a2,s2
  8005fe:	85a6                	mv	a1,s1
  800600:	8556                	mv	a0,s5
  800602:	9982                	jalr	s3
  800604:	fe0c1be3          	bnez	s8,8005fa <vprintfmt+0x2e6>
  800608:	00044683          	lbu	a3,0(s0)
  80060c:	00140a93          	addi	s5,s0,1
  800610:	0006851b          	sext.w	a0,a3
  800614:	daa9                	beqz	a3,800566 <vprintfmt+0x252>
  800616:	05e00413          	li	s0,94
  80061a:	b731                	j	800526 <vprintfmt+0x212>
  80061c:	000aa403          	lw	s0,0(s5)
  800620:	bfb1                	j	80057c <vprintfmt+0x268>
  800622:	000ae683          	lwu	a3,0(s5)
  800626:	4721                	li	a4,8
  800628:	8ab2                	mv	s5,a2
  80062a:	b581                	j	80046a <vprintfmt+0x156>
  80062c:	000ae683          	lwu	a3,0(s5)
  800630:	4729                	li	a4,10
  800632:	8ab2                	mv	s5,a2
  800634:	bd1d                	j	80046a <vprintfmt+0x156>
  800636:	000ae683          	lwu	a3,0(s5)
  80063a:	4741                	li	a4,16
  80063c:	8ab2                	mv	s5,a2
  80063e:	b535                	j	80046a <vprintfmt+0x156>
  800640:	9982                	jalr	s3
  800642:	b709                	j	800544 <vprintfmt+0x230>
  800644:	864a                	mv	a2,s2
  800646:	85a6                	mv	a1,s1
  800648:	02d00513          	li	a0,45
  80064c:	e042                	sd	a6,0(sp)
  80064e:	9982                	jalr	s3
  800650:	6802                	ld	a6,0(sp)
  800652:	8aea                	mv	s5,s10
  800654:	408006b3          	neg	a3,s0
  800658:	4729                	li	a4,10
  80065a:	bd01                	j	80046a <vprintfmt+0x156>
  80065c:	03805163          	blez	s8,80067e <vprintfmt+0x36a>
  800660:	02d00693          	li	a3,45
  800664:	f6d81be3          	bne	a6,a3,8005da <vprintfmt+0x2c6>
  800668:	00000417          	auipc	s0,0x0
  80066c:	1c840413          	addi	s0,s0,456 # 800830 <main+0x148>
  800670:	02800693          	li	a3,40
  800674:	02800513          	li	a0,40
  800678:	00140a93          	addi	s5,s0,1
  80067c:	b55d                	j	800522 <vprintfmt+0x20e>
  80067e:	00000a97          	auipc	s5,0x0
  800682:	1b3a8a93          	addi	s5,s5,435 # 800831 <main+0x149>
  800686:	02800513          	li	a0,40
  80068a:	02800693          	li	a3,40
  80068e:	05e00413          	li	s0,94
  800692:	bd51                	j	800526 <vprintfmt+0x212>

0000000000800694 <printfmt>:
  800694:	7139                	addi	sp,sp,-64
  800696:	02010313          	addi	t1,sp,32
  80069a:	f03a                	sd	a4,32(sp)
  80069c:	871a                	mv	a4,t1
  80069e:	ec06                	sd	ra,24(sp)
  8006a0:	f43e                	sd	a5,40(sp)
  8006a2:	f842                	sd	a6,48(sp)
  8006a4:	fc46                	sd	a7,56(sp)
  8006a6:	e41a                	sd	t1,8(sp)
  8006a8:	c6dff0ef          	jal	ra,800314 <vprintfmt>
  8006ac:	60e2                	ld	ra,24(sp)
  8006ae:	6121                	addi	sp,sp,64
  8006b0:	8082                	ret

00000000008006b2 <sleepy>:
  8006b2:	1101                	addi	sp,sp,-32
  8006b4:	e822                	sd	s0,16(sp)
  8006b6:	e426                	sd	s1,8(sp)
  8006b8:	e04a                	sd	s2,0(sp)
  8006ba:	ec06                	sd	ra,24(sp)
  8006bc:	4401                	li	s0,0
  8006be:	00000917          	auipc	s2,0x0
  8006c2:	58a90913          	addi	s2,s2,1418 # 800c48 <error_string+0xc8>
  8006c6:	44a9                	li	s1,10
  8006c8:	06400513          	li	a0,100
  8006cc:	a6dff0ef          	jal	ra,800138 <sleep>
  8006d0:	2405                	addiw	s0,s0,1
  8006d2:	06400613          	li	a2,100
  8006d6:	85a2                	mv	a1,s0
  8006d8:	854a                	mv	a0,s2
  8006da:	ab5ff0ef          	jal	ra,80018e <cprintf>
  8006de:	fe9415e3          	bne	s0,s1,8006c8 <sleepy+0x16>
  8006e2:	4501                	li	a0,0
  8006e4:	a39ff0ef          	jal	ra,80011c <exit>

00000000008006e8 <main>:
  8006e8:	1101                	addi	sp,sp,-32
  8006ea:	e822                	sd	s0,16(sp)
  8006ec:	ec06                	sd	ra,24(sp)
  8006ee:	a49ff0ef          	jal	ra,800136 <gettime_msec>
  8006f2:	0005041b          	sext.w	s0,a0
  8006f6:	a3dff0ef          	jal	ra,800132 <fork>
  8006fa:	cd21                	beqz	a0,800752 <main+0x6a>
  8006fc:	006c                	addi	a1,sp,12
  8006fe:	a37ff0ef          	jal	ra,800134 <waitpid>
  800702:	47b2                	lw	a5,12(sp)
  800704:	8fc9                	or	a5,a5,a0
  800706:	2781                	sext.w	a5,a5
  800708:	e795                	bnez	a5,800734 <main+0x4c>
  80070a:	a2dff0ef          	jal	ra,800136 <gettime_msec>
  80070e:	408505bb          	subw	a1,a0,s0
  800712:	00000517          	auipc	a0,0x0
  800716:	5ae50513          	addi	a0,a0,1454 # 800cc0 <error_string+0x140>
  80071a:	a75ff0ef          	jal	ra,80018e <cprintf>
  80071e:	00000517          	auipc	a0,0x0
  800722:	5ba50513          	addi	a0,a0,1466 # 800cd8 <error_string+0x158>
  800726:	a69ff0ef          	jal	ra,80018e <cprintf>
  80072a:	60e2                	ld	ra,24(sp)
  80072c:	6442                	ld	s0,16(sp)
  80072e:	4501                	li	a0,0
  800730:	6105                	addi	sp,sp,32
  800732:	8082                	ret
  800734:	00000697          	auipc	a3,0x0
  800738:	52c68693          	addi	a3,a3,1324 # 800c60 <error_string+0xe0>
  80073c:	00000617          	auipc	a2,0x0
  800740:	55c60613          	addi	a2,a2,1372 # 800c98 <error_string+0x118>
  800744:	45dd                	li	a1,23
  800746:	00000517          	auipc	a0,0x0
  80074a:	56a50513          	addi	a0,a0,1386 # 800cb0 <error_string+0x130>
  80074e:	8d3ff0ef          	jal	ra,800020 <__panic>
  800752:	f61ff0ef          	jal	ra,8006b2 <sleepy>
