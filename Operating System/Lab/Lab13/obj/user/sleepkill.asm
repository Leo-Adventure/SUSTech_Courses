
obj/__user_sleepkill.out:     file format elf64-littleriscv


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
  800034:	70050513          	addi	a0,a0,1792 # 800730 <main+0x86>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	142000ef          	jal	ra,800186 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	114000ef          	jal	ra,800160 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	75850513          	addi	a0,a0,1880 # 8007a8 <main+0xfe>
  800058:	12e000ef          	jal	ra,800186 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0b8000ef          	jal	ra,800116 <exit>

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
  800076:	6de50513          	addi	a0,a0,1758 # 800750 <main+0xa6>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	100000ef          	jal	ra,800186 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0d2000ef          	jal	ra,800160 <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	71650513          	addi	a0,a0,1814 # 8007a8 <main+0xfe>
  80009a:	0ec000ef          	jal	ra,800186 <cprintf>
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

00000000008000e8 <sys_kill>:
  8000e8:	85aa                	mv	a1,a0
  8000ea:	4531                	li	a0,12
  8000ec:	bf6d                	j	8000a6 <syscall>

00000000008000ee <sys_putc>:
  8000ee:	85aa                	mv	a1,a0
  8000f0:	4579                	li	a0,30
  8000f2:	bf55                	j	8000a6 <syscall>

00000000008000f4 <sys_sleep>:
  8000f4:	85aa                	mv	a1,a0
  8000f6:	452d                	li	a0,11
  8000f8:	b77d                	j	8000a6 <syscall>

00000000008000fa <sys_open>:
  8000fa:	862e                	mv	a2,a1
  8000fc:	85aa                	mv	a1,a0
  8000fe:	06400513          	li	a0,100
  800102:	b755                	j	8000a6 <syscall>

0000000000800104 <sys_close>:
  800104:	85aa                	mv	a1,a0
  800106:	06500513          	li	a0,101
  80010a:	bf71                	j	8000a6 <syscall>

000000000080010c <sys_dup>:
  80010c:	862e                	mv	a2,a1
  80010e:	85aa                	mv	a1,a0
  800110:	08200513          	li	a0,130
  800114:	bf49                	j	8000a6 <syscall>

0000000000800116 <exit>:
  800116:	1141                	addi	sp,sp,-16
  800118:	e406                	sd	ra,8(sp)
  80011a:	fc5ff0ef          	jal	ra,8000de <sys_exit>
  80011e:	00000517          	auipc	a0,0x0
  800122:	65250513          	addi	a0,a0,1618 # 800770 <main+0xc6>
  800126:	060000ef          	jal	ra,800186 <cprintf>
  80012a:	a001                	j	80012a <exit+0x14>

000000000080012c <fork>:
  80012c:	bf65                	j	8000e4 <sys_fork>

000000000080012e <kill>:
  80012e:	bf6d                	j	8000e8 <sys_kill>

0000000000800130 <sleep>:
  800130:	1502                	slli	a0,a0,0x20
  800132:	9101                	srli	a0,a0,0x20
  800134:	b7c1                	j	8000f4 <sys_sleep>

0000000000800136 <_start>:
  800136:	0d0000ef          	jal	ra,800206 <umain>
  80013a:	a001                	j	80013a <_start+0x4>

000000000080013c <open>:
  80013c:	1582                	slli	a1,a1,0x20
  80013e:	9181                	srli	a1,a1,0x20
  800140:	bf6d                	j	8000fa <sys_open>

0000000000800142 <close>:
  800142:	b7c9                	j	800104 <sys_close>

0000000000800144 <dup2>:
  800144:	b7e1                	j	80010c <sys_dup>

0000000000800146 <cputch>:
  800146:	1141                	addi	sp,sp,-16
  800148:	e022                	sd	s0,0(sp)
  80014a:	e406                	sd	ra,8(sp)
  80014c:	842e                	mv	s0,a1
  80014e:	fa1ff0ef          	jal	ra,8000ee <sys_putc>
  800152:	401c                	lw	a5,0(s0)
  800154:	60a2                	ld	ra,8(sp)
  800156:	2785                	addiw	a5,a5,1
  800158:	c01c                	sw	a5,0(s0)
  80015a:	6402                	ld	s0,0(sp)
  80015c:	0141                	addi	sp,sp,16
  80015e:	8082                	ret

0000000000800160 <vcprintf>:
  800160:	1101                	addi	sp,sp,-32
  800162:	872e                	mv	a4,a1
  800164:	75dd                	lui	a1,0xffff7
  800166:	86aa                	mv	a3,a0
  800168:	0070                	addi	a2,sp,12
  80016a:	00000517          	auipc	a0,0x0
  80016e:	fdc50513          	addi	a0,a0,-36 # 800146 <cputch>
  800172:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f81>
  800176:	ec06                	sd	ra,24(sp)
  800178:	c602                	sw	zero,12(sp)
  80017a:	192000ef          	jal	ra,80030c <vprintfmt>
  80017e:	60e2                	ld	ra,24(sp)
  800180:	4532                	lw	a0,12(sp)
  800182:	6105                	addi	sp,sp,32
  800184:	8082                	ret

0000000000800186 <cprintf>:
  800186:	711d                	addi	sp,sp,-96
  800188:	02810313          	addi	t1,sp,40
  80018c:	8e2a                	mv	t3,a0
  80018e:	f42e                	sd	a1,40(sp)
  800190:	75dd                	lui	a1,0xffff7
  800192:	f832                	sd	a2,48(sp)
  800194:	fc36                	sd	a3,56(sp)
  800196:	e0ba                	sd	a4,64(sp)
  800198:	00000517          	auipc	a0,0x0
  80019c:	fae50513          	addi	a0,a0,-82 # 800146 <cputch>
  8001a0:	0050                	addi	a2,sp,4
  8001a2:	871a                	mv	a4,t1
  8001a4:	86f2                	mv	a3,t3
  8001a6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f81>
  8001aa:	ec06                	sd	ra,24(sp)
  8001ac:	e4be                	sd	a5,72(sp)
  8001ae:	e8c2                	sd	a6,80(sp)
  8001b0:	ecc6                	sd	a7,88(sp)
  8001b2:	e41a                	sd	t1,8(sp)
  8001b4:	c202                	sw	zero,4(sp)
  8001b6:	156000ef          	jal	ra,80030c <vprintfmt>
  8001ba:	60e2                	ld	ra,24(sp)
  8001bc:	4512                	lw	a0,4(sp)
  8001be:	6125                	addi	sp,sp,96
  8001c0:	8082                	ret

00000000008001c2 <initfd>:
  8001c2:	1101                	addi	sp,sp,-32
  8001c4:	87ae                	mv	a5,a1
  8001c6:	e426                	sd	s1,8(sp)
  8001c8:	85b2                	mv	a1,a2
  8001ca:	84aa                	mv	s1,a0
  8001cc:	853e                	mv	a0,a5
  8001ce:	e822                	sd	s0,16(sp)
  8001d0:	ec06                	sd	ra,24(sp)
  8001d2:	f6bff0ef          	jal	ra,80013c <open>
  8001d6:	842a                	mv	s0,a0
  8001d8:	00054463          	bltz	a0,8001e0 <initfd+0x1e>
  8001dc:	00951863          	bne	a0,s1,8001ec <initfd+0x2a>
  8001e0:	60e2                	ld	ra,24(sp)
  8001e2:	8522                	mv	a0,s0
  8001e4:	6442                	ld	s0,16(sp)
  8001e6:	64a2                	ld	s1,8(sp)
  8001e8:	6105                	addi	sp,sp,32
  8001ea:	8082                	ret
  8001ec:	8526                	mv	a0,s1
  8001ee:	f55ff0ef          	jal	ra,800142 <close>
  8001f2:	85a6                	mv	a1,s1
  8001f4:	8522                	mv	a0,s0
  8001f6:	f4fff0ef          	jal	ra,800144 <dup2>
  8001fa:	84aa                	mv	s1,a0
  8001fc:	8522                	mv	a0,s0
  8001fe:	f45ff0ef          	jal	ra,800142 <close>
  800202:	8426                	mv	s0,s1
  800204:	bff1                	j	8001e0 <initfd+0x1e>

0000000000800206 <umain>:
  800206:	1101                	addi	sp,sp,-32
  800208:	e822                	sd	s0,16(sp)
  80020a:	e426                	sd	s1,8(sp)
  80020c:	842a                	mv	s0,a0
  80020e:	84ae                	mv	s1,a1
  800210:	4601                	li	a2,0
  800212:	00000597          	auipc	a1,0x0
  800216:	57658593          	addi	a1,a1,1398 # 800788 <main+0xde>
  80021a:	4501                	li	a0,0
  80021c:	ec06                	sd	ra,24(sp)
  80021e:	fa5ff0ef          	jal	ra,8001c2 <initfd>
  800222:	02054263          	bltz	a0,800246 <umain+0x40>
  800226:	4605                	li	a2,1
  800228:	00000597          	auipc	a1,0x0
  80022c:	5a058593          	addi	a1,a1,1440 # 8007c8 <main+0x11e>
  800230:	4505                	li	a0,1
  800232:	f91ff0ef          	jal	ra,8001c2 <initfd>
  800236:	02054563          	bltz	a0,800260 <umain+0x5a>
  80023a:	85a6                	mv	a1,s1
  80023c:	8522                	mv	a0,s0
  80023e:	46c000ef          	jal	ra,8006aa <main>
  800242:	ed5ff0ef          	jal	ra,800116 <exit>
  800246:	86aa                	mv	a3,a0
  800248:	00000617          	auipc	a2,0x0
  80024c:	54860613          	addi	a2,a2,1352 # 800790 <main+0xe6>
  800250:	45e9                	li	a1,26
  800252:	00000517          	auipc	a0,0x0
  800256:	55e50513          	addi	a0,a0,1374 # 8007b0 <main+0x106>
  80025a:	e09ff0ef          	jal	ra,800062 <__warn>
  80025e:	b7e1                	j	800226 <umain+0x20>
  800260:	86aa                	mv	a3,a0
  800262:	00000617          	auipc	a2,0x0
  800266:	56e60613          	addi	a2,a2,1390 # 8007d0 <main+0x126>
  80026a:	45f5                	li	a1,29
  80026c:	00000517          	auipc	a0,0x0
  800270:	54450513          	addi	a0,a0,1348 # 8007b0 <main+0x106>
  800274:	defff0ef          	jal	ra,800062 <__warn>
  800278:	b7c9                	j	80023a <umain+0x34>

000000000080027a <strnlen>:
  80027a:	872a                	mv	a4,a0
  80027c:	4501                	li	a0,0
  80027e:	e589                	bnez	a1,800288 <strnlen+0xe>
  800280:	a811                	j	800294 <strnlen+0x1a>
  800282:	0505                	addi	a0,a0,1
  800284:	00a58763          	beq	a1,a0,800292 <strnlen+0x18>
  800288:	00a707b3          	add	a5,a4,a0
  80028c:	0007c783          	lbu	a5,0(a5)
  800290:	fbed                	bnez	a5,800282 <strnlen+0x8>
  800292:	8082                	ret
  800294:	8082                	ret

0000000000800296 <printnum>:
  800296:	02071893          	slli	a7,a4,0x20
  80029a:	7139                	addi	sp,sp,-64
  80029c:	0208d893          	srli	a7,a7,0x20
  8002a0:	e456                	sd	s5,8(sp)
  8002a2:	0316fab3          	remu	s5,a3,a7
  8002a6:	f822                	sd	s0,48(sp)
  8002a8:	f426                	sd	s1,40(sp)
  8002aa:	f04a                	sd	s2,32(sp)
  8002ac:	ec4e                	sd	s3,24(sp)
  8002ae:	fc06                	sd	ra,56(sp)
  8002b0:	e852                	sd	s4,16(sp)
  8002b2:	84aa                	mv	s1,a0
  8002b4:	89ae                	mv	s3,a1
  8002b6:	8932                	mv	s2,a2
  8002b8:	fff7841b          	addiw	s0,a5,-1
  8002bc:	2a81                	sext.w	s5,s5
  8002be:	0516f163          	bgeu	a3,a7,800300 <printnum+0x6a>
  8002c2:	8a42                	mv	s4,a6
  8002c4:	00805863          	blez	s0,8002d4 <printnum+0x3e>
  8002c8:	347d                	addiw	s0,s0,-1
  8002ca:	864e                	mv	a2,s3
  8002cc:	85ca                	mv	a1,s2
  8002ce:	8552                	mv	a0,s4
  8002d0:	9482                	jalr	s1
  8002d2:	f87d                	bnez	s0,8002c8 <printnum+0x32>
  8002d4:	1a82                	slli	s5,s5,0x20
  8002d6:	020ada93          	srli	s5,s5,0x20
  8002da:	00000797          	auipc	a5,0x0
  8002de:	51678793          	addi	a5,a5,1302 # 8007f0 <main+0x146>
  8002e2:	7442                	ld	s0,48(sp)
  8002e4:	9abe                	add	s5,s5,a5
  8002e6:	000ac503          	lbu	a0,0(s5)
  8002ea:	70e2                	ld	ra,56(sp)
  8002ec:	6a42                	ld	s4,16(sp)
  8002ee:	6aa2                	ld	s5,8(sp)
  8002f0:	864e                	mv	a2,s3
  8002f2:	85ca                	mv	a1,s2
  8002f4:	69e2                	ld	s3,24(sp)
  8002f6:	7902                	ld	s2,32(sp)
  8002f8:	8326                	mv	t1,s1
  8002fa:	74a2                	ld	s1,40(sp)
  8002fc:	6121                	addi	sp,sp,64
  8002fe:	8302                	jr	t1
  800300:	0316d6b3          	divu	a3,a3,a7
  800304:	87a2                	mv	a5,s0
  800306:	f91ff0ef          	jal	ra,800296 <printnum>
  80030a:	b7e9                	j	8002d4 <printnum+0x3e>

000000000080030c <vprintfmt>:
  80030c:	7119                	addi	sp,sp,-128
  80030e:	f4a6                	sd	s1,104(sp)
  800310:	f0ca                	sd	s2,96(sp)
  800312:	ecce                	sd	s3,88(sp)
  800314:	e8d2                	sd	s4,80(sp)
  800316:	e4d6                	sd	s5,72(sp)
  800318:	e0da                	sd	s6,64(sp)
  80031a:	fc5e                	sd	s7,56(sp)
  80031c:	ec6e                	sd	s11,24(sp)
  80031e:	fc86                	sd	ra,120(sp)
  800320:	f8a2                	sd	s0,112(sp)
  800322:	f862                	sd	s8,48(sp)
  800324:	f466                	sd	s9,40(sp)
  800326:	f06a                	sd	s10,32(sp)
  800328:	89aa                	mv	s3,a0
  80032a:	892e                	mv	s2,a1
  80032c:	84b2                	mv	s1,a2
  80032e:	8db6                	mv	s11,a3
  800330:	8aba                	mv	s5,a4
  800332:	02500a13          	li	s4,37
  800336:	5bfd                	li	s7,-1
  800338:	00000b17          	auipc	s6,0x0
  80033c:	4ecb0b13          	addi	s6,s6,1260 # 800824 <main+0x17a>
  800340:	000dc503          	lbu	a0,0(s11)
  800344:	001d8413          	addi	s0,s11,1
  800348:	01450b63          	beq	a0,s4,80035e <vprintfmt+0x52>
  80034c:	c129                	beqz	a0,80038e <vprintfmt+0x82>
  80034e:	864a                	mv	a2,s2
  800350:	85a6                	mv	a1,s1
  800352:	0405                	addi	s0,s0,1
  800354:	9982                	jalr	s3
  800356:	fff44503          	lbu	a0,-1(s0)
  80035a:	ff4519e3          	bne	a0,s4,80034c <vprintfmt+0x40>
  80035e:	00044583          	lbu	a1,0(s0)
  800362:	02000813          	li	a6,32
  800366:	4d01                	li	s10,0
  800368:	4301                	li	t1,0
  80036a:	5cfd                	li	s9,-1
  80036c:	5c7d                	li	s8,-1
  80036e:	05500513          	li	a0,85
  800372:	48a5                	li	a7,9
  800374:	fdd5861b          	addiw	a2,a1,-35
  800378:	0ff67613          	andi	a2,a2,255
  80037c:	00140d93          	addi	s11,s0,1
  800380:	04c56263          	bltu	a0,a2,8003c4 <vprintfmt+0xb8>
  800384:	060a                	slli	a2,a2,0x2
  800386:	965a                	add	a2,a2,s6
  800388:	4214                	lw	a3,0(a2)
  80038a:	96da                	add	a3,a3,s6
  80038c:	8682                	jr	a3
  80038e:	70e6                	ld	ra,120(sp)
  800390:	7446                	ld	s0,112(sp)
  800392:	74a6                	ld	s1,104(sp)
  800394:	7906                	ld	s2,96(sp)
  800396:	69e6                	ld	s3,88(sp)
  800398:	6a46                	ld	s4,80(sp)
  80039a:	6aa6                	ld	s5,72(sp)
  80039c:	6b06                	ld	s6,64(sp)
  80039e:	7be2                	ld	s7,56(sp)
  8003a0:	7c42                	ld	s8,48(sp)
  8003a2:	7ca2                	ld	s9,40(sp)
  8003a4:	7d02                	ld	s10,32(sp)
  8003a6:	6de2                	ld	s11,24(sp)
  8003a8:	6109                	addi	sp,sp,128
  8003aa:	8082                	ret
  8003ac:	882e                	mv	a6,a1
  8003ae:	00144583          	lbu	a1,1(s0)
  8003b2:	846e                	mv	s0,s11
  8003b4:	00140d93          	addi	s11,s0,1
  8003b8:	fdd5861b          	addiw	a2,a1,-35
  8003bc:	0ff67613          	andi	a2,a2,255
  8003c0:	fcc572e3          	bgeu	a0,a2,800384 <vprintfmt+0x78>
  8003c4:	864a                	mv	a2,s2
  8003c6:	85a6                	mv	a1,s1
  8003c8:	02500513          	li	a0,37
  8003cc:	9982                	jalr	s3
  8003ce:	fff44783          	lbu	a5,-1(s0)
  8003d2:	8da2                	mv	s11,s0
  8003d4:	f74786e3          	beq	a5,s4,800340 <vprintfmt+0x34>
  8003d8:	ffedc783          	lbu	a5,-2(s11)
  8003dc:	1dfd                	addi	s11,s11,-1
  8003de:	ff479de3          	bne	a5,s4,8003d8 <vprintfmt+0xcc>
  8003e2:	bfb9                	j	800340 <vprintfmt+0x34>
  8003e4:	fd058c9b          	addiw	s9,a1,-48
  8003e8:	00144583          	lbu	a1,1(s0)
  8003ec:	846e                	mv	s0,s11
  8003ee:	fd05869b          	addiw	a3,a1,-48
  8003f2:	0005861b          	sext.w	a2,a1
  8003f6:	02d8e463          	bltu	a7,a3,80041e <vprintfmt+0x112>
  8003fa:	00144583          	lbu	a1,1(s0)
  8003fe:	002c969b          	slliw	a3,s9,0x2
  800402:	0196873b          	addw	a4,a3,s9
  800406:	0017171b          	slliw	a4,a4,0x1
  80040a:	9f31                	addw	a4,a4,a2
  80040c:	fd05869b          	addiw	a3,a1,-48
  800410:	0405                	addi	s0,s0,1
  800412:	fd070c9b          	addiw	s9,a4,-48
  800416:	0005861b          	sext.w	a2,a1
  80041a:	fed8f0e3          	bgeu	a7,a3,8003fa <vprintfmt+0xee>
  80041e:	f40c5be3          	bgez	s8,800374 <vprintfmt+0x68>
  800422:	8c66                	mv	s8,s9
  800424:	5cfd                	li	s9,-1
  800426:	b7b9                	j	800374 <vprintfmt+0x68>
  800428:	fffc4693          	not	a3,s8
  80042c:	96fd                	srai	a3,a3,0x3f
  80042e:	00dc77b3          	and	a5,s8,a3
  800432:	00144583          	lbu	a1,1(s0)
  800436:	00078c1b          	sext.w	s8,a5
  80043a:	846e                	mv	s0,s11
  80043c:	bf25                	j	800374 <vprintfmt+0x68>
  80043e:	000aac83          	lw	s9,0(s5)
  800442:	00144583          	lbu	a1,1(s0)
  800446:	0aa1                	addi	s5,s5,8
  800448:	846e                	mv	s0,s11
  80044a:	bfd1                	j	80041e <vprintfmt+0x112>
  80044c:	4705                	li	a4,1
  80044e:	008a8613          	addi	a2,s5,8
  800452:	00674463          	blt	a4,t1,80045a <vprintfmt+0x14e>
  800456:	1c030c63          	beqz	t1,80062e <vprintfmt+0x322>
  80045a:	000ab683          	ld	a3,0(s5)
  80045e:	4741                	li	a4,16
  800460:	8ab2                	mv	s5,a2
  800462:	2801                	sext.w	a6,a6
  800464:	87e2                	mv	a5,s8
  800466:	8626                	mv	a2,s1
  800468:	85ca                	mv	a1,s2
  80046a:	854e                	mv	a0,s3
  80046c:	e2bff0ef          	jal	ra,800296 <printnum>
  800470:	bdc1                	j	800340 <vprintfmt+0x34>
  800472:	000aa503          	lw	a0,0(s5)
  800476:	864a                	mv	a2,s2
  800478:	85a6                	mv	a1,s1
  80047a:	0aa1                	addi	s5,s5,8
  80047c:	9982                	jalr	s3
  80047e:	b5c9                	j	800340 <vprintfmt+0x34>
  800480:	4705                	li	a4,1
  800482:	008a8613          	addi	a2,s5,8
  800486:	00674463          	blt	a4,t1,80048e <vprintfmt+0x182>
  80048a:	18030d63          	beqz	t1,800624 <vprintfmt+0x318>
  80048e:	000ab683          	ld	a3,0(s5)
  800492:	4729                	li	a4,10
  800494:	8ab2                	mv	s5,a2
  800496:	b7f1                	j	800462 <vprintfmt+0x156>
  800498:	00144583          	lbu	a1,1(s0)
  80049c:	4d05                	li	s10,1
  80049e:	846e                	mv	s0,s11
  8004a0:	bdd1                	j	800374 <vprintfmt+0x68>
  8004a2:	864a                	mv	a2,s2
  8004a4:	85a6                	mv	a1,s1
  8004a6:	02500513          	li	a0,37
  8004aa:	9982                	jalr	s3
  8004ac:	bd51                	j	800340 <vprintfmt+0x34>
  8004ae:	00144583          	lbu	a1,1(s0)
  8004b2:	2305                	addiw	t1,t1,1
  8004b4:	846e                	mv	s0,s11
  8004b6:	bd7d                	j	800374 <vprintfmt+0x68>
  8004b8:	4705                	li	a4,1
  8004ba:	008a8613          	addi	a2,s5,8
  8004be:	00674463          	blt	a4,t1,8004c6 <vprintfmt+0x1ba>
  8004c2:	14030c63          	beqz	t1,80061a <vprintfmt+0x30e>
  8004c6:	000ab683          	ld	a3,0(s5)
  8004ca:	4721                	li	a4,8
  8004cc:	8ab2                	mv	s5,a2
  8004ce:	bf51                	j	800462 <vprintfmt+0x156>
  8004d0:	03000513          	li	a0,48
  8004d4:	864a                	mv	a2,s2
  8004d6:	85a6                	mv	a1,s1
  8004d8:	e042                	sd	a6,0(sp)
  8004da:	9982                	jalr	s3
  8004dc:	864a                	mv	a2,s2
  8004de:	85a6                	mv	a1,s1
  8004e0:	07800513          	li	a0,120
  8004e4:	9982                	jalr	s3
  8004e6:	0aa1                	addi	s5,s5,8
  8004e8:	6802                	ld	a6,0(sp)
  8004ea:	4741                	li	a4,16
  8004ec:	ff8ab683          	ld	a3,-8(s5)
  8004f0:	bf8d                	j	800462 <vprintfmt+0x156>
  8004f2:	000ab403          	ld	s0,0(s5)
  8004f6:	008a8793          	addi	a5,s5,8
  8004fa:	e03e                	sd	a5,0(sp)
  8004fc:	14040c63          	beqz	s0,800654 <vprintfmt+0x348>
  800500:	11805063          	blez	s8,800600 <vprintfmt+0x2f4>
  800504:	02d00693          	li	a3,45
  800508:	0cd81963          	bne	a6,a3,8005da <vprintfmt+0x2ce>
  80050c:	00044683          	lbu	a3,0(s0)
  800510:	0006851b          	sext.w	a0,a3
  800514:	ce8d                	beqz	a3,80054e <vprintfmt+0x242>
  800516:	00140a93          	addi	s5,s0,1
  80051a:	05e00413          	li	s0,94
  80051e:	000cc563          	bltz	s9,800528 <vprintfmt+0x21c>
  800522:	3cfd                	addiw	s9,s9,-1
  800524:	037c8363          	beq	s9,s7,80054a <vprintfmt+0x23e>
  800528:	864a                	mv	a2,s2
  80052a:	85a6                	mv	a1,s1
  80052c:	100d0663          	beqz	s10,800638 <vprintfmt+0x32c>
  800530:	3681                	addiw	a3,a3,-32
  800532:	10d47363          	bgeu	s0,a3,800638 <vprintfmt+0x32c>
  800536:	03f00513          	li	a0,63
  80053a:	9982                	jalr	s3
  80053c:	000ac683          	lbu	a3,0(s5)
  800540:	3c7d                	addiw	s8,s8,-1
  800542:	0a85                	addi	s5,s5,1
  800544:	0006851b          	sext.w	a0,a3
  800548:	faf9                	bnez	a3,80051e <vprintfmt+0x212>
  80054a:	01805a63          	blez	s8,80055e <vprintfmt+0x252>
  80054e:	3c7d                	addiw	s8,s8,-1
  800550:	864a                	mv	a2,s2
  800552:	85a6                	mv	a1,s1
  800554:	02000513          	li	a0,32
  800558:	9982                	jalr	s3
  80055a:	fe0c1ae3          	bnez	s8,80054e <vprintfmt+0x242>
  80055e:	6a82                	ld	s5,0(sp)
  800560:	b3c5                	j	800340 <vprintfmt+0x34>
  800562:	4705                	li	a4,1
  800564:	008a8d13          	addi	s10,s5,8
  800568:	00674463          	blt	a4,t1,800570 <vprintfmt+0x264>
  80056c:	0a030463          	beqz	t1,800614 <vprintfmt+0x308>
  800570:	000ab403          	ld	s0,0(s5)
  800574:	0c044463          	bltz	s0,80063c <vprintfmt+0x330>
  800578:	86a2                	mv	a3,s0
  80057a:	8aea                	mv	s5,s10
  80057c:	4729                	li	a4,10
  80057e:	b5d5                	j	800462 <vprintfmt+0x156>
  800580:	000aa783          	lw	a5,0(s5)
  800584:	46e1                	li	a3,24
  800586:	0aa1                	addi	s5,s5,8
  800588:	41f7d71b          	sraiw	a4,a5,0x1f
  80058c:	8fb9                	xor	a5,a5,a4
  80058e:	40e7873b          	subw	a4,a5,a4
  800592:	02e6c663          	blt	a3,a4,8005be <vprintfmt+0x2b2>
  800596:	00371793          	slli	a5,a4,0x3
  80059a:	00000697          	auipc	a3,0x0
  80059e:	5be68693          	addi	a3,a3,1470 # 800b58 <error_string>
  8005a2:	97b6                	add	a5,a5,a3
  8005a4:	639c                	ld	a5,0(a5)
  8005a6:	cf81                	beqz	a5,8005be <vprintfmt+0x2b2>
  8005a8:	873e                	mv	a4,a5
  8005aa:	00000697          	auipc	a3,0x0
  8005ae:	27668693          	addi	a3,a3,630 # 800820 <main+0x176>
  8005b2:	8626                	mv	a2,s1
  8005b4:	85ca                	mv	a1,s2
  8005b6:	854e                	mv	a0,s3
  8005b8:	0d4000ef          	jal	ra,80068c <printfmt>
  8005bc:	b351                	j	800340 <vprintfmt+0x34>
  8005be:	00000697          	auipc	a3,0x0
  8005c2:	25268693          	addi	a3,a3,594 # 800810 <main+0x166>
  8005c6:	8626                	mv	a2,s1
  8005c8:	85ca                	mv	a1,s2
  8005ca:	854e                	mv	a0,s3
  8005cc:	0c0000ef          	jal	ra,80068c <printfmt>
  8005d0:	bb85                	j	800340 <vprintfmt+0x34>
  8005d2:	00000417          	auipc	s0,0x0
  8005d6:	23640413          	addi	s0,s0,566 # 800808 <main+0x15e>
  8005da:	85e6                	mv	a1,s9
  8005dc:	8522                	mv	a0,s0
  8005de:	e442                	sd	a6,8(sp)
  8005e0:	c9bff0ef          	jal	ra,80027a <strnlen>
  8005e4:	40ac0c3b          	subw	s8,s8,a0
  8005e8:	01805c63          	blez	s8,800600 <vprintfmt+0x2f4>
  8005ec:	6822                	ld	a6,8(sp)
  8005ee:	00080a9b          	sext.w	s5,a6
  8005f2:	3c7d                	addiw	s8,s8,-1
  8005f4:	864a                	mv	a2,s2
  8005f6:	85a6                	mv	a1,s1
  8005f8:	8556                	mv	a0,s5
  8005fa:	9982                	jalr	s3
  8005fc:	fe0c1be3          	bnez	s8,8005f2 <vprintfmt+0x2e6>
  800600:	00044683          	lbu	a3,0(s0)
  800604:	00140a93          	addi	s5,s0,1
  800608:	0006851b          	sext.w	a0,a3
  80060c:	daa9                	beqz	a3,80055e <vprintfmt+0x252>
  80060e:	05e00413          	li	s0,94
  800612:	b731                	j	80051e <vprintfmt+0x212>
  800614:	000aa403          	lw	s0,0(s5)
  800618:	bfb1                	j	800574 <vprintfmt+0x268>
  80061a:	000ae683          	lwu	a3,0(s5)
  80061e:	4721                	li	a4,8
  800620:	8ab2                	mv	s5,a2
  800622:	b581                	j	800462 <vprintfmt+0x156>
  800624:	000ae683          	lwu	a3,0(s5)
  800628:	4729                	li	a4,10
  80062a:	8ab2                	mv	s5,a2
  80062c:	bd1d                	j	800462 <vprintfmt+0x156>
  80062e:	000ae683          	lwu	a3,0(s5)
  800632:	4741                	li	a4,16
  800634:	8ab2                	mv	s5,a2
  800636:	b535                	j	800462 <vprintfmt+0x156>
  800638:	9982                	jalr	s3
  80063a:	b709                	j	80053c <vprintfmt+0x230>
  80063c:	864a                	mv	a2,s2
  80063e:	85a6                	mv	a1,s1
  800640:	02d00513          	li	a0,45
  800644:	e042                	sd	a6,0(sp)
  800646:	9982                	jalr	s3
  800648:	6802                	ld	a6,0(sp)
  80064a:	8aea                	mv	s5,s10
  80064c:	408006b3          	neg	a3,s0
  800650:	4729                	li	a4,10
  800652:	bd01                	j	800462 <vprintfmt+0x156>
  800654:	03805163          	blez	s8,800676 <vprintfmt+0x36a>
  800658:	02d00693          	li	a3,45
  80065c:	f6d81be3          	bne	a6,a3,8005d2 <vprintfmt+0x2c6>
  800660:	00000417          	auipc	s0,0x0
  800664:	1a840413          	addi	s0,s0,424 # 800808 <main+0x15e>
  800668:	02800693          	li	a3,40
  80066c:	02800513          	li	a0,40
  800670:	00140a93          	addi	s5,s0,1
  800674:	b55d                	j	80051a <vprintfmt+0x20e>
  800676:	00000a97          	auipc	s5,0x0
  80067a:	193a8a93          	addi	s5,s5,403 # 800809 <main+0x15f>
  80067e:	02800513          	li	a0,40
  800682:	02800693          	li	a3,40
  800686:	05e00413          	li	s0,94
  80068a:	bd51                	j	80051e <vprintfmt+0x212>

000000000080068c <printfmt>:
  80068c:	7139                	addi	sp,sp,-64
  80068e:	02010313          	addi	t1,sp,32
  800692:	f03a                	sd	a4,32(sp)
  800694:	871a                	mv	a4,t1
  800696:	ec06                	sd	ra,24(sp)
  800698:	f43e                	sd	a5,40(sp)
  80069a:	f842                	sd	a6,48(sp)
  80069c:	fc46                	sd	a7,56(sp)
  80069e:	e41a                	sd	t1,8(sp)
  8006a0:	c6dff0ef          	jal	ra,80030c <vprintfmt>
  8006a4:	60e2                	ld	ra,24(sp)
  8006a6:	6121                	addi	sp,sp,64
  8006a8:	8082                	ret

00000000008006aa <main>:
  8006aa:	1141                	addi	sp,sp,-16
  8006ac:	e406                	sd	ra,8(sp)
  8006ae:	e022                	sd	s0,0(sp)
  8006b0:	a7dff0ef          	jal	ra,80012c <fork>
  8006b4:	c51d                	beqz	a0,8006e2 <main+0x38>
  8006b6:	842a                	mv	s0,a0
  8006b8:	04a05c63          	blez	a0,800710 <main+0x66>
  8006bc:	06400513          	li	a0,100
  8006c0:	a71ff0ef          	jal	ra,800130 <sleep>
  8006c4:	8522                	mv	a0,s0
  8006c6:	a69ff0ef          	jal	ra,80012e <kill>
  8006ca:	e505                	bnez	a0,8006f2 <main+0x48>
  8006cc:	00000517          	auipc	a0,0x0
  8006d0:	59c50513          	addi	a0,a0,1436 # 800c68 <error_string+0x110>
  8006d4:	ab3ff0ef          	jal	ra,800186 <cprintf>
  8006d8:	60a2                	ld	ra,8(sp)
  8006da:	6402                	ld	s0,0(sp)
  8006dc:	4501                	li	a0,0
  8006de:	0141                	addi	sp,sp,16
  8006e0:	8082                	ret
  8006e2:	557d                	li	a0,-1
  8006e4:	a4dff0ef          	jal	ra,800130 <sleep>
  8006e8:	6539                	lui	a0,0xe
  8006ea:	ead50513          	addi	a0,a0,-339 # dead <__panic-0x7f2173>
  8006ee:	a29ff0ef          	jal	ra,800116 <exit>
  8006f2:	00000697          	auipc	a3,0x0
  8006f6:	56668693          	addi	a3,a3,1382 # 800c58 <error_string+0x100>
  8006fa:	00000617          	auipc	a2,0x0
  8006fe:	52e60613          	addi	a2,a2,1326 # 800c28 <error_string+0xd0>
  800702:	45b9                	li	a1,14
  800704:	00000517          	auipc	a0,0x0
  800708:	53c50513          	addi	a0,a0,1340 # 800c40 <error_string+0xe8>
  80070c:	915ff0ef          	jal	ra,800020 <__panic>
  800710:	00000697          	auipc	a3,0x0
  800714:	51068693          	addi	a3,a3,1296 # 800c20 <error_string+0xc8>
  800718:	00000617          	auipc	a2,0x0
  80071c:	51060613          	addi	a2,a2,1296 # 800c28 <error_string+0xd0>
  800720:	45ad                	li	a1,11
  800722:	00000517          	auipc	a0,0x0
  800726:	51e50513          	addi	a0,a0,1310 # 800c40 <error_string+0xe8>
  80072a:	8f7ff0ef          	jal	ra,800020 <__panic>
