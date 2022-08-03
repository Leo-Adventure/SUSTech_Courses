
obj/__user_hello.out:     file format elf64-littleriscv


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
  800034:	68850513          	addi	a0,a0,1672 # 8006b8 <main+0x5c>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0f4000ef          	jal	ra,800138 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0c6000ef          	jal	ra,800112 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	6c050513          	addi	a0,a0,1728 # 800710 <main+0xb4>
  800058:	0e0000ef          	jal	ra,800138 <cprintf>
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

00000000008000a2 <sys_putc>:
  8000a2:	85aa                	mv	a1,a0
  8000a4:	4579                	li	a0,30
  8000a6:	bf7d                	j	800064 <syscall>

00000000008000a8 <sys_open>:
  8000a8:	862e                	mv	a2,a1
  8000aa:	85aa                	mv	a1,a0
  8000ac:	06400513          	li	a0,100
  8000b0:	bf55                	j	800064 <syscall>

00000000008000b2 <sys_close>:
  8000b2:	85aa                	mv	a1,a0
  8000b4:	06500513          	li	a0,101
  8000b8:	b775                	j	800064 <syscall>

00000000008000ba <sys_read>:
  8000ba:	86b2                	mv	a3,a2
  8000bc:	862e                	mv	a2,a1
  8000be:	85aa                	mv	a1,a0
  8000c0:	06600513          	li	a0,102
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
  8000dc:	60050513          	addi	a0,a0,1536 # 8006d8 <main+0x7c>
  8000e0:	058000ef          	jal	ra,800138 <cprintf>
  8000e4:	a001                	j	8000e4 <exit+0x14>

00000000008000e6 <_start>:
  8000e6:	0d2000ef          	jal	ra,8001b8 <umain>
  8000ea:	a001                	j	8000ea <_start+0x4>

00000000008000ec <open>:
  8000ec:	1582                	slli	a1,a1,0x20
  8000ee:	9181                	srli	a1,a1,0x20
  8000f0:	bf65                	j	8000a8 <sys_open>

00000000008000f2 <close>:
  8000f2:	b7c1                	j	8000b2 <sys_close>

00000000008000f4 <read>:
  8000f4:	b7d9                	j	8000ba <sys_read>

00000000008000f6 <dup2>:
  8000f6:	bfc1                	j	8000c6 <sys_dup>

00000000008000f8 <cputch>:
  8000f8:	1141                	addi	sp,sp,-16
  8000fa:	e022                	sd	s0,0(sp)
  8000fc:	e406                	sd	ra,8(sp)
  8000fe:	842e                	mv	s0,a1
  800100:	fa3ff0ef          	jal	ra,8000a2 <sys_putc>
  800104:	401c                	lw	a5,0(s0)
  800106:	60a2                	ld	ra,8(sp)
  800108:	2785                	addiw	a5,a5,1
  80010a:	c01c                	sw	a5,0(s0)
  80010c:	6402                	ld	s0,0(sp)
  80010e:	0141                	addi	sp,sp,16
  800110:	8082                	ret

0000000000800112 <vcprintf>:
  800112:	1101                	addi	sp,sp,-32
  800114:	872e                	mv	a4,a1
  800116:	75dd                	lui	a1,0xffff7
  800118:	86aa                	mv	a3,a0
  80011a:	0070                	addi	a2,sp,12
  80011c:	00000517          	auipc	a0,0x0
  800120:	fdc50513          	addi	a0,a0,-36 # 8000f8 <cputch>
  800124:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f6019>
  800128:	ec06                	sd	ra,24(sp)
  80012a:	c602                	sw	zero,12(sp)
  80012c:	192000ef          	jal	ra,8002be <vprintfmt>
  800130:	60e2                	ld	ra,24(sp)
  800132:	4532                	lw	a0,12(sp)
  800134:	6105                	addi	sp,sp,32
  800136:	8082                	ret

0000000000800138 <cprintf>:
  800138:	711d                	addi	sp,sp,-96
  80013a:	02810313          	addi	t1,sp,40
  80013e:	8e2a                	mv	t3,a0
  800140:	f42e                	sd	a1,40(sp)
  800142:	75dd                	lui	a1,0xffff7
  800144:	f832                	sd	a2,48(sp)
  800146:	fc36                	sd	a3,56(sp)
  800148:	e0ba                	sd	a4,64(sp)
  80014a:	00000517          	auipc	a0,0x0
  80014e:	fae50513          	addi	a0,a0,-82 # 8000f8 <cputch>
  800152:	0050                	addi	a2,sp,4
  800154:	871a                	mv	a4,t1
  800156:	86f2                	mv	a3,t3
  800158:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f6019>
  80015c:	ec06                	sd	ra,24(sp)
  80015e:	e4be                	sd	a5,72(sp)
  800160:	e8c2                	sd	a6,80(sp)
  800162:	ecc6                	sd	a7,88(sp)
  800164:	e41a                	sd	t1,8(sp)
  800166:	c202                	sw	zero,4(sp)
  800168:	156000ef          	jal	ra,8002be <vprintfmt>
  80016c:	60e2                	ld	ra,24(sp)
  80016e:	4512                	lw	a0,4(sp)
  800170:	6125                	addi	sp,sp,96
  800172:	8082                	ret

0000000000800174 <initfd>:
  800174:	1101                	addi	sp,sp,-32
  800176:	87ae                	mv	a5,a1
  800178:	e426                	sd	s1,8(sp)
  80017a:	85b2                	mv	a1,a2
  80017c:	84aa                	mv	s1,a0
  80017e:	853e                	mv	a0,a5
  800180:	e822                	sd	s0,16(sp)
  800182:	ec06                	sd	ra,24(sp)
  800184:	f69ff0ef          	jal	ra,8000ec <open>
  800188:	842a                	mv	s0,a0
  80018a:	00054463          	bltz	a0,800192 <initfd+0x1e>
  80018e:	00951863          	bne	a0,s1,80019e <initfd+0x2a>
  800192:	60e2                	ld	ra,24(sp)
  800194:	8522                	mv	a0,s0
  800196:	6442                	ld	s0,16(sp)
  800198:	64a2                	ld	s1,8(sp)
  80019a:	6105                	addi	sp,sp,32
  80019c:	8082                	ret
  80019e:	8526                	mv	a0,s1
  8001a0:	f53ff0ef          	jal	ra,8000f2 <close>
  8001a4:	85a6                	mv	a1,s1
  8001a6:	8522                	mv	a0,s0
  8001a8:	f4fff0ef          	jal	ra,8000f6 <dup2>
  8001ac:	84aa                	mv	s1,a0
  8001ae:	8522                	mv	a0,s0
  8001b0:	f43ff0ef          	jal	ra,8000f2 <close>
  8001b4:	8426                	mv	s0,s1
  8001b6:	bff1                	j	800192 <initfd+0x1e>

00000000008001b8 <umain>:
  8001b8:	1101                	addi	sp,sp,-32
  8001ba:	e822                	sd	s0,16(sp)
  8001bc:	e426                	sd	s1,8(sp)
  8001be:	842a                	mv	s0,a0
  8001c0:	84ae                	mv	s1,a1
  8001c2:	4601                	li	a2,0
  8001c4:	00000597          	auipc	a1,0x0
  8001c8:	52c58593          	addi	a1,a1,1324 # 8006f0 <main+0x94>
  8001cc:	4501                	li	a0,0
  8001ce:	ec06                	sd	ra,24(sp)
  8001d0:	fa5ff0ef          	jal	ra,800174 <initfd>
  8001d4:	02054263          	bltz	a0,8001f8 <umain+0x40>
  8001d8:	4605                	li	a2,1
  8001da:	00000597          	auipc	a1,0x0
  8001de:	55658593          	addi	a1,a1,1366 # 800730 <main+0xd4>
  8001e2:	4505                	li	a0,1
  8001e4:	f91ff0ef          	jal	ra,800174 <initfd>
  8001e8:	02054563          	bltz	a0,800212 <umain+0x5a>
  8001ec:	85a6                	mv	a1,s1
  8001ee:	8522                	mv	a0,s0
  8001f0:	46c000ef          	jal	ra,80065c <main>
  8001f4:	eddff0ef          	jal	ra,8000d0 <exit>
  8001f8:	86aa                	mv	a3,a0
  8001fa:	00000617          	auipc	a2,0x0
  8001fe:	4fe60613          	addi	a2,a2,1278 # 8006f8 <main+0x9c>
  800202:	45e9                	li	a1,26
  800204:	00000517          	auipc	a0,0x0
  800208:	51450513          	addi	a0,a0,1300 # 800718 <main+0xbc>
  80020c:	e15ff0ef          	jal	ra,800020 <__warn>
  800210:	b7e1                	j	8001d8 <umain+0x20>
  800212:	86aa                	mv	a3,a0
  800214:	00000617          	auipc	a2,0x0
  800218:	52460613          	addi	a2,a2,1316 # 800738 <main+0xdc>
  80021c:	45f5                	li	a1,29
  80021e:	00000517          	auipc	a0,0x0
  800222:	4fa50513          	addi	a0,a0,1274 # 800718 <main+0xbc>
  800226:	dfbff0ef          	jal	ra,800020 <__warn>
  80022a:	b7c9                	j	8001ec <umain+0x34>

000000000080022c <strnlen>:
  80022c:	872a                	mv	a4,a0
  80022e:	4501                	li	a0,0
  800230:	e589                	bnez	a1,80023a <strnlen+0xe>
  800232:	a811                	j	800246 <strnlen+0x1a>
  800234:	0505                	addi	a0,a0,1
  800236:	00a58763          	beq	a1,a0,800244 <strnlen+0x18>
  80023a:	00a707b3          	add	a5,a4,a0
  80023e:	0007c783          	lbu	a5,0(a5)
  800242:	fbed                	bnez	a5,800234 <strnlen+0x8>
  800244:	8082                	ret
  800246:	8082                	ret

0000000000800248 <printnum>:
  800248:	02071893          	slli	a7,a4,0x20
  80024c:	7139                	addi	sp,sp,-64
  80024e:	0208d893          	srli	a7,a7,0x20
  800252:	e456                	sd	s5,8(sp)
  800254:	0316fab3          	remu	s5,a3,a7
  800258:	f822                	sd	s0,48(sp)
  80025a:	f426                	sd	s1,40(sp)
  80025c:	f04a                	sd	s2,32(sp)
  80025e:	ec4e                	sd	s3,24(sp)
  800260:	fc06                	sd	ra,56(sp)
  800262:	e852                	sd	s4,16(sp)
  800264:	84aa                	mv	s1,a0
  800266:	89ae                	mv	s3,a1
  800268:	8932                	mv	s2,a2
  80026a:	fff7841b          	addiw	s0,a5,-1
  80026e:	2a81                	sext.w	s5,s5
  800270:	0516f163          	bgeu	a3,a7,8002b2 <printnum+0x6a>
  800274:	8a42                	mv	s4,a6
  800276:	00805863          	blez	s0,800286 <printnum+0x3e>
  80027a:	347d                	addiw	s0,s0,-1
  80027c:	864e                	mv	a2,s3
  80027e:	85ca                	mv	a1,s2
  800280:	8552                	mv	a0,s4
  800282:	9482                	jalr	s1
  800284:	f87d                	bnez	s0,80027a <printnum+0x32>
  800286:	1a82                	slli	s5,s5,0x20
  800288:	020ada93          	srli	s5,s5,0x20
  80028c:	00000797          	auipc	a5,0x0
  800290:	4cc78793          	addi	a5,a5,1228 # 800758 <main+0xfc>
  800294:	7442                	ld	s0,48(sp)
  800296:	9abe                	add	s5,s5,a5
  800298:	000ac503          	lbu	a0,0(s5)
  80029c:	70e2                	ld	ra,56(sp)
  80029e:	6a42                	ld	s4,16(sp)
  8002a0:	6aa2                	ld	s5,8(sp)
  8002a2:	864e                	mv	a2,s3
  8002a4:	85ca                	mv	a1,s2
  8002a6:	69e2                	ld	s3,24(sp)
  8002a8:	7902                	ld	s2,32(sp)
  8002aa:	8326                	mv	t1,s1
  8002ac:	74a2                	ld	s1,40(sp)
  8002ae:	6121                	addi	sp,sp,64
  8002b0:	8302                	jr	t1
  8002b2:	0316d6b3          	divu	a3,a3,a7
  8002b6:	87a2                	mv	a5,s0
  8002b8:	f91ff0ef          	jal	ra,800248 <printnum>
  8002bc:	b7e9                	j	800286 <printnum+0x3e>

00000000008002be <vprintfmt>:
  8002be:	7119                	addi	sp,sp,-128
  8002c0:	f4a6                	sd	s1,104(sp)
  8002c2:	f0ca                	sd	s2,96(sp)
  8002c4:	ecce                	sd	s3,88(sp)
  8002c6:	e8d2                	sd	s4,80(sp)
  8002c8:	e4d6                	sd	s5,72(sp)
  8002ca:	e0da                	sd	s6,64(sp)
  8002cc:	fc5e                	sd	s7,56(sp)
  8002ce:	ec6e                	sd	s11,24(sp)
  8002d0:	fc86                	sd	ra,120(sp)
  8002d2:	f8a2                	sd	s0,112(sp)
  8002d4:	f862                	sd	s8,48(sp)
  8002d6:	f466                	sd	s9,40(sp)
  8002d8:	f06a                	sd	s10,32(sp)
  8002da:	89aa                	mv	s3,a0
  8002dc:	892e                	mv	s2,a1
  8002de:	84b2                	mv	s1,a2
  8002e0:	8db6                	mv	s11,a3
  8002e2:	8aba                	mv	s5,a4
  8002e4:	02500a13          	li	s4,37
  8002e8:	5bfd                	li	s7,-1
  8002ea:	00000b17          	auipc	s6,0x0
  8002ee:	4a2b0b13          	addi	s6,s6,1186 # 80078c <main+0x130>
  8002f2:	000dc503          	lbu	a0,0(s11)
  8002f6:	001d8413          	addi	s0,s11,1
  8002fa:	01450b63          	beq	a0,s4,800310 <vprintfmt+0x52>
  8002fe:	c129                	beqz	a0,800340 <vprintfmt+0x82>
  800300:	864a                	mv	a2,s2
  800302:	85a6                	mv	a1,s1
  800304:	0405                	addi	s0,s0,1
  800306:	9982                	jalr	s3
  800308:	fff44503          	lbu	a0,-1(s0)
  80030c:	ff4519e3          	bne	a0,s4,8002fe <vprintfmt+0x40>
  800310:	00044583          	lbu	a1,0(s0)
  800314:	02000813          	li	a6,32
  800318:	4d01                	li	s10,0
  80031a:	4301                	li	t1,0
  80031c:	5cfd                	li	s9,-1
  80031e:	5c7d                	li	s8,-1
  800320:	05500513          	li	a0,85
  800324:	48a5                	li	a7,9
  800326:	fdd5861b          	addiw	a2,a1,-35
  80032a:	0ff67613          	andi	a2,a2,255
  80032e:	00140d93          	addi	s11,s0,1
  800332:	04c56263          	bltu	a0,a2,800376 <vprintfmt+0xb8>
  800336:	060a                	slli	a2,a2,0x2
  800338:	965a                	add	a2,a2,s6
  80033a:	4214                	lw	a3,0(a2)
  80033c:	96da                	add	a3,a3,s6
  80033e:	8682                	jr	a3
  800340:	70e6                	ld	ra,120(sp)
  800342:	7446                	ld	s0,112(sp)
  800344:	74a6                	ld	s1,104(sp)
  800346:	7906                	ld	s2,96(sp)
  800348:	69e6                	ld	s3,88(sp)
  80034a:	6a46                	ld	s4,80(sp)
  80034c:	6aa6                	ld	s5,72(sp)
  80034e:	6b06                	ld	s6,64(sp)
  800350:	7be2                	ld	s7,56(sp)
  800352:	7c42                	ld	s8,48(sp)
  800354:	7ca2                	ld	s9,40(sp)
  800356:	7d02                	ld	s10,32(sp)
  800358:	6de2                	ld	s11,24(sp)
  80035a:	6109                	addi	sp,sp,128
  80035c:	8082                	ret
  80035e:	882e                	mv	a6,a1
  800360:	00144583          	lbu	a1,1(s0)
  800364:	846e                	mv	s0,s11
  800366:	00140d93          	addi	s11,s0,1
  80036a:	fdd5861b          	addiw	a2,a1,-35
  80036e:	0ff67613          	andi	a2,a2,255
  800372:	fcc572e3          	bgeu	a0,a2,800336 <vprintfmt+0x78>
  800376:	864a                	mv	a2,s2
  800378:	85a6                	mv	a1,s1
  80037a:	02500513          	li	a0,37
  80037e:	9982                	jalr	s3
  800380:	fff44783          	lbu	a5,-1(s0)
  800384:	8da2                	mv	s11,s0
  800386:	f74786e3          	beq	a5,s4,8002f2 <vprintfmt+0x34>
  80038a:	ffedc783          	lbu	a5,-2(s11)
  80038e:	1dfd                	addi	s11,s11,-1
  800390:	ff479de3          	bne	a5,s4,80038a <vprintfmt+0xcc>
  800394:	bfb9                	j	8002f2 <vprintfmt+0x34>
  800396:	fd058c9b          	addiw	s9,a1,-48
  80039a:	00144583          	lbu	a1,1(s0)
  80039e:	846e                	mv	s0,s11
  8003a0:	fd05869b          	addiw	a3,a1,-48
  8003a4:	0005861b          	sext.w	a2,a1
  8003a8:	02d8e463          	bltu	a7,a3,8003d0 <vprintfmt+0x112>
  8003ac:	00144583          	lbu	a1,1(s0)
  8003b0:	002c969b          	slliw	a3,s9,0x2
  8003b4:	0196873b          	addw	a4,a3,s9
  8003b8:	0017171b          	slliw	a4,a4,0x1
  8003bc:	9f31                	addw	a4,a4,a2
  8003be:	fd05869b          	addiw	a3,a1,-48
  8003c2:	0405                	addi	s0,s0,1
  8003c4:	fd070c9b          	addiw	s9,a4,-48
  8003c8:	0005861b          	sext.w	a2,a1
  8003cc:	fed8f0e3          	bgeu	a7,a3,8003ac <vprintfmt+0xee>
  8003d0:	f40c5be3          	bgez	s8,800326 <vprintfmt+0x68>
  8003d4:	8c66                	mv	s8,s9
  8003d6:	5cfd                	li	s9,-1
  8003d8:	b7b9                	j	800326 <vprintfmt+0x68>
  8003da:	fffc4693          	not	a3,s8
  8003de:	96fd                	srai	a3,a3,0x3f
  8003e0:	00dc77b3          	and	a5,s8,a3
  8003e4:	00144583          	lbu	a1,1(s0)
  8003e8:	00078c1b          	sext.w	s8,a5
  8003ec:	846e                	mv	s0,s11
  8003ee:	bf25                	j	800326 <vprintfmt+0x68>
  8003f0:	000aac83          	lw	s9,0(s5)
  8003f4:	00144583          	lbu	a1,1(s0)
  8003f8:	0aa1                	addi	s5,s5,8
  8003fa:	846e                	mv	s0,s11
  8003fc:	bfd1                	j	8003d0 <vprintfmt+0x112>
  8003fe:	4705                	li	a4,1
  800400:	008a8613          	addi	a2,s5,8
  800404:	00674463          	blt	a4,t1,80040c <vprintfmt+0x14e>
  800408:	1c030c63          	beqz	t1,8005e0 <vprintfmt+0x322>
  80040c:	000ab683          	ld	a3,0(s5)
  800410:	4741                	li	a4,16
  800412:	8ab2                	mv	s5,a2
  800414:	2801                	sext.w	a6,a6
  800416:	87e2                	mv	a5,s8
  800418:	8626                	mv	a2,s1
  80041a:	85ca                	mv	a1,s2
  80041c:	854e                	mv	a0,s3
  80041e:	e2bff0ef          	jal	ra,800248 <printnum>
  800422:	bdc1                	j	8002f2 <vprintfmt+0x34>
  800424:	000aa503          	lw	a0,0(s5)
  800428:	864a                	mv	a2,s2
  80042a:	85a6                	mv	a1,s1
  80042c:	0aa1                	addi	s5,s5,8
  80042e:	9982                	jalr	s3
  800430:	b5c9                	j	8002f2 <vprintfmt+0x34>
  800432:	4705                	li	a4,1
  800434:	008a8613          	addi	a2,s5,8
  800438:	00674463          	blt	a4,t1,800440 <vprintfmt+0x182>
  80043c:	18030d63          	beqz	t1,8005d6 <vprintfmt+0x318>
  800440:	000ab683          	ld	a3,0(s5)
  800444:	4729                	li	a4,10
  800446:	8ab2                	mv	s5,a2
  800448:	b7f1                	j	800414 <vprintfmt+0x156>
  80044a:	00144583          	lbu	a1,1(s0)
  80044e:	4d05                	li	s10,1
  800450:	846e                	mv	s0,s11
  800452:	bdd1                	j	800326 <vprintfmt+0x68>
  800454:	864a                	mv	a2,s2
  800456:	85a6                	mv	a1,s1
  800458:	02500513          	li	a0,37
  80045c:	9982                	jalr	s3
  80045e:	bd51                	j	8002f2 <vprintfmt+0x34>
  800460:	00144583          	lbu	a1,1(s0)
  800464:	2305                	addiw	t1,t1,1
  800466:	846e                	mv	s0,s11
  800468:	bd7d                	j	800326 <vprintfmt+0x68>
  80046a:	4705                	li	a4,1
  80046c:	008a8613          	addi	a2,s5,8
  800470:	00674463          	blt	a4,t1,800478 <vprintfmt+0x1ba>
  800474:	14030c63          	beqz	t1,8005cc <vprintfmt+0x30e>
  800478:	000ab683          	ld	a3,0(s5)
  80047c:	4721                	li	a4,8
  80047e:	8ab2                	mv	s5,a2
  800480:	bf51                	j	800414 <vprintfmt+0x156>
  800482:	03000513          	li	a0,48
  800486:	864a                	mv	a2,s2
  800488:	85a6                	mv	a1,s1
  80048a:	e042                	sd	a6,0(sp)
  80048c:	9982                	jalr	s3
  80048e:	864a                	mv	a2,s2
  800490:	85a6                	mv	a1,s1
  800492:	07800513          	li	a0,120
  800496:	9982                	jalr	s3
  800498:	0aa1                	addi	s5,s5,8
  80049a:	6802                	ld	a6,0(sp)
  80049c:	4741                	li	a4,16
  80049e:	ff8ab683          	ld	a3,-8(s5)
  8004a2:	bf8d                	j	800414 <vprintfmt+0x156>
  8004a4:	000ab403          	ld	s0,0(s5)
  8004a8:	008a8793          	addi	a5,s5,8
  8004ac:	e03e                	sd	a5,0(sp)
  8004ae:	14040c63          	beqz	s0,800606 <vprintfmt+0x348>
  8004b2:	11805063          	blez	s8,8005b2 <vprintfmt+0x2f4>
  8004b6:	02d00693          	li	a3,45
  8004ba:	0cd81963          	bne	a6,a3,80058c <vprintfmt+0x2ce>
  8004be:	00044683          	lbu	a3,0(s0)
  8004c2:	0006851b          	sext.w	a0,a3
  8004c6:	ce8d                	beqz	a3,800500 <vprintfmt+0x242>
  8004c8:	00140a93          	addi	s5,s0,1
  8004cc:	05e00413          	li	s0,94
  8004d0:	000cc563          	bltz	s9,8004da <vprintfmt+0x21c>
  8004d4:	3cfd                	addiw	s9,s9,-1
  8004d6:	037c8363          	beq	s9,s7,8004fc <vprintfmt+0x23e>
  8004da:	864a                	mv	a2,s2
  8004dc:	85a6                	mv	a1,s1
  8004de:	100d0663          	beqz	s10,8005ea <vprintfmt+0x32c>
  8004e2:	3681                	addiw	a3,a3,-32
  8004e4:	10d47363          	bgeu	s0,a3,8005ea <vprintfmt+0x32c>
  8004e8:	03f00513          	li	a0,63
  8004ec:	9982                	jalr	s3
  8004ee:	000ac683          	lbu	a3,0(s5)
  8004f2:	3c7d                	addiw	s8,s8,-1
  8004f4:	0a85                	addi	s5,s5,1
  8004f6:	0006851b          	sext.w	a0,a3
  8004fa:	faf9                	bnez	a3,8004d0 <vprintfmt+0x212>
  8004fc:	01805a63          	blez	s8,800510 <vprintfmt+0x252>
  800500:	3c7d                	addiw	s8,s8,-1
  800502:	864a                	mv	a2,s2
  800504:	85a6                	mv	a1,s1
  800506:	02000513          	li	a0,32
  80050a:	9982                	jalr	s3
  80050c:	fe0c1ae3          	bnez	s8,800500 <vprintfmt+0x242>
  800510:	6a82                	ld	s5,0(sp)
  800512:	b3c5                	j	8002f2 <vprintfmt+0x34>
  800514:	4705                	li	a4,1
  800516:	008a8d13          	addi	s10,s5,8
  80051a:	00674463          	blt	a4,t1,800522 <vprintfmt+0x264>
  80051e:	0a030463          	beqz	t1,8005c6 <vprintfmt+0x308>
  800522:	000ab403          	ld	s0,0(s5)
  800526:	0c044463          	bltz	s0,8005ee <vprintfmt+0x330>
  80052a:	86a2                	mv	a3,s0
  80052c:	8aea                	mv	s5,s10
  80052e:	4729                	li	a4,10
  800530:	b5d5                	j	800414 <vprintfmt+0x156>
  800532:	000aa783          	lw	a5,0(s5)
  800536:	46e1                	li	a3,24
  800538:	0aa1                	addi	s5,s5,8
  80053a:	41f7d71b          	sraiw	a4,a5,0x1f
  80053e:	8fb9                	xor	a5,a5,a4
  800540:	40e7873b          	subw	a4,a5,a4
  800544:	02e6c663          	blt	a3,a4,800570 <vprintfmt+0x2b2>
  800548:	00371793          	slli	a5,a4,0x3
  80054c:	00000697          	auipc	a3,0x0
  800550:	57468693          	addi	a3,a3,1396 # 800ac0 <error_string>
  800554:	97b6                	add	a5,a5,a3
  800556:	639c                	ld	a5,0(a5)
  800558:	cf81                	beqz	a5,800570 <vprintfmt+0x2b2>
  80055a:	873e                	mv	a4,a5
  80055c:	00000697          	auipc	a3,0x0
  800560:	22c68693          	addi	a3,a3,556 # 800788 <main+0x12c>
  800564:	8626                	mv	a2,s1
  800566:	85ca                	mv	a1,s2
  800568:	854e                	mv	a0,s3
  80056a:	0d4000ef          	jal	ra,80063e <printfmt>
  80056e:	b351                	j	8002f2 <vprintfmt+0x34>
  800570:	00000697          	auipc	a3,0x0
  800574:	20868693          	addi	a3,a3,520 # 800778 <main+0x11c>
  800578:	8626                	mv	a2,s1
  80057a:	85ca                	mv	a1,s2
  80057c:	854e                	mv	a0,s3
  80057e:	0c0000ef          	jal	ra,80063e <printfmt>
  800582:	bb85                	j	8002f2 <vprintfmt+0x34>
  800584:	00000417          	auipc	s0,0x0
  800588:	1ec40413          	addi	s0,s0,492 # 800770 <main+0x114>
  80058c:	85e6                	mv	a1,s9
  80058e:	8522                	mv	a0,s0
  800590:	e442                	sd	a6,8(sp)
  800592:	c9bff0ef          	jal	ra,80022c <strnlen>
  800596:	40ac0c3b          	subw	s8,s8,a0
  80059a:	01805c63          	blez	s8,8005b2 <vprintfmt+0x2f4>
  80059e:	6822                	ld	a6,8(sp)
  8005a0:	00080a9b          	sext.w	s5,a6
  8005a4:	3c7d                	addiw	s8,s8,-1
  8005a6:	864a                	mv	a2,s2
  8005a8:	85a6                	mv	a1,s1
  8005aa:	8556                	mv	a0,s5
  8005ac:	9982                	jalr	s3
  8005ae:	fe0c1be3          	bnez	s8,8005a4 <vprintfmt+0x2e6>
  8005b2:	00044683          	lbu	a3,0(s0)
  8005b6:	00140a93          	addi	s5,s0,1
  8005ba:	0006851b          	sext.w	a0,a3
  8005be:	daa9                	beqz	a3,800510 <vprintfmt+0x252>
  8005c0:	05e00413          	li	s0,94
  8005c4:	b731                	j	8004d0 <vprintfmt+0x212>
  8005c6:	000aa403          	lw	s0,0(s5)
  8005ca:	bfb1                	j	800526 <vprintfmt+0x268>
  8005cc:	000ae683          	lwu	a3,0(s5)
  8005d0:	4721                	li	a4,8
  8005d2:	8ab2                	mv	s5,a2
  8005d4:	b581                	j	800414 <vprintfmt+0x156>
  8005d6:	000ae683          	lwu	a3,0(s5)
  8005da:	4729                	li	a4,10
  8005dc:	8ab2                	mv	s5,a2
  8005de:	bd1d                	j	800414 <vprintfmt+0x156>
  8005e0:	000ae683          	lwu	a3,0(s5)
  8005e4:	4741                	li	a4,16
  8005e6:	8ab2                	mv	s5,a2
  8005e8:	b535                	j	800414 <vprintfmt+0x156>
  8005ea:	9982                	jalr	s3
  8005ec:	b709                	j	8004ee <vprintfmt+0x230>
  8005ee:	864a                	mv	a2,s2
  8005f0:	85a6                	mv	a1,s1
  8005f2:	02d00513          	li	a0,45
  8005f6:	e042                	sd	a6,0(sp)
  8005f8:	9982                	jalr	s3
  8005fa:	6802                	ld	a6,0(sp)
  8005fc:	8aea                	mv	s5,s10
  8005fe:	408006b3          	neg	a3,s0
  800602:	4729                	li	a4,10
  800604:	bd01                	j	800414 <vprintfmt+0x156>
  800606:	03805163          	blez	s8,800628 <vprintfmt+0x36a>
  80060a:	02d00693          	li	a3,45
  80060e:	f6d81be3          	bne	a6,a3,800584 <vprintfmt+0x2c6>
  800612:	00000417          	auipc	s0,0x0
  800616:	15e40413          	addi	s0,s0,350 # 800770 <main+0x114>
  80061a:	02800693          	li	a3,40
  80061e:	02800513          	li	a0,40
  800622:	00140a93          	addi	s5,s0,1
  800626:	b55d                	j	8004cc <vprintfmt+0x20e>
  800628:	00000a97          	auipc	s5,0x0
  80062c:	149a8a93          	addi	s5,s5,329 # 800771 <main+0x115>
  800630:	02800513          	li	a0,40
  800634:	02800693          	li	a3,40
  800638:	05e00413          	li	s0,94
  80063c:	bd51                	j	8004d0 <vprintfmt+0x212>

000000000080063e <printfmt>:
  80063e:	7139                	addi	sp,sp,-64
  800640:	02010313          	addi	t1,sp,32
  800644:	f03a                	sd	a4,32(sp)
  800646:	871a                	mv	a4,t1
  800648:	ec06                	sd	ra,24(sp)
  80064a:	f43e                	sd	a5,40(sp)
  80064c:	f842                	sd	a6,48(sp)
  80064e:	fc46                	sd	a7,56(sp)
  800650:	e41a                	sd	t1,8(sp)
  800652:	c6dff0ef          	jal	ra,8002be <vprintfmt>
  800656:	60e2                	ld	ra,24(sp)
  800658:	6121                	addi	sp,sp,64
  80065a:	8082                	ret

000000000080065c <main>:
  80065c:	c0010113          	addi	sp,sp,-1024
  800660:	4581                	li	a1,0
  800662:	00000517          	auipc	a0,0x0
  800666:	52650513          	addi	a0,a0,1318 # 800b88 <error_string+0xc8>
  80066a:	3e113c23          	sd	ra,1016(sp)
  80066e:	a7fff0ef          	jal	ra,8000ec <open>
  800672:	002c                	addi	a1,sp,8
  800674:	3e800613          	li	a2,1000
  800678:	a7dff0ef          	jal	ra,8000f4 <read>
  80067c:	002c                	addi	a1,sp,8
  80067e:	00000517          	auipc	a0,0x0
  800682:	51250513          	addi	a0,a0,1298 # 800b90 <error_string+0xd0>
  800686:	ab3ff0ef          	jal	ra,800138 <cprintf>
  80068a:	3f813083          	ld	ra,1016(sp)
  80068e:	4501                	li	a0,0
  800690:	40010113          	addi	sp,sp,1024
  800694:	8082                	ret
