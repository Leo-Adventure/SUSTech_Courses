
obj/__user_faultreadkernel.out:     file format elf64-littleriscv


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
  800034:	69050513          	addi	a0,a0,1680 # 8006c0 <main+0x30>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	128000ef          	jal	ra,80016c <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0fa000ef          	jal	ra,800146 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	6e850513          	addi	a0,a0,1768 # 800738 <main+0xa8>
  800058:	114000ef          	jal	ra,80016c <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0a8000ef          	jal	ra,800106 <exit>

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
  800076:	66e50513          	addi	a0,a0,1646 # 8006e0 <main+0x50>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	0e6000ef          	jal	ra,80016c <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0b8000ef          	jal	ra,800146 <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	6a650513          	addi	a0,a0,1702 # 800738 <main+0xa8>
  80009a:	0d2000ef          	jal	ra,80016c <cprintf>
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

00000000008000e4 <sys_putc>:
  8000e4:	85aa                	mv	a1,a0
  8000e6:	4579                	li	a0,30
  8000e8:	bf7d                	j	8000a6 <syscall>

00000000008000ea <sys_open>:
  8000ea:	862e                	mv	a2,a1
  8000ec:	85aa                	mv	a1,a0
  8000ee:	06400513          	li	a0,100
  8000f2:	bf55                	j	8000a6 <syscall>

00000000008000f4 <sys_close>:
  8000f4:	85aa                	mv	a1,a0
  8000f6:	06500513          	li	a0,101
  8000fa:	b775                	j	8000a6 <syscall>

00000000008000fc <sys_dup>:
  8000fc:	862e                	mv	a2,a1
  8000fe:	85aa                	mv	a1,a0
  800100:	08200513          	li	a0,130
  800104:	b74d                	j	8000a6 <syscall>

0000000000800106 <exit>:
  800106:	1141                	addi	sp,sp,-16
  800108:	e406                	sd	ra,8(sp)
  80010a:	fd5ff0ef          	jal	ra,8000de <sys_exit>
  80010e:	00000517          	auipc	a0,0x0
  800112:	5f250513          	addi	a0,a0,1522 # 800700 <main+0x70>
  800116:	056000ef          	jal	ra,80016c <cprintf>
  80011a:	a001                	j	80011a <exit+0x14>

000000000080011c <_start>:
  80011c:	0d0000ef          	jal	ra,8001ec <umain>
  800120:	a001                	j	800120 <_start+0x4>

0000000000800122 <open>:
  800122:	1582                	slli	a1,a1,0x20
  800124:	9181                	srli	a1,a1,0x20
  800126:	b7d1                	j	8000ea <sys_open>

0000000000800128 <close>:
  800128:	b7f1                	j	8000f4 <sys_close>

000000000080012a <dup2>:
  80012a:	bfc9                	j	8000fc <sys_dup>

000000000080012c <cputch>:
  80012c:	1141                	addi	sp,sp,-16
  80012e:	e022                	sd	s0,0(sp)
  800130:	e406                	sd	ra,8(sp)
  800132:	842e                	mv	s0,a1
  800134:	fb1ff0ef          	jal	ra,8000e4 <sys_putc>
  800138:	401c                	lw	a5,0(s0)
  80013a:	60a2                	ld	ra,8(sp)
  80013c:	2785                	addiw	a5,a5,1
  80013e:	c01c                	sw	a5,0(s0)
  800140:	6402                	ld	s0,0(sp)
  800142:	0141                	addi	sp,sp,16
  800144:	8082                	ret

0000000000800146 <vcprintf>:
  800146:	1101                	addi	sp,sp,-32
  800148:	872e                	mv	a4,a1
  80014a:	75dd                	lui	a1,0xffff7
  80014c:	86aa                	mv	a3,a0
  80014e:	0070                	addi	a2,sp,12
  800150:	00000517          	auipc	a0,0x0
  800154:	fdc50513          	addi	a0,a0,-36 # 80012c <cputch>
  800158:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5ff1>
  80015c:	ec06                	sd	ra,24(sp)
  80015e:	c602                	sw	zero,12(sp)
  800160:	192000ef          	jal	ra,8002f2 <vprintfmt>
  800164:	60e2                	ld	ra,24(sp)
  800166:	4532                	lw	a0,12(sp)
  800168:	6105                	addi	sp,sp,32
  80016a:	8082                	ret

000000000080016c <cprintf>:
  80016c:	711d                	addi	sp,sp,-96
  80016e:	02810313          	addi	t1,sp,40
  800172:	8e2a                	mv	t3,a0
  800174:	f42e                	sd	a1,40(sp)
  800176:	75dd                	lui	a1,0xffff7
  800178:	f832                	sd	a2,48(sp)
  80017a:	fc36                	sd	a3,56(sp)
  80017c:	e0ba                	sd	a4,64(sp)
  80017e:	00000517          	auipc	a0,0x0
  800182:	fae50513          	addi	a0,a0,-82 # 80012c <cputch>
  800186:	0050                	addi	a2,sp,4
  800188:	871a                	mv	a4,t1
  80018a:	86f2                	mv	a3,t3
  80018c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5ff1>
  800190:	ec06                	sd	ra,24(sp)
  800192:	e4be                	sd	a5,72(sp)
  800194:	e8c2                	sd	a6,80(sp)
  800196:	ecc6                	sd	a7,88(sp)
  800198:	e41a                	sd	t1,8(sp)
  80019a:	c202                	sw	zero,4(sp)
  80019c:	156000ef          	jal	ra,8002f2 <vprintfmt>
  8001a0:	60e2                	ld	ra,24(sp)
  8001a2:	4512                	lw	a0,4(sp)
  8001a4:	6125                	addi	sp,sp,96
  8001a6:	8082                	ret

00000000008001a8 <initfd>:
  8001a8:	1101                	addi	sp,sp,-32
  8001aa:	87ae                	mv	a5,a1
  8001ac:	e426                	sd	s1,8(sp)
  8001ae:	85b2                	mv	a1,a2
  8001b0:	84aa                	mv	s1,a0
  8001b2:	853e                	mv	a0,a5
  8001b4:	e822                	sd	s0,16(sp)
  8001b6:	ec06                	sd	ra,24(sp)
  8001b8:	f6bff0ef          	jal	ra,800122 <open>
  8001bc:	842a                	mv	s0,a0
  8001be:	00054463          	bltz	a0,8001c6 <initfd+0x1e>
  8001c2:	00951863          	bne	a0,s1,8001d2 <initfd+0x2a>
  8001c6:	60e2                	ld	ra,24(sp)
  8001c8:	8522                	mv	a0,s0
  8001ca:	6442                	ld	s0,16(sp)
  8001cc:	64a2                	ld	s1,8(sp)
  8001ce:	6105                	addi	sp,sp,32
  8001d0:	8082                	ret
  8001d2:	8526                	mv	a0,s1
  8001d4:	f55ff0ef          	jal	ra,800128 <close>
  8001d8:	85a6                	mv	a1,s1
  8001da:	8522                	mv	a0,s0
  8001dc:	f4fff0ef          	jal	ra,80012a <dup2>
  8001e0:	84aa                	mv	s1,a0
  8001e2:	8522                	mv	a0,s0
  8001e4:	f45ff0ef          	jal	ra,800128 <close>
  8001e8:	8426                	mv	s0,s1
  8001ea:	bff1                	j	8001c6 <initfd+0x1e>

00000000008001ec <umain>:
  8001ec:	1101                	addi	sp,sp,-32
  8001ee:	e822                	sd	s0,16(sp)
  8001f0:	e426                	sd	s1,8(sp)
  8001f2:	842a                	mv	s0,a0
  8001f4:	84ae                	mv	s1,a1
  8001f6:	4601                	li	a2,0
  8001f8:	00000597          	auipc	a1,0x0
  8001fc:	52058593          	addi	a1,a1,1312 # 800718 <main+0x88>
  800200:	4501                	li	a0,0
  800202:	ec06                	sd	ra,24(sp)
  800204:	fa5ff0ef          	jal	ra,8001a8 <initfd>
  800208:	02054263          	bltz	a0,80022c <umain+0x40>
  80020c:	4605                	li	a2,1
  80020e:	00000597          	auipc	a1,0x0
  800212:	54a58593          	addi	a1,a1,1354 # 800758 <main+0xc8>
  800216:	4505                	li	a0,1
  800218:	f91ff0ef          	jal	ra,8001a8 <initfd>
  80021c:	02054563          	bltz	a0,800246 <umain+0x5a>
  800220:	85a6                	mv	a1,s1
  800222:	8522                	mv	a0,s0
  800224:	46c000ef          	jal	ra,800690 <main>
  800228:	edfff0ef          	jal	ra,800106 <exit>
  80022c:	86aa                	mv	a3,a0
  80022e:	00000617          	auipc	a2,0x0
  800232:	4f260613          	addi	a2,a2,1266 # 800720 <main+0x90>
  800236:	45e9                	li	a1,26
  800238:	00000517          	auipc	a0,0x0
  80023c:	50850513          	addi	a0,a0,1288 # 800740 <main+0xb0>
  800240:	e23ff0ef          	jal	ra,800062 <__warn>
  800244:	b7e1                	j	80020c <umain+0x20>
  800246:	86aa                	mv	a3,a0
  800248:	00000617          	auipc	a2,0x0
  80024c:	51860613          	addi	a2,a2,1304 # 800760 <main+0xd0>
  800250:	45f5                	li	a1,29
  800252:	00000517          	auipc	a0,0x0
  800256:	4ee50513          	addi	a0,a0,1262 # 800740 <main+0xb0>
  80025a:	e09ff0ef          	jal	ra,800062 <__warn>
  80025e:	b7c9                	j	800220 <umain+0x34>

0000000000800260 <strnlen>:
  800260:	872a                	mv	a4,a0
  800262:	4501                	li	a0,0
  800264:	e589                	bnez	a1,80026e <strnlen+0xe>
  800266:	a811                	j	80027a <strnlen+0x1a>
  800268:	0505                	addi	a0,a0,1
  80026a:	00a58763          	beq	a1,a0,800278 <strnlen+0x18>
  80026e:	00a707b3          	add	a5,a4,a0
  800272:	0007c783          	lbu	a5,0(a5)
  800276:	fbed                	bnez	a5,800268 <strnlen+0x8>
  800278:	8082                	ret
  80027a:	8082                	ret

000000000080027c <printnum>:
  80027c:	02071893          	slli	a7,a4,0x20
  800280:	7139                	addi	sp,sp,-64
  800282:	0208d893          	srli	a7,a7,0x20
  800286:	e456                	sd	s5,8(sp)
  800288:	0316fab3          	remu	s5,a3,a7
  80028c:	f822                	sd	s0,48(sp)
  80028e:	f426                	sd	s1,40(sp)
  800290:	f04a                	sd	s2,32(sp)
  800292:	ec4e                	sd	s3,24(sp)
  800294:	fc06                	sd	ra,56(sp)
  800296:	e852                	sd	s4,16(sp)
  800298:	84aa                	mv	s1,a0
  80029a:	89ae                	mv	s3,a1
  80029c:	8932                	mv	s2,a2
  80029e:	fff7841b          	addiw	s0,a5,-1
  8002a2:	2a81                	sext.w	s5,s5
  8002a4:	0516f163          	bgeu	a3,a7,8002e6 <printnum+0x6a>
  8002a8:	8a42                	mv	s4,a6
  8002aa:	00805863          	blez	s0,8002ba <printnum+0x3e>
  8002ae:	347d                	addiw	s0,s0,-1
  8002b0:	864e                	mv	a2,s3
  8002b2:	85ca                	mv	a1,s2
  8002b4:	8552                	mv	a0,s4
  8002b6:	9482                	jalr	s1
  8002b8:	f87d                	bnez	s0,8002ae <printnum+0x32>
  8002ba:	1a82                	slli	s5,s5,0x20
  8002bc:	020ada93          	srli	s5,s5,0x20
  8002c0:	00000797          	auipc	a5,0x0
  8002c4:	4c078793          	addi	a5,a5,1216 # 800780 <main+0xf0>
  8002c8:	7442                	ld	s0,48(sp)
  8002ca:	9abe                	add	s5,s5,a5
  8002cc:	000ac503          	lbu	a0,0(s5)
  8002d0:	70e2                	ld	ra,56(sp)
  8002d2:	6a42                	ld	s4,16(sp)
  8002d4:	6aa2                	ld	s5,8(sp)
  8002d6:	864e                	mv	a2,s3
  8002d8:	85ca                	mv	a1,s2
  8002da:	69e2                	ld	s3,24(sp)
  8002dc:	7902                	ld	s2,32(sp)
  8002de:	8326                	mv	t1,s1
  8002e0:	74a2                	ld	s1,40(sp)
  8002e2:	6121                	addi	sp,sp,64
  8002e4:	8302                	jr	t1
  8002e6:	0316d6b3          	divu	a3,a3,a7
  8002ea:	87a2                	mv	a5,s0
  8002ec:	f91ff0ef          	jal	ra,80027c <printnum>
  8002f0:	b7e9                	j	8002ba <printnum+0x3e>

00000000008002f2 <vprintfmt>:
  8002f2:	7119                	addi	sp,sp,-128
  8002f4:	f4a6                	sd	s1,104(sp)
  8002f6:	f0ca                	sd	s2,96(sp)
  8002f8:	ecce                	sd	s3,88(sp)
  8002fa:	e8d2                	sd	s4,80(sp)
  8002fc:	e4d6                	sd	s5,72(sp)
  8002fe:	e0da                	sd	s6,64(sp)
  800300:	fc5e                	sd	s7,56(sp)
  800302:	ec6e                	sd	s11,24(sp)
  800304:	fc86                	sd	ra,120(sp)
  800306:	f8a2                	sd	s0,112(sp)
  800308:	f862                	sd	s8,48(sp)
  80030a:	f466                	sd	s9,40(sp)
  80030c:	f06a                	sd	s10,32(sp)
  80030e:	89aa                	mv	s3,a0
  800310:	892e                	mv	s2,a1
  800312:	84b2                	mv	s1,a2
  800314:	8db6                	mv	s11,a3
  800316:	8aba                	mv	s5,a4
  800318:	02500a13          	li	s4,37
  80031c:	5bfd                	li	s7,-1
  80031e:	00000b17          	auipc	s6,0x0
  800322:	496b0b13          	addi	s6,s6,1174 # 8007b4 <main+0x124>
  800326:	000dc503          	lbu	a0,0(s11)
  80032a:	001d8413          	addi	s0,s11,1
  80032e:	01450b63          	beq	a0,s4,800344 <vprintfmt+0x52>
  800332:	c129                	beqz	a0,800374 <vprintfmt+0x82>
  800334:	864a                	mv	a2,s2
  800336:	85a6                	mv	a1,s1
  800338:	0405                	addi	s0,s0,1
  80033a:	9982                	jalr	s3
  80033c:	fff44503          	lbu	a0,-1(s0)
  800340:	ff4519e3          	bne	a0,s4,800332 <vprintfmt+0x40>
  800344:	00044583          	lbu	a1,0(s0)
  800348:	02000813          	li	a6,32
  80034c:	4d01                	li	s10,0
  80034e:	4301                	li	t1,0
  800350:	5cfd                	li	s9,-1
  800352:	5c7d                	li	s8,-1
  800354:	05500513          	li	a0,85
  800358:	48a5                	li	a7,9
  80035a:	fdd5861b          	addiw	a2,a1,-35
  80035e:	0ff67613          	andi	a2,a2,255
  800362:	00140d93          	addi	s11,s0,1
  800366:	04c56263          	bltu	a0,a2,8003aa <vprintfmt+0xb8>
  80036a:	060a                	slli	a2,a2,0x2
  80036c:	965a                	add	a2,a2,s6
  80036e:	4214                	lw	a3,0(a2)
  800370:	96da                	add	a3,a3,s6
  800372:	8682                	jr	a3
  800374:	70e6                	ld	ra,120(sp)
  800376:	7446                	ld	s0,112(sp)
  800378:	74a6                	ld	s1,104(sp)
  80037a:	7906                	ld	s2,96(sp)
  80037c:	69e6                	ld	s3,88(sp)
  80037e:	6a46                	ld	s4,80(sp)
  800380:	6aa6                	ld	s5,72(sp)
  800382:	6b06                	ld	s6,64(sp)
  800384:	7be2                	ld	s7,56(sp)
  800386:	7c42                	ld	s8,48(sp)
  800388:	7ca2                	ld	s9,40(sp)
  80038a:	7d02                	ld	s10,32(sp)
  80038c:	6de2                	ld	s11,24(sp)
  80038e:	6109                	addi	sp,sp,128
  800390:	8082                	ret
  800392:	882e                	mv	a6,a1
  800394:	00144583          	lbu	a1,1(s0)
  800398:	846e                	mv	s0,s11
  80039a:	00140d93          	addi	s11,s0,1
  80039e:	fdd5861b          	addiw	a2,a1,-35
  8003a2:	0ff67613          	andi	a2,a2,255
  8003a6:	fcc572e3          	bgeu	a0,a2,80036a <vprintfmt+0x78>
  8003aa:	864a                	mv	a2,s2
  8003ac:	85a6                	mv	a1,s1
  8003ae:	02500513          	li	a0,37
  8003b2:	9982                	jalr	s3
  8003b4:	fff44783          	lbu	a5,-1(s0)
  8003b8:	8da2                	mv	s11,s0
  8003ba:	f74786e3          	beq	a5,s4,800326 <vprintfmt+0x34>
  8003be:	ffedc783          	lbu	a5,-2(s11)
  8003c2:	1dfd                	addi	s11,s11,-1
  8003c4:	ff479de3          	bne	a5,s4,8003be <vprintfmt+0xcc>
  8003c8:	bfb9                	j	800326 <vprintfmt+0x34>
  8003ca:	fd058c9b          	addiw	s9,a1,-48
  8003ce:	00144583          	lbu	a1,1(s0)
  8003d2:	846e                	mv	s0,s11
  8003d4:	fd05869b          	addiw	a3,a1,-48
  8003d8:	0005861b          	sext.w	a2,a1
  8003dc:	02d8e463          	bltu	a7,a3,800404 <vprintfmt+0x112>
  8003e0:	00144583          	lbu	a1,1(s0)
  8003e4:	002c969b          	slliw	a3,s9,0x2
  8003e8:	0196873b          	addw	a4,a3,s9
  8003ec:	0017171b          	slliw	a4,a4,0x1
  8003f0:	9f31                	addw	a4,a4,a2
  8003f2:	fd05869b          	addiw	a3,a1,-48
  8003f6:	0405                	addi	s0,s0,1
  8003f8:	fd070c9b          	addiw	s9,a4,-48
  8003fc:	0005861b          	sext.w	a2,a1
  800400:	fed8f0e3          	bgeu	a7,a3,8003e0 <vprintfmt+0xee>
  800404:	f40c5be3          	bgez	s8,80035a <vprintfmt+0x68>
  800408:	8c66                	mv	s8,s9
  80040a:	5cfd                	li	s9,-1
  80040c:	b7b9                	j	80035a <vprintfmt+0x68>
  80040e:	fffc4693          	not	a3,s8
  800412:	96fd                	srai	a3,a3,0x3f
  800414:	00dc77b3          	and	a5,s8,a3
  800418:	00144583          	lbu	a1,1(s0)
  80041c:	00078c1b          	sext.w	s8,a5
  800420:	846e                	mv	s0,s11
  800422:	bf25                	j	80035a <vprintfmt+0x68>
  800424:	000aac83          	lw	s9,0(s5)
  800428:	00144583          	lbu	a1,1(s0)
  80042c:	0aa1                	addi	s5,s5,8
  80042e:	846e                	mv	s0,s11
  800430:	bfd1                	j	800404 <vprintfmt+0x112>
  800432:	4705                	li	a4,1
  800434:	008a8613          	addi	a2,s5,8
  800438:	00674463          	blt	a4,t1,800440 <vprintfmt+0x14e>
  80043c:	1c030c63          	beqz	t1,800614 <vprintfmt+0x322>
  800440:	000ab683          	ld	a3,0(s5)
  800444:	4741                	li	a4,16
  800446:	8ab2                	mv	s5,a2
  800448:	2801                	sext.w	a6,a6
  80044a:	87e2                	mv	a5,s8
  80044c:	8626                	mv	a2,s1
  80044e:	85ca                	mv	a1,s2
  800450:	854e                	mv	a0,s3
  800452:	e2bff0ef          	jal	ra,80027c <printnum>
  800456:	bdc1                	j	800326 <vprintfmt+0x34>
  800458:	000aa503          	lw	a0,0(s5)
  80045c:	864a                	mv	a2,s2
  80045e:	85a6                	mv	a1,s1
  800460:	0aa1                	addi	s5,s5,8
  800462:	9982                	jalr	s3
  800464:	b5c9                	j	800326 <vprintfmt+0x34>
  800466:	4705                	li	a4,1
  800468:	008a8613          	addi	a2,s5,8
  80046c:	00674463          	blt	a4,t1,800474 <vprintfmt+0x182>
  800470:	18030d63          	beqz	t1,80060a <vprintfmt+0x318>
  800474:	000ab683          	ld	a3,0(s5)
  800478:	4729                	li	a4,10
  80047a:	8ab2                	mv	s5,a2
  80047c:	b7f1                	j	800448 <vprintfmt+0x156>
  80047e:	00144583          	lbu	a1,1(s0)
  800482:	4d05                	li	s10,1
  800484:	846e                	mv	s0,s11
  800486:	bdd1                	j	80035a <vprintfmt+0x68>
  800488:	864a                	mv	a2,s2
  80048a:	85a6                	mv	a1,s1
  80048c:	02500513          	li	a0,37
  800490:	9982                	jalr	s3
  800492:	bd51                	j	800326 <vprintfmt+0x34>
  800494:	00144583          	lbu	a1,1(s0)
  800498:	2305                	addiw	t1,t1,1
  80049a:	846e                	mv	s0,s11
  80049c:	bd7d                	j	80035a <vprintfmt+0x68>
  80049e:	4705                	li	a4,1
  8004a0:	008a8613          	addi	a2,s5,8
  8004a4:	00674463          	blt	a4,t1,8004ac <vprintfmt+0x1ba>
  8004a8:	14030c63          	beqz	t1,800600 <vprintfmt+0x30e>
  8004ac:	000ab683          	ld	a3,0(s5)
  8004b0:	4721                	li	a4,8
  8004b2:	8ab2                	mv	s5,a2
  8004b4:	bf51                	j	800448 <vprintfmt+0x156>
  8004b6:	03000513          	li	a0,48
  8004ba:	864a                	mv	a2,s2
  8004bc:	85a6                	mv	a1,s1
  8004be:	e042                	sd	a6,0(sp)
  8004c0:	9982                	jalr	s3
  8004c2:	864a                	mv	a2,s2
  8004c4:	85a6                	mv	a1,s1
  8004c6:	07800513          	li	a0,120
  8004ca:	9982                	jalr	s3
  8004cc:	0aa1                	addi	s5,s5,8
  8004ce:	6802                	ld	a6,0(sp)
  8004d0:	4741                	li	a4,16
  8004d2:	ff8ab683          	ld	a3,-8(s5)
  8004d6:	bf8d                	j	800448 <vprintfmt+0x156>
  8004d8:	000ab403          	ld	s0,0(s5)
  8004dc:	008a8793          	addi	a5,s5,8
  8004e0:	e03e                	sd	a5,0(sp)
  8004e2:	14040c63          	beqz	s0,80063a <vprintfmt+0x348>
  8004e6:	11805063          	blez	s8,8005e6 <vprintfmt+0x2f4>
  8004ea:	02d00693          	li	a3,45
  8004ee:	0cd81963          	bne	a6,a3,8005c0 <vprintfmt+0x2ce>
  8004f2:	00044683          	lbu	a3,0(s0)
  8004f6:	0006851b          	sext.w	a0,a3
  8004fa:	ce8d                	beqz	a3,800534 <vprintfmt+0x242>
  8004fc:	00140a93          	addi	s5,s0,1
  800500:	05e00413          	li	s0,94
  800504:	000cc563          	bltz	s9,80050e <vprintfmt+0x21c>
  800508:	3cfd                	addiw	s9,s9,-1
  80050a:	037c8363          	beq	s9,s7,800530 <vprintfmt+0x23e>
  80050e:	864a                	mv	a2,s2
  800510:	85a6                	mv	a1,s1
  800512:	100d0663          	beqz	s10,80061e <vprintfmt+0x32c>
  800516:	3681                	addiw	a3,a3,-32
  800518:	10d47363          	bgeu	s0,a3,80061e <vprintfmt+0x32c>
  80051c:	03f00513          	li	a0,63
  800520:	9982                	jalr	s3
  800522:	000ac683          	lbu	a3,0(s5)
  800526:	3c7d                	addiw	s8,s8,-1
  800528:	0a85                	addi	s5,s5,1
  80052a:	0006851b          	sext.w	a0,a3
  80052e:	faf9                	bnez	a3,800504 <vprintfmt+0x212>
  800530:	01805a63          	blez	s8,800544 <vprintfmt+0x252>
  800534:	3c7d                	addiw	s8,s8,-1
  800536:	864a                	mv	a2,s2
  800538:	85a6                	mv	a1,s1
  80053a:	02000513          	li	a0,32
  80053e:	9982                	jalr	s3
  800540:	fe0c1ae3          	bnez	s8,800534 <vprintfmt+0x242>
  800544:	6a82                	ld	s5,0(sp)
  800546:	b3c5                	j	800326 <vprintfmt+0x34>
  800548:	4705                	li	a4,1
  80054a:	008a8d13          	addi	s10,s5,8
  80054e:	00674463          	blt	a4,t1,800556 <vprintfmt+0x264>
  800552:	0a030463          	beqz	t1,8005fa <vprintfmt+0x308>
  800556:	000ab403          	ld	s0,0(s5)
  80055a:	0c044463          	bltz	s0,800622 <vprintfmt+0x330>
  80055e:	86a2                	mv	a3,s0
  800560:	8aea                	mv	s5,s10
  800562:	4729                	li	a4,10
  800564:	b5d5                	j	800448 <vprintfmt+0x156>
  800566:	000aa783          	lw	a5,0(s5)
  80056a:	46e1                	li	a3,24
  80056c:	0aa1                	addi	s5,s5,8
  80056e:	41f7d71b          	sraiw	a4,a5,0x1f
  800572:	8fb9                	xor	a5,a5,a4
  800574:	40e7873b          	subw	a4,a5,a4
  800578:	02e6c663          	blt	a3,a4,8005a4 <vprintfmt+0x2b2>
  80057c:	00371793          	slli	a5,a4,0x3
  800580:	00000697          	auipc	a3,0x0
  800584:	56868693          	addi	a3,a3,1384 # 800ae8 <error_string>
  800588:	97b6                	add	a5,a5,a3
  80058a:	639c                	ld	a5,0(a5)
  80058c:	cf81                	beqz	a5,8005a4 <vprintfmt+0x2b2>
  80058e:	873e                	mv	a4,a5
  800590:	00000697          	auipc	a3,0x0
  800594:	22068693          	addi	a3,a3,544 # 8007b0 <main+0x120>
  800598:	8626                	mv	a2,s1
  80059a:	85ca                	mv	a1,s2
  80059c:	854e                	mv	a0,s3
  80059e:	0d4000ef          	jal	ra,800672 <printfmt>
  8005a2:	b351                	j	800326 <vprintfmt+0x34>
  8005a4:	00000697          	auipc	a3,0x0
  8005a8:	1fc68693          	addi	a3,a3,508 # 8007a0 <main+0x110>
  8005ac:	8626                	mv	a2,s1
  8005ae:	85ca                	mv	a1,s2
  8005b0:	854e                	mv	a0,s3
  8005b2:	0c0000ef          	jal	ra,800672 <printfmt>
  8005b6:	bb85                	j	800326 <vprintfmt+0x34>
  8005b8:	00000417          	auipc	s0,0x0
  8005bc:	1e040413          	addi	s0,s0,480 # 800798 <main+0x108>
  8005c0:	85e6                	mv	a1,s9
  8005c2:	8522                	mv	a0,s0
  8005c4:	e442                	sd	a6,8(sp)
  8005c6:	c9bff0ef          	jal	ra,800260 <strnlen>
  8005ca:	40ac0c3b          	subw	s8,s8,a0
  8005ce:	01805c63          	blez	s8,8005e6 <vprintfmt+0x2f4>
  8005d2:	6822                	ld	a6,8(sp)
  8005d4:	00080a9b          	sext.w	s5,a6
  8005d8:	3c7d                	addiw	s8,s8,-1
  8005da:	864a                	mv	a2,s2
  8005dc:	85a6                	mv	a1,s1
  8005de:	8556                	mv	a0,s5
  8005e0:	9982                	jalr	s3
  8005e2:	fe0c1be3          	bnez	s8,8005d8 <vprintfmt+0x2e6>
  8005e6:	00044683          	lbu	a3,0(s0)
  8005ea:	00140a93          	addi	s5,s0,1
  8005ee:	0006851b          	sext.w	a0,a3
  8005f2:	daa9                	beqz	a3,800544 <vprintfmt+0x252>
  8005f4:	05e00413          	li	s0,94
  8005f8:	b731                	j	800504 <vprintfmt+0x212>
  8005fa:	000aa403          	lw	s0,0(s5)
  8005fe:	bfb1                	j	80055a <vprintfmt+0x268>
  800600:	000ae683          	lwu	a3,0(s5)
  800604:	4721                	li	a4,8
  800606:	8ab2                	mv	s5,a2
  800608:	b581                	j	800448 <vprintfmt+0x156>
  80060a:	000ae683          	lwu	a3,0(s5)
  80060e:	4729                	li	a4,10
  800610:	8ab2                	mv	s5,a2
  800612:	bd1d                	j	800448 <vprintfmt+0x156>
  800614:	000ae683          	lwu	a3,0(s5)
  800618:	4741                	li	a4,16
  80061a:	8ab2                	mv	s5,a2
  80061c:	b535                	j	800448 <vprintfmt+0x156>
  80061e:	9982                	jalr	s3
  800620:	b709                	j	800522 <vprintfmt+0x230>
  800622:	864a                	mv	a2,s2
  800624:	85a6                	mv	a1,s1
  800626:	02d00513          	li	a0,45
  80062a:	e042                	sd	a6,0(sp)
  80062c:	9982                	jalr	s3
  80062e:	6802                	ld	a6,0(sp)
  800630:	8aea                	mv	s5,s10
  800632:	408006b3          	neg	a3,s0
  800636:	4729                	li	a4,10
  800638:	bd01                	j	800448 <vprintfmt+0x156>
  80063a:	03805163          	blez	s8,80065c <vprintfmt+0x36a>
  80063e:	02d00693          	li	a3,45
  800642:	f6d81be3          	bne	a6,a3,8005b8 <vprintfmt+0x2c6>
  800646:	00000417          	auipc	s0,0x0
  80064a:	15240413          	addi	s0,s0,338 # 800798 <main+0x108>
  80064e:	02800693          	li	a3,40
  800652:	02800513          	li	a0,40
  800656:	00140a93          	addi	s5,s0,1
  80065a:	b55d                	j	800500 <vprintfmt+0x20e>
  80065c:	00000a97          	auipc	s5,0x0
  800660:	13da8a93          	addi	s5,s5,317 # 800799 <main+0x109>
  800664:	02800513          	li	a0,40
  800668:	02800693          	li	a3,40
  80066c:	05e00413          	li	s0,94
  800670:	bd51                	j	800504 <vprintfmt+0x212>

0000000000800672 <printfmt>:
  800672:	7139                	addi	sp,sp,-64
  800674:	02010313          	addi	t1,sp,32
  800678:	f03a                	sd	a4,32(sp)
  80067a:	871a                	mv	a4,t1
  80067c:	ec06                	sd	ra,24(sp)
  80067e:	f43e                	sd	a5,40(sp)
  800680:	f842                	sd	a6,48(sp)
  800682:	fc46                	sd	a7,56(sp)
  800684:	e41a                	sd	t1,8(sp)
  800686:	c6dff0ef          	jal	ra,8002f2 <vprintfmt>
  80068a:	60e2                	ld	ra,24(sp)
  80068c:	6121                	addi	sp,sp,64
  80068e:	8082                	ret

0000000000800690 <main>:
  800690:	3eb00793          	li	a5,1003
  800694:	07da                	slli	a5,a5,0x16
  800696:	438c                	lw	a1,0(a5)
  800698:	1141                	addi	sp,sp,-16
  80069a:	00000517          	auipc	a0,0x0
  80069e:	51650513          	addi	a0,a0,1302 # 800bb0 <error_string+0xc8>
  8006a2:	e406                	sd	ra,8(sp)
  8006a4:	ac9ff0ef          	jal	ra,80016c <cprintf>
  8006a8:	00000617          	auipc	a2,0x0
  8006ac:	52860613          	addi	a2,a2,1320 # 800bd0 <error_string+0xe8>
  8006b0:	459d                	li	a1,7
  8006b2:	00000517          	auipc	a0,0x0
  8006b6:	52e50513          	addi	a0,a0,1326 # 800be0 <error_string+0xf8>
  8006ba:	967ff0ef          	jal	ra,800020 <__panic>
