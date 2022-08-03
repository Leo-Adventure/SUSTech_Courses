
obj/__user_forktest.out:     file format elf64-littleriscv


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
  800034:	72050513          	addi	a0,a0,1824 # 800750 <main+0xac>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	13c000ef          	jal	ra,800180 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	10e000ef          	jal	ra,80015a <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	77850513          	addi	a0,a0,1912 # 8007c8 <main+0x124>
  800058:	128000ef          	jal	ra,800180 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0b4000ef          	jal	ra,800112 <exit>

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
  800076:	6fe50513          	addi	a0,a0,1790 # 800770 <main+0xcc>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	0fa000ef          	jal	ra,800180 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0cc000ef          	jal	ra,80015a <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	73650513          	addi	a0,a0,1846 # 8007c8 <main+0x124>
  80009a:	0e6000ef          	jal	ra,800180 <cprintf>
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

00000000008000f6 <sys_open>:
  8000f6:	862e                	mv	a2,a1
  8000f8:	85aa                	mv	a1,a0
  8000fa:	06400513          	li	a0,100
  8000fe:	b765                	j	8000a6 <syscall>

0000000000800100 <sys_close>:
  800100:	85aa                	mv	a1,a0
  800102:	06500513          	li	a0,101
  800106:	b745                	j	8000a6 <syscall>

0000000000800108 <sys_dup>:
  800108:	862e                	mv	a2,a1
  80010a:	85aa                	mv	a1,a0
  80010c:	08200513          	li	a0,130
  800110:	bf59                	j	8000a6 <syscall>

0000000000800112 <exit>:
  800112:	1141                	addi	sp,sp,-16
  800114:	e406                	sd	ra,8(sp)
  800116:	fc9ff0ef          	jal	ra,8000de <sys_exit>
  80011a:	00000517          	auipc	a0,0x0
  80011e:	67650513          	addi	a0,a0,1654 # 800790 <main+0xec>
  800122:	05e000ef          	jal	ra,800180 <cprintf>
  800126:	a001                	j	800126 <exit+0x14>

0000000000800128 <fork>:
  800128:	bf75                	j	8000e4 <sys_fork>

000000000080012a <wait>:
  80012a:	4581                	li	a1,0
  80012c:	4501                	li	a0,0
  80012e:	bf6d                	j	8000e8 <sys_wait>

0000000000800130 <_start>:
  800130:	0d0000ef          	jal	ra,800200 <umain>
  800134:	a001                	j	800134 <_start+0x4>

0000000000800136 <open>:
  800136:	1582                	slli	a1,a1,0x20
  800138:	9181                	srli	a1,a1,0x20
  80013a:	bf75                	j	8000f6 <sys_open>

000000000080013c <close>:
  80013c:	b7d1                	j	800100 <sys_close>

000000000080013e <dup2>:
  80013e:	b7e9                	j	800108 <sys_dup>

0000000000800140 <cputch>:
  800140:	1141                	addi	sp,sp,-16
  800142:	e022                	sd	s0,0(sp)
  800144:	e406                	sd	ra,8(sp)
  800146:	842e                	mv	s0,a1
  800148:	fa9ff0ef          	jal	ra,8000f0 <sys_putc>
  80014c:	401c                	lw	a5,0(s0)
  80014e:	60a2                	ld	ra,8(sp)
  800150:	2785                	addiw	a5,a5,1
  800152:	c01c                	sw	a5,0(s0)
  800154:	6402                	ld	s0,0(sp)
  800156:	0141                	addi	sp,sp,16
  800158:	8082                	ret

000000000080015a <vcprintf>:
  80015a:	1101                	addi	sp,sp,-32
  80015c:	872e                	mv	a4,a1
  80015e:	75dd                	lui	a1,0xffff7
  800160:	86aa                	mv	a3,a0
  800162:	0070                	addi	a2,sp,12
  800164:	00000517          	auipc	a0,0x0
  800168:	fdc50513          	addi	a0,a0,-36 # 800140 <cputch>
  80016c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f61>
  800170:	ec06                	sd	ra,24(sp)
  800172:	c602                	sw	zero,12(sp)
  800174:	192000ef          	jal	ra,800306 <vprintfmt>
  800178:	60e2                	ld	ra,24(sp)
  80017a:	4532                	lw	a0,12(sp)
  80017c:	6105                	addi	sp,sp,32
  80017e:	8082                	ret

0000000000800180 <cprintf>:
  800180:	711d                	addi	sp,sp,-96
  800182:	02810313          	addi	t1,sp,40
  800186:	8e2a                	mv	t3,a0
  800188:	f42e                	sd	a1,40(sp)
  80018a:	75dd                	lui	a1,0xffff7
  80018c:	f832                	sd	a2,48(sp)
  80018e:	fc36                	sd	a3,56(sp)
  800190:	e0ba                	sd	a4,64(sp)
  800192:	00000517          	auipc	a0,0x0
  800196:	fae50513          	addi	a0,a0,-82 # 800140 <cputch>
  80019a:	0050                	addi	a2,sp,4
  80019c:	871a                	mv	a4,t1
  80019e:	86f2                	mv	a3,t3
  8001a0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f61>
  8001a4:	ec06                	sd	ra,24(sp)
  8001a6:	e4be                	sd	a5,72(sp)
  8001a8:	e8c2                	sd	a6,80(sp)
  8001aa:	ecc6                	sd	a7,88(sp)
  8001ac:	e41a                	sd	t1,8(sp)
  8001ae:	c202                	sw	zero,4(sp)
  8001b0:	156000ef          	jal	ra,800306 <vprintfmt>
  8001b4:	60e2                	ld	ra,24(sp)
  8001b6:	4512                	lw	a0,4(sp)
  8001b8:	6125                	addi	sp,sp,96
  8001ba:	8082                	ret

00000000008001bc <initfd>:
  8001bc:	1101                	addi	sp,sp,-32
  8001be:	87ae                	mv	a5,a1
  8001c0:	e426                	sd	s1,8(sp)
  8001c2:	85b2                	mv	a1,a2
  8001c4:	84aa                	mv	s1,a0
  8001c6:	853e                	mv	a0,a5
  8001c8:	e822                	sd	s0,16(sp)
  8001ca:	ec06                	sd	ra,24(sp)
  8001cc:	f6bff0ef          	jal	ra,800136 <open>
  8001d0:	842a                	mv	s0,a0
  8001d2:	00054463          	bltz	a0,8001da <initfd+0x1e>
  8001d6:	00951863          	bne	a0,s1,8001e6 <initfd+0x2a>
  8001da:	60e2                	ld	ra,24(sp)
  8001dc:	8522                	mv	a0,s0
  8001de:	6442                	ld	s0,16(sp)
  8001e0:	64a2                	ld	s1,8(sp)
  8001e2:	6105                	addi	sp,sp,32
  8001e4:	8082                	ret
  8001e6:	8526                	mv	a0,s1
  8001e8:	f55ff0ef          	jal	ra,80013c <close>
  8001ec:	85a6                	mv	a1,s1
  8001ee:	8522                	mv	a0,s0
  8001f0:	f4fff0ef          	jal	ra,80013e <dup2>
  8001f4:	84aa                	mv	s1,a0
  8001f6:	8522                	mv	a0,s0
  8001f8:	f45ff0ef          	jal	ra,80013c <close>
  8001fc:	8426                	mv	s0,s1
  8001fe:	bff1                	j	8001da <initfd+0x1e>

0000000000800200 <umain>:
  800200:	1101                	addi	sp,sp,-32
  800202:	e822                	sd	s0,16(sp)
  800204:	e426                	sd	s1,8(sp)
  800206:	842a                	mv	s0,a0
  800208:	84ae                	mv	s1,a1
  80020a:	4601                	li	a2,0
  80020c:	00000597          	auipc	a1,0x0
  800210:	59c58593          	addi	a1,a1,1436 # 8007a8 <main+0x104>
  800214:	4501                	li	a0,0
  800216:	ec06                	sd	ra,24(sp)
  800218:	fa5ff0ef          	jal	ra,8001bc <initfd>
  80021c:	02054263          	bltz	a0,800240 <umain+0x40>
  800220:	4605                	li	a2,1
  800222:	00000597          	auipc	a1,0x0
  800226:	5c658593          	addi	a1,a1,1478 # 8007e8 <main+0x144>
  80022a:	4505                	li	a0,1
  80022c:	f91ff0ef          	jal	ra,8001bc <initfd>
  800230:	02054563          	bltz	a0,80025a <umain+0x5a>
  800234:	85a6                	mv	a1,s1
  800236:	8522                	mv	a0,s0
  800238:	46c000ef          	jal	ra,8006a4 <main>
  80023c:	ed7ff0ef          	jal	ra,800112 <exit>
  800240:	86aa                	mv	a3,a0
  800242:	00000617          	auipc	a2,0x0
  800246:	56e60613          	addi	a2,a2,1390 # 8007b0 <main+0x10c>
  80024a:	45e9                	li	a1,26
  80024c:	00000517          	auipc	a0,0x0
  800250:	58450513          	addi	a0,a0,1412 # 8007d0 <main+0x12c>
  800254:	e0fff0ef          	jal	ra,800062 <__warn>
  800258:	b7e1                	j	800220 <umain+0x20>
  80025a:	86aa                	mv	a3,a0
  80025c:	00000617          	auipc	a2,0x0
  800260:	59460613          	addi	a2,a2,1428 # 8007f0 <main+0x14c>
  800264:	45f5                	li	a1,29
  800266:	00000517          	auipc	a0,0x0
  80026a:	56a50513          	addi	a0,a0,1386 # 8007d0 <main+0x12c>
  80026e:	df5ff0ef          	jal	ra,800062 <__warn>
  800272:	b7c9                	j	800234 <umain+0x34>

0000000000800274 <strnlen>:
  800274:	872a                	mv	a4,a0
  800276:	4501                	li	a0,0
  800278:	e589                	bnez	a1,800282 <strnlen+0xe>
  80027a:	a811                	j	80028e <strnlen+0x1a>
  80027c:	0505                	addi	a0,a0,1
  80027e:	00a58763          	beq	a1,a0,80028c <strnlen+0x18>
  800282:	00a707b3          	add	a5,a4,a0
  800286:	0007c783          	lbu	a5,0(a5)
  80028a:	fbed                	bnez	a5,80027c <strnlen+0x8>
  80028c:	8082                	ret
  80028e:	8082                	ret

0000000000800290 <printnum>:
  800290:	02071893          	slli	a7,a4,0x20
  800294:	7139                	addi	sp,sp,-64
  800296:	0208d893          	srli	a7,a7,0x20
  80029a:	e456                	sd	s5,8(sp)
  80029c:	0316fab3          	remu	s5,a3,a7
  8002a0:	f822                	sd	s0,48(sp)
  8002a2:	f426                	sd	s1,40(sp)
  8002a4:	f04a                	sd	s2,32(sp)
  8002a6:	ec4e                	sd	s3,24(sp)
  8002a8:	fc06                	sd	ra,56(sp)
  8002aa:	e852                	sd	s4,16(sp)
  8002ac:	84aa                	mv	s1,a0
  8002ae:	89ae                	mv	s3,a1
  8002b0:	8932                	mv	s2,a2
  8002b2:	fff7841b          	addiw	s0,a5,-1
  8002b6:	2a81                	sext.w	s5,s5
  8002b8:	0516f163          	bgeu	a3,a7,8002fa <printnum+0x6a>
  8002bc:	8a42                	mv	s4,a6
  8002be:	00805863          	blez	s0,8002ce <printnum+0x3e>
  8002c2:	347d                	addiw	s0,s0,-1
  8002c4:	864e                	mv	a2,s3
  8002c6:	85ca                	mv	a1,s2
  8002c8:	8552                	mv	a0,s4
  8002ca:	9482                	jalr	s1
  8002cc:	f87d                	bnez	s0,8002c2 <printnum+0x32>
  8002ce:	1a82                	slli	s5,s5,0x20
  8002d0:	020ada93          	srli	s5,s5,0x20
  8002d4:	00000797          	auipc	a5,0x0
  8002d8:	53c78793          	addi	a5,a5,1340 # 800810 <main+0x16c>
  8002dc:	7442                	ld	s0,48(sp)
  8002de:	9abe                	add	s5,s5,a5
  8002e0:	000ac503          	lbu	a0,0(s5)
  8002e4:	70e2                	ld	ra,56(sp)
  8002e6:	6a42                	ld	s4,16(sp)
  8002e8:	6aa2                	ld	s5,8(sp)
  8002ea:	864e                	mv	a2,s3
  8002ec:	85ca                	mv	a1,s2
  8002ee:	69e2                	ld	s3,24(sp)
  8002f0:	7902                	ld	s2,32(sp)
  8002f2:	8326                	mv	t1,s1
  8002f4:	74a2                	ld	s1,40(sp)
  8002f6:	6121                	addi	sp,sp,64
  8002f8:	8302                	jr	t1
  8002fa:	0316d6b3          	divu	a3,a3,a7
  8002fe:	87a2                	mv	a5,s0
  800300:	f91ff0ef          	jal	ra,800290 <printnum>
  800304:	b7e9                	j	8002ce <printnum+0x3e>

0000000000800306 <vprintfmt>:
  800306:	7119                	addi	sp,sp,-128
  800308:	f4a6                	sd	s1,104(sp)
  80030a:	f0ca                	sd	s2,96(sp)
  80030c:	ecce                	sd	s3,88(sp)
  80030e:	e8d2                	sd	s4,80(sp)
  800310:	e4d6                	sd	s5,72(sp)
  800312:	e0da                	sd	s6,64(sp)
  800314:	fc5e                	sd	s7,56(sp)
  800316:	ec6e                	sd	s11,24(sp)
  800318:	fc86                	sd	ra,120(sp)
  80031a:	f8a2                	sd	s0,112(sp)
  80031c:	f862                	sd	s8,48(sp)
  80031e:	f466                	sd	s9,40(sp)
  800320:	f06a                	sd	s10,32(sp)
  800322:	89aa                	mv	s3,a0
  800324:	892e                	mv	s2,a1
  800326:	84b2                	mv	s1,a2
  800328:	8db6                	mv	s11,a3
  80032a:	8aba                	mv	s5,a4
  80032c:	02500a13          	li	s4,37
  800330:	5bfd                	li	s7,-1
  800332:	00000b17          	auipc	s6,0x0
  800336:	512b0b13          	addi	s6,s6,1298 # 800844 <main+0x1a0>
  80033a:	000dc503          	lbu	a0,0(s11)
  80033e:	001d8413          	addi	s0,s11,1
  800342:	01450b63          	beq	a0,s4,800358 <vprintfmt+0x52>
  800346:	c129                	beqz	a0,800388 <vprintfmt+0x82>
  800348:	864a                	mv	a2,s2
  80034a:	85a6                	mv	a1,s1
  80034c:	0405                	addi	s0,s0,1
  80034e:	9982                	jalr	s3
  800350:	fff44503          	lbu	a0,-1(s0)
  800354:	ff4519e3          	bne	a0,s4,800346 <vprintfmt+0x40>
  800358:	00044583          	lbu	a1,0(s0)
  80035c:	02000813          	li	a6,32
  800360:	4d01                	li	s10,0
  800362:	4301                	li	t1,0
  800364:	5cfd                	li	s9,-1
  800366:	5c7d                	li	s8,-1
  800368:	05500513          	li	a0,85
  80036c:	48a5                	li	a7,9
  80036e:	fdd5861b          	addiw	a2,a1,-35
  800372:	0ff67613          	andi	a2,a2,255
  800376:	00140d93          	addi	s11,s0,1
  80037a:	04c56263          	bltu	a0,a2,8003be <vprintfmt+0xb8>
  80037e:	060a                	slli	a2,a2,0x2
  800380:	965a                	add	a2,a2,s6
  800382:	4214                	lw	a3,0(a2)
  800384:	96da                	add	a3,a3,s6
  800386:	8682                	jr	a3
  800388:	70e6                	ld	ra,120(sp)
  80038a:	7446                	ld	s0,112(sp)
  80038c:	74a6                	ld	s1,104(sp)
  80038e:	7906                	ld	s2,96(sp)
  800390:	69e6                	ld	s3,88(sp)
  800392:	6a46                	ld	s4,80(sp)
  800394:	6aa6                	ld	s5,72(sp)
  800396:	6b06                	ld	s6,64(sp)
  800398:	7be2                	ld	s7,56(sp)
  80039a:	7c42                	ld	s8,48(sp)
  80039c:	7ca2                	ld	s9,40(sp)
  80039e:	7d02                	ld	s10,32(sp)
  8003a0:	6de2                	ld	s11,24(sp)
  8003a2:	6109                	addi	sp,sp,128
  8003a4:	8082                	ret
  8003a6:	882e                	mv	a6,a1
  8003a8:	00144583          	lbu	a1,1(s0)
  8003ac:	846e                	mv	s0,s11
  8003ae:	00140d93          	addi	s11,s0,1
  8003b2:	fdd5861b          	addiw	a2,a1,-35
  8003b6:	0ff67613          	andi	a2,a2,255
  8003ba:	fcc572e3          	bgeu	a0,a2,80037e <vprintfmt+0x78>
  8003be:	864a                	mv	a2,s2
  8003c0:	85a6                	mv	a1,s1
  8003c2:	02500513          	li	a0,37
  8003c6:	9982                	jalr	s3
  8003c8:	fff44783          	lbu	a5,-1(s0)
  8003cc:	8da2                	mv	s11,s0
  8003ce:	f74786e3          	beq	a5,s4,80033a <vprintfmt+0x34>
  8003d2:	ffedc783          	lbu	a5,-2(s11)
  8003d6:	1dfd                	addi	s11,s11,-1
  8003d8:	ff479de3          	bne	a5,s4,8003d2 <vprintfmt+0xcc>
  8003dc:	bfb9                	j	80033a <vprintfmt+0x34>
  8003de:	fd058c9b          	addiw	s9,a1,-48
  8003e2:	00144583          	lbu	a1,1(s0)
  8003e6:	846e                	mv	s0,s11
  8003e8:	fd05869b          	addiw	a3,a1,-48
  8003ec:	0005861b          	sext.w	a2,a1
  8003f0:	02d8e463          	bltu	a7,a3,800418 <vprintfmt+0x112>
  8003f4:	00144583          	lbu	a1,1(s0)
  8003f8:	002c969b          	slliw	a3,s9,0x2
  8003fc:	0196873b          	addw	a4,a3,s9
  800400:	0017171b          	slliw	a4,a4,0x1
  800404:	9f31                	addw	a4,a4,a2
  800406:	fd05869b          	addiw	a3,a1,-48
  80040a:	0405                	addi	s0,s0,1
  80040c:	fd070c9b          	addiw	s9,a4,-48
  800410:	0005861b          	sext.w	a2,a1
  800414:	fed8f0e3          	bgeu	a7,a3,8003f4 <vprintfmt+0xee>
  800418:	f40c5be3          	bgez	s8,80036e <vprintfmt+0x68>
  80041c:	8c66                	mv	s8,s9
  80041e:	5cfd                	li	s9,-1
  800420:	b7b9                	j	80036e <vprintfmt+0x68>
  800422:	fffc4693          	not	a3,s8
  800426:	96fd                	srai	a3,a3,0x3f
  800428:	00dc77b3          	and	a5,s8,a3
  80042c:	00144583          	lbu	a1,1(s0)
  800430:	00078c1b          	sext.w	s8,a5
  800434:	846e                	mv	s0,s11
  800436:	bf25                	j	80036e <vprintfmt+0x68>
  800438:	000aac83          	lw	s9,0(s5)
  80043c:	00144583          	lbu	a1,1(s0)
  800440:	0aa1                	addi	s5,s5,8
  800442:	846e                	mv	s0,s11
  800444:	bfd1                	j	800418 <vprintfmt+0x112>
  800446:	4705                	li	a4,1
  800448:	008a8613          	addi	a2,s5,8
  80044c:	00674463          	blt	a4,t1,800454 <vprintfmt+0x14e>
  800450:	1c030c63          	beqz	t1,800628 <vprintfmt+0x322>
  800454:	000ab683          	ld	a3,0(s5)
  800458:	4741                	li	a4,16
  80045a:	8ab2                	mv	s5,a2
  80045c:	2801                	sext.w	a6,a6
  80045e:	87e2                	mv	a5,s8
  800460:	8626                	mv	a2,s1
  800462:	85ca                	mv	a1,s2
  800464:	854e                	mv	a0,s3
  800466:	e2bff0ef          	jal	ra,800290 <printnum>
  80046a:	bdc1                	j	80033a <vprintfmt+0x34>
  80046c:	000aa503          	lw	a0,0(s5)
  800470:	864a                	mv	a2,s2
  800472:	85a6                	mv	a1,s1
  800474:	0aa1                	addi	s5,s5,8
  800476:	9982                	jalr	s3
  800478:	b5c9                	j	80033a <vprintfmt+0x34>
  80047a:	4705                	li	a4,1
  80047c:	008a8613          	addi	a2,s5,8
  800480:	00674463          	blt	a4,t1,800488 <vprintfmt+0x182>
  800484:	18030d63          	beqz	t1,80061e <vprintfmt+0x318>
  800488:	000ab683          	ld	a3,0(s5)
  80048c:	4729                	li	a4,10
  80048e:	8ab2                	mv	s5,a2
  800490:	b7f1                	j	80045c <vprintfmt+0x156>
  800492:	00144583          	lbu	a1,1(s0)
  800496:	4d05                	li	s10,1
  800498:	846e                	mv	s0,s11
  80049a:	bdd1                	j	80036e <vprintfmt+0x68>
  80049c:	864a                	mv	a2,s2
  80049e:	85a6                	mv	a1,s1
  8004a0:	02500513          	li	a0,37
  8004a4:	9982                	jalr	s3
  8004a6:	bd51                	j	80033a <vprintfmt+0x34>
  8004a8:	00144583          	lbu	a1,1(s0)
  8004ac:	2305                	addiw	t1,t1,1
  8004ae:	846e                	mv	s0,s11
  8004b0:	bd7d                	j	80036e <vprintfmt+0x68>
  8004b2:	4705                	li	a4,1
  8004b4:	008a8613          	addi	a2,s5,8
  8004b8:	00674463          	blt	a4,t1,8004c0 <vprintfmt+0x1ba>
  8004bc:	14030c63          	beqz	t1,800614 <vprintfmt+0x30e>
  8004c0:	000ab683          	ld	a3,0(s5)
  8004c4:	4721                	li	a4,8
  8004c6:	8ab2                	mv	s5,a2
  8004c8:	bf51                	j	80045c <vprintfmt+0x156>
  8004ca:	03000513          	li	a0,48
  8004ce:	864a                	mv	a2,s2
  8004d0:	85a6                	mv	a1,s1
  8004d2:	e042                	sd	a6,0(sp)
  8004d4:	9982                	jalr	s3
  8004d6:	864a                	mv	a2,s2
  8004d8:	85a6                	mv	a1,s1
  8004da:	07800513          	li	a0,120
  8004de:	9982                	jalr	s3
  8004e0:	0aa1                	addi	s5,s5,8
  8004e2:	6802                	ld	a6,0(sp)
  8004e4:	4741                	li	a4,16
  8004e6:	ff8ab683          	ld	a3,-8(s5)
  8004ea:	bf8d                	j	80045c <vprintfmt+0x156>
  8004ec:	000ab403          	ld	s0,0(s5)
  8004f0:	008a8793          	addi	a5,s5,8
  8004f4:	e03e                	sd	a5,0(sp)
  8004f6:	14040c63          	beqz	s0,80064e <vprintfmt+0x348>
  8004fa:	11805063          	blez	s8,8005fa <vprintfmt+0x2f4>
  8004fe:	02d00693          	li	a3,45
  800502:	0cd81963          	bne	a6,a3,8005d4 <vprintfmt+0x2ce>
  800506:	00044683          	lbu	a3,0(s0)
  80050a:	0006851b          	sext.w	a0,a3
  80050e:	ce8d                	beqz	a3,800548 <vprintfmt+0x242>
  800510:	00140a93          	addi	s5,s0,1
  800514:	05e00413          	li	s0,94
  800518:	000cc563          	bltz	s9,800522 <vprintfmt+0x21c>
  80051c:	3cfd                	addiw	s9,s9,-1
  80051e:	037c8363          	beq	s9,s7,800544 <vprintfmt+0x23e>
  800522:	864a                	mv	a2,s2
  800524:	85a6                	mv	a1,s1
  800526:	100d0663          	beqz	s10,800632 <vprintfmt+0x32c>
  80052a:	3681                	addiw	a3,a3,-32
  80052c:	10d47363          	bgeu	s0,a3,800632 <vprintfmt+0x32c>
  800530:	03f00513          	li	a0,63
  800534:	9982                	jalr	s3
  800536:	000ac683          	lbu	a3,0(s5)
  80053a:	3c7d                	addiw	s8,s8,-1
  80053c:	0a85                	addi	s5,s5,1
  80053e:	0006851b          	sext.w	a0,a3
  800542:	faf9                	bnez	a3,800518 <vprintfmt+0x212>
  800544:	01805a63          	blez	s8,800558 <vprintfmt+0x252>
  800548:	3c7d                	addiw	s8,s8,-1
  80054a:	864a                	mv	a2,s2
  80054c:	85a6                	mv	a1,s1
  80054e:	02000513          	li	a0,32
  800552:	9982                	jalr	s3
  800554:	fe0c1ae3          	bnez	s8,800548 <vprintfmt+0x242>
  800558:	6a82                	ld	s5,0(sp)
  80055a:	b3c5                	j	80033a <vprintfmt+0x34>
  80055c:	4705                	li	a4,1
  80055e:	008a8d13          	addi	s10,s5,8
  800562:	00674463          	blt	a4,t1,80056a <vprintfmt+0x264>
  800566:	0a030463          	beqz	t1,80060e <vprintfmt+0x308>
  80056a:	000ab403          	ld	s0,0(s5)
  80056e:	0c044463          	bltz	s0,800636 <vprintfmt+0x330>
  800572:	86a2                	mv	a3,s0
  800574:	8aea                	mv	s5,s10
  800576:	4729                	li	a4,10
  800578:	b5d5                	j	80045c <vprintfmt+0x156>
  80057a:	000aa783          	lw	a5,0(s5)
  80057e:	46e1                	li	a3,24
  800580:	0aa1                	addi	s5,s5,8
  800582:	41f7d71b          	sraiw	a4,a5,0x1f
  800586:	8fb9                	xor	a5,a5,a4
  800588:	40e7873b          	subw	a4,a5,a4
  80058c:	02e6c663          	blt	a3,a4,8005b8 <vprintfmt+0x2b2>
  800590:	00371793          	slli	a5,a4,0x3
  800594:	00000697          	auipc	a3,0x0
  800598:	5e468693          	addi	a3,a3,1508 # 800b78 <error_string>
  80059c:	97b6                	add	a5,a5,a3
  80059e:	639c                	ld	a5,0(a5)
  8005a0:	cf81                	beqz	a5,8005b8 <vprintfmt+0x2b2>
  8005a2:	873e                	mv	a4,a5
  8005a4:	00000697          	auipc	a3,0x0
  8005a8:	29c68693          	addi	a3,a3,668 # 800840 <main+0x19c>
  8005ac:	8626                	mv	a2,s1
  8005ae:	85ca                	mv	a1,s2
  8005b0:	854e                	mv	a0,s3
  8005b2:	0d4000ef          	jal	ra,800686 <printfmt>
  8005b6:	b351                	j	80033a <vprintfmt+0x34>
  8005b8:	00000697          	auipc	a3,0x0
  8005bc:	27868693          	addi	a3,a3,632 # 800830 <main+0x18c>
  8005c0:	8626                	mv	a2,s1
  8005c2:	85ca                	mv	a1,s2
  8005c4:	854e                	mv	a0,s3
  8005c6:	0c0000ef          	jal	ra,800686 <printfmt>
  8005ca:	bb85                	j	80033a <vprintfmt+0x34>
  8005cc:	00000417          	auipc	s0,0x0
  8005d0:	25c40413          	addi	s0,s0,604 # 800828 <main+0x184>
  8005d4:	85e6                	mv	a1,s9
  8005d6:	8522                	mv	a0,s0
  8005d8:	e442                	sd	a6,8(sp)
  8005da:	c9bff0ef          	jal	ra,800274 <strnlen>
  8005de:	40ac0c3b          	subw	s8,s8,a0
  8005e2:	01805c63          	blez	s8,8005fa <vprintfmt+0x2f4>
  8005e6:	6822                	ld	a6,8(sp)
  8005e8:	00080a9b          	sext.w	s5,a6
  8005ec:	3c7d                	addiw	s8,s8,-1
  8005ee:	864a                	mv	a2,s2
  8005f0:	85a6                	mv	a1,s1
  8005f2:	8556                	mv	a0,s5
  8005f4:	9982                	jalr	s3
  8005f6:	fe0c1be3          	bnez	s8,8005ec <vprintfmt+0x2e6>
  8005fa:	00044683          	lbu	a3,0(s0)
  8005fe:	00140a93          	addi	s5,s0,1
  800602:	0006851b          	sext.w	a0,a3
  800606:	daa9                	beqz	a3,800558 <vprintfmt+0x252>
  800608:	05e00413          	li	s0,94
  80060c:	b731                	j	800518 <vprintfmt+0x212>
  80060e:	000aa403          	lw	s0,0(s5)
  800612:	bfb1                	j	80056e <vprintfmt+0x268>
  800614:	000ae683          	lwu	a3,0(s5)
  800618:	4721                	li	a4,8
  80061a:	8ab2                	mv	s5,a2
  80061c:	b581                	j	80045c <vprintfmt+0x156>
  80061e:	000ae683          	lwu	a3,0(s5)
  800622:	4729                	li	a4,10
  800624:	8ab2                	mv	s5,a2
  800626:	bd1d                	j	80045c <vprintfmt+0x156>
  800628:	000ae683          	lwu	a3,0(s5)
  80062c:	4741                	li	a4,16
  80062e:	8ab2                	mv	s5,a2
  800630:	b535                	j	80045c <vprintfmt+0x156>
  800632:	9982                	jalr	s3
  800634:	b709                	j	800536 <vprintfmt+0x230>
  800636:	864a                	mv	a2,s2
  800638:	85a6                	mv	a1,s1
  80063a:	02d00513          	li	a0,45
  80063e:	e042                	sd	a6,0(sp)
  800640:	9982                	jalr	s3
  800642:	6802                	ld	a6,0(sp)
  800644:	8aea                	mv	s5,s10
  800646:	408006b3          	neg	a3,s0
  80064a:	4729                	li	a4,10
  80064c:	bd01                	j	80045c <vprintfmt+0x156>
  80064e:	03805163          	blez	s8,800670 <vprintfmt+0x36a>
  800652:	02d00693          	li	a3,45
  800656:	f6d81be3          	bne	a6,a3,8005cc <vprintfmt+0x2c6>
  80065a:	00000417          	auipc	s0,0x0
  80065e:	1ce40413          	addi	s0,s0,462 # 800828 <main+0x184>
  800662:	02800693          	li	a3,40
  800666:	02800513          	li	a0,40
  80066a:	00140a93          	addi	s5,s0,1
  80066e:	b55d                	j	800514 <vprintfmt+0x20e>
  800670:	00000a97          	auipc	s5,0x0
  800674:	1b9a8a93          	addi	s5,s5,441 # 800829 <main+0x185>
  800678:	02800513          	li	a0,40
  80067c:	02800693          	li	a3,40
  800680:	05e00413          	li	s0,94
  800684:	bd51                	j	800518 <vprintfmt+0x212>

0000000000800686 <printfmt>:
  800686:	7139                	addi	sp,sp,-64
  800688:	02010313          	addi	t1,sp,32
  80068c:	f03a                	sd	a4,32(sp)
  80068e:	871a                	mv	a4,t1
  800690:	ec06                	sd	ra,24(sp)
  800692:	f43e                	sd	a5,40(sp)
  800694:	f842                	sd	a6,48(sp)
  800696:	fc46                	sd	a7,56(sp)
  800698:	e41a                	sd	t1,8(sp)
  80069a:	c6dff0ef          	jal	ra,800306 <vprintfmt>
  80069e:	60e2                	ld	ra,24(sp)
  8006a0:	6121                	addi	sp,sp,64
  8006a2:	8082                	ret

00000000008006a4 <main>:
  8006a4:	1101                	addi	sp,sp,-32
  8006a6:	e822                	sd	s0,16(sp)
  8006a8:	e426                	sd	s1,8(sp)
  8006aa:	ec06                	sd	ra,24(sp)
  8006ac:	4401                	li	s0,0
  8006ae:	02000493          	li	s1,32
  8006b2:	a77ff0ef          	jal	ra,800128 <fork>
  8006b6:	cd05                	beqz	a0,8006ee <main+0x4a>
  8006b8:	06a05063          	blez	a0,800718 <main+0x74>
  8006bc:	2405                	addiw	s0,s0,1
  8006be:	fe941ae3          	bne	s0,s1,8006b2 <main+0xe>
  8006c2:	02000413          	li	s0,32
  8006c6:	a65ff0ef          	jal	ra,80012a <wait>
  8006ca:	ed05                	bnez	a0,800702 <main+0x5e>
  8006cc:	347d                	addiw	s0,s0,-1
  8006ce:	fc65                	bnez	s0,8006c6 <main+0x22>
  8006d0:	a5bff0ef          	jal	ra,80012a <wait>
  8006d4:	c12d                	beqz	a0,800736 <main+0x92>
  8006d6:	00000517          	auipc	a0,0x0
  8006da:	5da50513          	addi	a0,a0,1498 # 800cb0 <error_string+0x138>
  8006de:	aa3ff0ef          	jal	ra,800180 <cprintf>
  8006e2:	60e2                	ld	ra,24(sp)
  8006e4:	6442                	ld	s0,16(sp)
  8006e6:	64a2                	ld	s1,8(sp)
  8006e8:	4501                	li	a0,0
  8006ea:	6105                	addi	sp,sp,32
  8006ec:	8082                	ret
  8006ee:	85a2                	mv	a1,s0
  8006f0:	00000517          	auipc	a0,0x0
  8006f4:	55050513          	addi	a0,a0,1360 # 800c40 <error_string+0xc8>
  8006f8:	a89ff0ef          	jal	ra,800180 <cprintf>
  8006fc:	4501                	li	a0,0
  8006fe:	a15ff0ef          	jal	ra,800112 <exit>
  800702:	00000617          	auipc	a2,0x0
  800706:	57e60613          	addi	a2,a2,1406 # 800c80 <error_string+0x108>
  80070a:	45dd                	li	a1,23
  80070c:	00000517          	auipc	a0,0x0
  800710:	56450513          	addi	a0,a0,1380 # 800c70 <error_string+0xf8>
  800714:	90dff0ef          	jal	ra,800020 <__panic>
  800718:	00000697          	auipc	a3,0x0
  80071c:	53868693          	addi	a3,a3,1336 # 800c50 <error_string+0xd8>
  800720:	00000617          	auipc	a2,0x0
  800724:	53860613          	addi	a2,a2,1336 # 800c58 <error_string+0xe0>
  800728:	45b9                	li	a1,14
  80072a:	00000517          	auipc	a0,0x0
  80072e:	54650513          	addi	a0,a0,1350 # 800c70 <error_string+0xf8>
  800732:	8efff0ef          	jal	ra,800020 <__panic>
  800736:	00000617          	auipc	a2,0x0
  80073a:	56260613          	addi	a2,a2,1378 # 800c98 <error_string+0x120>
  80073e:	45f1                	li	a1,28
  800740:	00000517          	auipc	a0,0x0
  800744:	53050513          	addi	a0,a0,1328 # 800c70 <error_string+0xf8>
  800748:	8d9ff0ef          	jal	ra,800020 <__panic>
