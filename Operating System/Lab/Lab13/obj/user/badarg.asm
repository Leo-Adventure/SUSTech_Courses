
obj/__user_badarg.out:     file format elf64-littleriscv


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
  800034:	76850513          	addi	a0,a0,1896 # 800798 <main+0xf2>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	13e000ef          	jal	ra,800182 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	110000ef          	jal	ra,80015c <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	7c050513          	addi	a0,a0,1984 # 800810 <main+0x16a>
  800058:	12a000ef          	jal	ra,800182 <cprintf>
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
  800076:	74650513          	addi	a0,a0,1862 # 8007b8 <main+0x112>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	0fc000ef          	jal	ra,800182 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0ce000ef          	jal	ra,80015c <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	77e50513          	addi	a0,a0,1918 # 800810 <main+0x16a>
  80009a:	0e8000ef          	jal	ra,800182 <cprintf>
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

00000000008000f4 <sys_putc>:
  8000f4:	85aa                	mv	a1,a0
  8000f6:	4579                	li	a0,30
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
  800122:	6ba50513          	addi	a0,a0,1722 # 8007d8 <main+0x132>
  800126:	05c000ef          	jal	ra,800182 <cprintf>
  80012a:	a001                	j	80012a <exit+0x14>

000000000080012c <fork>:
  80012c:	bf65                	j	8000e4 <sys_fork>

000000000080012e <waitpid>:
  80012e:	bf6d                	j	8000e8 <sys_wait>

0000000000800130 <yield>:
  800130:	b7c1                	j	8000f0 <sys_yield>

0000000000800132 <_start>:
  800132:	0d0000ef          	jal	ra,800202 <umain>
  800136:	a001                	j	800136 <_start+0x4>

0000000000800138 <open>:
  800138:	1582                	slli	a1,a1,0x20
  80013a:	9181                	srli	a1,a1,0x20
  80013c:	bf7d                	j	8000fa <sys_open>

000000000080013e <close>:
  80013e:	b7d9                	j	800104 <sys_close>

0000000000800140 <dup2>:
  800140:	b7f1                	j	80010c <sys_dup>

0000000000800142 <cputch>:
  800142:	1141                	addi	sp,sp,-16
  800144:	e022                	sd	s0,0(sp)
  800146:	e406                	sd	ra,8(sp)
  800148:	842e                	mv	s0,a1
  80014a:	fabff0ef          	jal	ra,8000f4 <sys_putc>
  80014e:	401c                	lw	a5,0(s0)
  800150:	60a2                	ld	ra,8(sp)
  800152:	2785                	addiw	a5,a5,1
  800154:	c01c                	sw	a5,0(s0)
  800156:	6402                	ld	s0,0(sp)
  800158:	0141                	addi	sp,sp,16
  80015a:	8082                	ret

000000000080015c <vcprintf>:
  80015c:	1101                	addi	sp,sp,-32
  80015e:	872e                	mv	a4,a1
  800160:	75dd                	lui	a1,0xffff7
  800162:	86aa                	mv	a3,a0
  800164:	0070                	addi	a2,sp,12
  800166:	00000517          	auipc	a0,0x0
  80016a:	fdc50513          	addi	a0,a0,-36 # 800142 <cputch>
  80016e:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f19>
  800172:	ec06                	sd	ra,24(sp)
  800174:	c602                	sw	zero,12(sp)
  800176:	192000ef          	jal	ra,800308 <vprintfmt>
  80017a:	60e2                	ld	ra,24(sp)
  80017c:	4532                	lw	a0,12(sp)
  80017e:	6105                	addi	sp,sp,32
  800180:	8082                	ret

0000000000800182 <cprintf>:
  800182:	711d                	addi	sp,sp,-96
  800184:	02810313          	addi	t1,sp,40
  800188:	8e2a                	mv	t3,a0
  80018a:	f42e                	sd	a1,40(sp)
  80018c:	75dd                	lui	a1,0xffff7
  80018e:	f832                	sd	a2,48(sp)
  800190:	fc36                	sd	a3,56(sp)
  800192:	e0ba                	sd	a4,64(sp)
  800194:	00000517          	auipc	a0,0x0
  800198:	fae50513          	addi	a0,a0,-82 # 800142 <cputch>
  80019c:	0050                	addi	a2,sp,4
  80019e:	871a                	mv	a4,t1
  8001a0:	86f2                	mv	a3,t3
  8001a2:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5f19>
  8001a6:	ec06                	sd	ra,24(sp)
  8001a8:	e4be                	sd	a5,72(sp)
  8001aa:	e8c2                	sd	a6,80(sp)
  8001ac:	ecc6                	sd	a7,88(sp)
  8001ae:	e41a                	sd	t1,8(sp)
  8001b0:	c202                	sw	zero,4(sp)
  8001b2:	156000ef          	jal	ra,800308 <vprintfmt>
  8001b6:	60e2                	ld	ra,24(sp)
  8001b8:	4512                	lw	a0,4(sp)
  8001ba:	6125                	addi	sp,sp,96
  8001bc:	8082                	ret

00000000008001be <initfd>:
  8001be:	1101                	addi	sp,sp,-32
  8001c0:	87ae                	mv	a5,a1
  8001c2:	e426                	sd	s1,8(sp)
  8001c4:	85b2                	mv	a1,a2
  8001c6:	84aa                	mv	s1,a0
  8001c8:	853e                	mv	a0,a5
  8001ca:	e822                	sd	s0,16(sp)
  8001cc:	ec06                	sd	ra,24(sp)
  8001ce:	f6bff0ef          	jal	ra,800138 <open>
  8001d2:	842a                	mv	s0,a0
  8001d4:	00054463          	bltz	a0,8001dc <initfd+0x1e>
  8001d8:	00951863          	bne	a0,s1,8001e8 <initfd+0x2a>
  8001dc:	60e2                	ld	ra,24(sp)
  8001de:	8522                	mv	a0,s0
  8001e0:	6442                	ld	s0,16(sp)
  8001e2:	64a2                	ld	s1,8(sp)
  8001e4:	6105                	addi	sp,sp,32
  8001e6:	8082                	ret
  8001e8:	8526                	mv	a0,s1
  8001ea:	f55ff0ef          	jal	ra,80013e <close>
  8001ee:	85a6                	mv	a1,s1
  8001f0:	8522                	mv	a0,s0
  8001f2:	f4fff0ef          	jal	ra,800140 <dup2>
  8001f6:	84aa                	mv	s1,a0
  8001f8:	8522                	mv	a0,s0
  8001fa:	f45ff0ef          	jal	ra,80013e <close>
  8001fe:	8426                	mv	s0,s1
  800200:	bff1                	j	8001dc <initfd+0x1e>

0000000000800202 <umain>:
  800202:	1101                	addi	sp,sp,-32
  800204:	e822                	sd	s0,16(sp)
  800206:	e426                	sd	s1,8(sp)
  800208:	842a                	mv	s0,a0
  80020a:	84ae                	mv	s1,a1
  80020c:	4601                	li	a2,0
  80020e:	00000597          	auipc	a1,0x0
  800212:	5e258593          	addi	a1,a1,1506 # 8007f0 <main+0x14a>
  800216:	4501                	li	a0,0
  800218:	ec06                	sd	ra,24(sp)
  80021a:	fa5ff0ef          	jal	ra,8001be <initfd>
  80021e:	02054263          	bltz	a0,800242 <umain+0x40>
  800222:	4605                	li	a2,1
  800224:	00000597          	auipc	a1,0x0
  800228:	60c58593          	addi	a1,a1,1548 # 800830 <main+0x18a>
  80022c:	4505                	li	a0,1
  80022e:	f91ff0ef          	jal	ra,8001be <initfd>
  800232:	02054563          	bltz	a0,80025c <umain+0x5a>
  800236:	85a6                	mv	a1,s1
  800238:	8522                	mv	a0,s0
  80023a:	46c000ef          	jal	ra,8006a6 <main>
  80023e:	ed9ff0ef          	jal	ra,800116 <exit>
  800242:	86aa                	mv	a3,a0
  800244:	00000617          	auipc	a2,0x0
  800248:	5b460613          	addi	a2,a2,1460 # 8007f8 <main+0x152>
  80024c:	45e9                	li	a1,26
  80024e:	00000517          	auipc	a0,0x0
  800252:	5ca50513          	addi	a0,a0,1482 # 800818 <main+0x172>
  800256:	e0dff0ef          	jal	ra,800062 <__warn>
  80025a:	b7e1                	j	800222 <umain+0x20>
  80025c:	86aa                	mv	a3,a0
  80025e:	00000617          	auipc	a2,0x0
  800262:	5da60613          	addi	a2,a2,1498 # 800838 <main+0x192>
  800266:	45f5                	li	a1,29
  800268:	00000517          	auipc	a0,0x0
  80026c:	5b050513          	addi	a0,a0,1456 # 800818 <main+0x172>
  800270:	df3ff0ef          	jal	ra,800062 <__warn>
  800274:	b7c9                	j	800236 <umain+0x34>

0000000000800276 <strnlen>:
  800276:	872a                	mv	a4,a0
  800278:	4501                	li	a0,0
  80027a:	e589                	bnez	a1,800284 <strnlen+0xe>
  80027c:	a811                	j	800290 <strnlen+0x1a>
  80027e:	0505                	addi	a0,a0,1
  800280:	00a58763          	beq	a1,a0,80028e <strnlen+0x18>
  800284:	00a707b3          	add	a5,a4,a0
  800288:	0007c783          	lbu	a5,0(a5)
  80028c:	fbed                	bnez	a5,80027e <strnlen+0x8>
  80028e:	8082                	ret
  800290:	8082                	ret

0000000000800292 <printnum>:
  800292:	02071893          	slli	a7,a4,0x20
  800296:	7139                	addi	sp,sp,-64
  800298:	0208d893          	srli	a7,a7,0x20
  80029c:	e456                	sd	s5,8(sp)
  80029e:	0316fab3          	remu	s5,a3,a7
  8002a2:	f822                	sd	s0,48(sp)
  8002a4:	f426                	sd	s1,40(sp)
  8002a6:	f04a                	sd	s2,32(sp)
  8002a8:	ec4e                	sd	s3,24(sp)
  8002aa:	fc06                	sd	ra,56(sp)
  8002ac:	e852                	sd	s4,16(sp)
  8002ae:	84aa                	mv	s1,a0
  8002b0:	89ae                	mv	s3,a1
  8002b2:	8932                	mv	s2,a2
  8002b4:	fff7841b          	addiw	s0,a5,-1
  8002b8:	2a81                	sext.w	s5,s5
  8002ba:	0516f163          	bgeu	a3,a7,8002fc <printnum+0x6a>
  8002be:	8a42                	mv	s4,a6
  8002c0:	00805863          	blez	s0,8002d0 <printnum+0x3e>
  8002c4:	347d                	addiw	s0,s0,-1
  8002c6:	864e                	mv	a2,s3
  8002c8:	85ca                	mv	a1,s2
  8002ca:	8552                	mv	a0,s4
  8002cc:	9482                	jalr	s1
  8002ce:	f87d                	bnez	s0,8002c4 <printnum+0x32>
  8002d0:	1a82                	slli	s5,s5,0x20
  8002d2:	020ada93          	srli	s5,s5,0x20
  8002d6:	00000797          	auipc	a5,0x0
  8002da:	58278793          	addi	a5,a5,1410 # 800858 <main+0x1b2>
  8002de:	7442                	ld	s0,48(sp)
  8002e0:	9abe                	add	s5,s5,a5
  8002e2:	000ac503          	lbu	a0,0(s5)
  8002e6:	70e2                	ld	ra,56(sp)
  8002e8:	6a42                	ld	s4,16(sp)
  8002ea:	6aa2                	ld	s5,8(sp)
  8002ec:	864e                	mv	a2,s3
  8002ee:	85ca                	mv	a1,s2
  8002f0:	69e2                	ld	s3,24(sp)
  8002f2:	7902                	ld	s2,32(sp)
  8002f4:	8326                	mv	t1,s1
  8002f6:	74a2                	ld	s1,40(sp)
  8002f8:	6121                	addi	sp,sp,64
  8002fa:	8302                	jr	t1
  8002fc:	0316d6b3          	divu	a3,a3,a7
  800300:	87a2                	mv	a5,s0
  800302:	f91ff0ef          	jal	ra,800292 <printnum>
  800306:	b7e9                	j	8002d0 <printnum+0x3e>

0000000000800308 <vprintfmt>:
  800308:	7119                	addi	sp,sp,-128
  80030a:	f4a6                	sd	s1,104(sp)
  80030c:	f0ca                	sd	s2,96(sp)
  80030e:	ecce                	sd	s3,88(sp)
  800310:	e8d2                	sd	s4,80(sp)
  800312:	e4d6                	sd	s5,72(sp)
  800314:	e0da                	sd	s6,64(sp)
  800316:	fc5e                	sd	s7,56(sp)
  800318:	ec6e                	sd	s11,24(sp)
  80031a:	fc86                	sd	ra,120(sp)
  80031c:	f8a2                	sd	s0,112(sp)
  80031e:	f862                	sd	s8,48(sp)
  800320:	f466                	sd	s9,40(sp)
  800322:	f06a                	sd	s10,32(sp)
  800324:	89aa                	mv	s3,a0
  800326:	892e                	mv	s2,a1
  800328:	84b2                	mv	s1,a2
  80032a:	8db6                	mv	s11,a3
  80032c:	8aba                	mv	s5,a4
  80032e:	02500a13          	li	s4,37
  800332:	5bfd                	li	s7,-1
  800334:	00000b17          	auipc	s6,0x0
  800338:	558b0b13          	addi	s6,s6,1368 # 80088c <main+0x1e6>
  80033c:	000dc503          	lbu	a0,0(s11)
  800340:	001d8413          	addi	s0,s11,1
  800344:	01450b63          	beq	a0,s4,80035a <vprintfmt+0x52>
  800348:	c129                	beqz	a0,80038a <vprintfmt+0x82>
  80034a:	864a                	mv	a2,s2
  80034c:	85a6                	mv	a1,s1
  80034e:	0405                	addi	s0,s0,1
  800350:	9982                	jalr	s3
  800352:	fff44503          	lbu	a0,-1(s0)
  800356:	ff4519e3          	bne	a0,s4,800348 <vprintfmt+0x40>
  80035a:	00044583          	lbu	a1,0(s0)
  80035e:	02000813          	li	a6,32
  800362:	4d01                	li	s10,0
  800364:	4301                	li	t1,0
  800366:	5cfd                	li	s9,-1
  800368:	5c7d                	li	s8,-1
  80036a:	05500513          	li	a0,85
  80036e:	48a5                	li	a7,9
  800370:	fdd5861b          	addiw	a2,a1,-35
  800374:	0ff67613          	andi	a2,a2,255
  800378:	00140d93          	addi	s11,s0,1
  80037c:	04c56263          	bltu	a0,a2,8003c0 <vprintfmt+0xb8>
  800380:	060a                	slli	a2,a2,0x2
  800382:	965a                	add	a2,a2,s6
  800384:	4214                	lw	a3,0(a2)
  800386:	96da                	add	a3,a3,s6
  800388:	8682                	jr	a3
  80038a:	70e6                	ld	ra,120(sp)
  80038c:	7446                	ld	s0,112(sp)
  80038e:	74a6                	ld	s1,104(sp)
  800390:	7906                	ld	s2,96(sp)
  800392:	69e6                	ld	s3,88(sp)
  800394:	6a46                	ld	s4,80(sp)
  800396:	6aa6                	ld	s5,72(sp)
  800398:	6b06                	ld	s6,64(sp)
  80039a:	7be2                	ld	s7,56(sp)
  80039c:	7c42                	ld	s8,48(sp)
  80039e:	7ca2                	ld	s9,40(sp)
  8003a0:	7d02                	ld	s10,32(sp)
  8003a2:	6de2                	ld	s11,24(sp)
  8003a4:	6109                	addi	sp,sp,128
  8003a6:	8082                	ret
  8003a8:	882e                	mv	a6,a1
  8003aa:	00144583          	lbu	a1,1(s0)
  8003ae:	846e                	mv	s0,s11
  8003b0:	00140d93          	addi	s11,s0,1
  8003b4:	fdd5861b          	addiw	a2,a1,-35
  8003b8:	0ff67613          	andi	a2,a2,255
  8003bc:	fcc572e3          	bgeu	a0,a2,800380 <vprintfmt+0x78>
  8003c0:	864a                	mv	a2,s2
  8003c2:	85a6                	mv	a1,s1
  8003c4:	02500513          	li	a0,37
  8003c8:	9982                	jalr	s3
  8003ca:	fff44783          	lbu	a5,-1(s0)
  8003ce:	8da2                	mv	s11,s0
  8003d0:	f74786e3          	beq	a5,s4,80033c <vprintfmt+0x34>
  8003d4:	ffedc783          	lbu	a5,-2(s11)
  8003d8:	1dfd                	addi	s11,s11,-1
  8003da:	ff479de3          	bne	a5,s4,8003d4 <vprintfmt+0xcc>
  8003de:	bfb9                	j	80033c <vprintfmt+0x34>
  8003e0:	fd058c9b          	addiw	s9,a1,-48
  8003e4:	00144583          	lbu	a1,1(s0)
  8003e8:	846e                	mv	s0,s11
  8003ea:	fd05869b          	addiw	a3,a1,-48
  8003ee:	0005861b          	sext.w	a2,a1
  8003f2:	02d8e463          	bltu	a7,a3,80041a <vprintfmt+0x112>
  8003f6:	00144583          	lbu	a1,1(s0)
  8003fa:	002c969b          	slliw	a3,s9,0x2
  8003fe:	0196873b          	addw	a4,a3,s9
  800402:	0017171b          	slliw	a4,a4,0x1
  800406:	9f31                	addw	a4,a4,a2
  800408:	fd05869b          	addiw	a3,a1,-48
  80040c:	0405                	addi	s0,s0,1
  80040e:	fd070c9b          	addiw	s9,a4,-48
  800412:	0005861b          	sext.w	a2,a1
  800416:	fed8f0e3          	bgeu	a7,a3,8003f6 <vprintfmt+0xee>
  80041a:	f40c5be3          	bgez	s8,800370 <vprintfmt+0x68>
  80041e:	8c66                	mv	s8,s9
  800420:	5cfd                	li	s9,-1
  800422:	b7b9                	j	800370 <vprintfmt+0x68>
  800424:	fffc4693          	not	a3,s8
  800428:	96fd                	srai	a3,a3,0x3f
  80042a:	00dc77b3          	and	a5,s8,a3
  80042e:	00144583          	lbu	a1,1(s0)
  800432:	00078c1b          	sext.w	s8,a5
  800436:	846e                	mv	s0,s11
  800438:	bf25                	j	800370 <vprintfmt+0x68>
  80043a:	000aac83          	lw	s9,0(s5)
  80043e:	00144583          	lbu	a1,1(s0)
  800442:	0aa1                	addi	s5,s5,8
  800444:	846e                	mv	s0,s11
  800446:	bfd1                	j	80041a <vprintfmt+0x112>
  800448:	4705                	li	a4,1
  80044a:	008a8613          	addi	a2,s5,8
  80044e:	00674463          	blt	a4,t1,800456 <vprintfmt+0x14e>
  800452:	1c030c63          	beqz	t1,80062a <vprintfmt+0x322>
  800456:	000ab683          	ld	a3,0(s5)
  80045a:	4741                	li	a4,16
  80045c:	8ab2                	mv	s5,a2
  80045e:	2801                	sext.w	a6,a6
  800460:	87e2                	mv	a5,s8
  800462:	8626                	mv	a2,s1
  800464:	85ca                	mv	a1,s2
  800466:	854e                	mv	a0,s3
  800468:	e2bff0ef          	jal	ra,800292 <printnum>
  80046c:	bdc1                	j	80033c <vprintfmt+0x34>
  80046e:	000aa503          	lw	a0,0(s5)
  800472:	864a                	mv	a2,s2
  800474:	85a6                	mv	a1,s1
  800476:	0aa1                	addi	s5,s5,8
  800478:	9982                	jalr	s3
  80047a:	b5c9                	j	80033c <vprintfmt+0x34>
  80047c:	4705                	li	a4,1
  80047e:	008a8613          	addi	a2,s5,8
  800482:	00674463          	blt	a4,t1,80048a <vprintfmt+0x182>
  800486:	18030d63          	beqz	t1,800620 <vprintfmt+0x318>
  80048a:	000ab683          	ld	a3,0(s5)
  80048e:	4729                	li	a4,10
  800490:	8ab2                	mv	s5,a2
  800492:	b7f1                	j	80045e <vprintfmt+0x156>
  800494:	00144583          	lbu	a1,1(s0)
  800498:	4d05                	li	s10,1
  80049a:	846e                	mv	s0,s11
  80049c:	bdd1                	j	800370 <vprintfmt+0x68>
  80049e:	864a                	mv	a2,s2
  8004a0:	85a6                	mv	a1,s1
  8004a2:	02500513          	li	a0,37
  8004a6:	9982                	jalr	s3
  8004a8:	bd51                	j	80033c <vprintfmt+0x34>
  8004aa:	00144583          	lbu	a1,1(s0)
  8004ae:	2305                	addiw	t1,t1,1
  8004b0:	846e                	mv	s0,s11
  8004b2:	bd7d                	j	800370 <vprintfmt+0x68>
  8004b4:	4705                	li	a4,1
  8004b6:	008a8613          	addi	a2,s5,8
  8004ba:	00674463          	blt	a4,t1,8004c2 <vprintfmt+0x1ba>
  8004be:	14030c63          	beqz	t1,800616 <vprintfmt+0x30e>
  8004c2:	000ab683          	ld	a3,0(s5)
  8004c6:	4721                	li	a4,8
  8004c8:	8ab2                	mv	s5,a2
  8004ca:	bf51                	j	80045e <vprintfmt+0x156>
  8004cc:	03000513          	li	a0,48
  8004d0:	864a                	mv	a2,s2
  8004d2:	85a6                	mv	a1,s1
  8004d4:	e042                	sd	a6,0(sp)
  8004d6:	9982                	jalr	s3
  8004d8:	864a                	mv	a2,s2
  8004da:	85a6                	mv	a1,s1
  8004dc:	07800513          	li	a0,120
  8004e0:	9982                	jalr	s3
  8004e2:	0aa1                	addi	s5,s5,8
  8004e4:	6802                	ld	a6,0(sp)
  8004e6:	4741                	li	a4,16
  8004e8:	ff8ab683          	ld	a3,-8(s5)
  8004ec:	bf8d                	j	80045e <vprintfmt+0x156>
  8004ee:	000ab403          	ld	s0,0(s5)
  8004f2:	008a8793          	addi	a5,s5,8
  8004f6:	e03e                	sd	a5,0(sp)
  8004f8:	14040c63          	beqz	s0,800650 <vprintfmt+0x348>
  8004fc:	11805063          	blez	s8,8005fc <vprintfmt+0x2f4>
  800500:	02d00693          	li	a3,45
  800504:	0cd81963          	bne	a6,a3,8005d6 <vprintfmt+0x2ce>
  800508:	00044683          	lbu	a3,0(s0)
  80050c:	0006851b          	sext.w	a0,a3
  800510:	ce8d                	beqz	a3,80054a <vprintfmt+0x242>
  800512:	00140a93          	addi	s5,s0,1
  800516:	05e00413          	li	s0,94
  80051a:	000cc563          	bltz	s9,800524 <vprintfmt+0x21c>
  80051e:	3cfd                	addiw	s9,s9,-1
  800520:	037c8363          	beq	s9,s7,800546 <vprintfmt+0x23e>
  800524:	864a                	mv	a2,s2
  800526:	85a6                	mv	a1,s1
  800528:	100d0663          	beqz	s10,800634 <vprintfmt+0x32c>
  80052c:	3681                	addiw	a3,a3,-32
  80052e:	10d47363          	bgeu	s0,a3,800634 <vprintfmt+0x32c>
  800532:	03f00513          	li	a0,63
  800536:	9982                	jalr	s3
  800538:	000ac683          	lbu	a3,0(s5)
  80053c:	3c7d                	addiw	s8,s8,-1
  80053e:	0a85                	addi	s5,s5,1
  800540:	0006851b          	sext.w	a0,a3
  800544:	faf9                	bnez	a3,80051a <vprintfmt+0x212>
  800546:	01805a63          	blez	s8,80055a <vprintfmt+0x252>
  80054a:	3c7d                	addiw	s8,s8,-1
  80054c:	864a                	mv	a2,s2
  80054e:	85a6                	mv	a1,s1
  800550:	02000513          	li	a0,32
  800554:	9982                	jalr	s3
  800556:	fe0c1ae3          	bnez	s8,80054a <vprintfmt+0x242>
  80055a:	6a82                	ld	s5,0(sp)
  80055c:	b3c5                	j	80033c <vprintfmt+0x34>
  80055e:	4705                	li	a4,1
  800560:	008a8d13          	addi	s10,s5,8
  800564:	00674463          	blt	a4,t1,80056c <vprintfmt+0x264>
  800568:	0a030463          	beqz	t1,800610 <vprintfmt+0x308>
  80056c:	000ab403          	ld	s0,0(s5)
  800570:	0c044463          	bltz	s0,800638 <vprintfmt+0x330>
  800574:	86a2                	mv	a3,s0
  800576:	8aea                	mv	s5,s10
  800578:	4729                	li	a4,10
  80057a:	b5d5                	j	80045e <vprintfmt+0x156>
  80057c:	000aa783          	lw	a5,0(s5)
  800580:	46e1                	li	a3,24
  800582:	0aa1                	addi	s5,s5,8
  800584:	41f7d71b          	sraiw	a4,a5,0x1f
  800588:	8fb9                	xor	a5,a5,a4
  80058a:	40e7873b          	subw	a4,a5,a4
  80058e:	02e6c663          	blt	a3,a4,8005ba <vprintfmt+0x2b2>
  800592:	00371793          	slli	a5,a4,0x3
  800596:	00000697          	auipc	a3,0x0
  80059a:	62a68693          	addi	a3,a3,1578 # 800bc0 <error_string>
  80059e:	97b6                	add	a5,a5,a3
  8005a0:	639c                	ld	a5,0(a5)
  8005a2:	cf81                	beqz	a5,8005ba <vprintfmt+0x2b2>
  8005a4:	873e                	mv	a4,a5
  8005a6:	00000697          	auipc	a3,0x0
  8005aa:	2e268693          	addi	a3,a3,738 # 800888 <main+0x1e2>
  8005ae:	8626                	mv	a2,s1
  8005b0:	85ca                	mv	a1,s2
  8005b2:	854e                	mv	a0,s3
  8005b4:	0d4000ef          	jal	ra,800688 <printfmt>
  8005b8:	b351                	j	80033c <vprintfmt+0x34>
  8005ba:	00000697          	auipc	a3,0x0
  8005be:	2be68693          	addi	a3,a3,702 # 800878 <main+0x1d2>
  8005c2:	8626                	mv	a2,s1
  8005c4:	85ca                	mv	a1,s2
  8005c6:	854e                	mv	a0,s3
  8005c8:	0c0000ef          	jal	ra,800688 <printfmt>
  8005cc:	bb85                	j	80033c <vprintfmt+0x34>
  8005ce:	00000417          	auipc	s0,0x0
  8005d2:	2a240413          	addi	s0,s0,674 # 800870 <main+0x1ca>
  8005d6:	85e6                	mv	a1,s9
  8005d8:	8522                	mv	a0,s0
  8005da:	e442                	sd	a6,8(sp)
  8005dc:	c9bff0ef          	jal	ra,800276 <strnlen>
  8005e0:	40ac0c3b          	subw	s8,s8,a0
  8005e4:	01805c63          	blez	s8,8005fc <vprintfmt+0x2f4>
  8005e8:	6822                	ld	a6,8(sp)
  8005ea:	00080a9b          	sext.w	s5,a6
  8005ee:	3c7d                	addiw	s8,s8,-1
  8005f0:	864a                	mv	a2,s2
  8005f2:	85a6                	mv	a1,s1
  8005f4:	8556                	mv	a0,s5
  8005f6:	9982                	jalr	s3
  8005f8:	fe0c1be3          	bnez	s8,8005ee <vprintfmt+0x2e6>
  8005fc:	00044683          	lbu	a3,0(s0)
  800600:	00140a93          	addi	s5,s0,1
  800604:	0006851b          	sext.w	a0,a3
  800608:	daa9                	beqz	a3,80055a <vprintfmt+0x252>
  80060a:	05e00413          	li	s0,94
  80060e:	b731                	j	80051a <vprintfmt+0x212>
  800610:	000aa403          	lw	s0,0(s5)
  800614:	bfb1                	j	800570 <vprintfmt+0x268>
  800616:	000ae683          	lwu	a3,0(s5)
  80061a:	4721                	li	a4,8
  80061c:	8ab2                	mv	s5,a2
  80061e:	b581                	j	80045e <vprintfmt+0x156>
  800620:	000ae683          	lwu	a3,0(s5)
  800624:	4729                	li	a4,10
  800626:	8ab2                	mv	s5,a2
  800628:	bd1d                	j	80045e <vprintfmt+0x156>
  80062a:	000ae683          	lwu	a3,0(s5)
  80062e:	4741                	li	a4,16
  800630:	8ab2                	mv	s5,a2
  800632:	b535                	j	80045e <vprintfmt+0x156>
  800634:	9982                	jalr	s3
  800636:	b709                	j	800538 <vprintfmt+0x230>
  800638:	864a                	mv	a2,s2
  80063a:	85a6                	mv	a1,s1
  80063c:	02d00513          	li	a0,45
  800640:	e042                	sd	a6,0(sp)
  800642:	9982                	jalr	s3
  800644:	6802                	ld	a6,0(sp)
  800646:	8aea                	mv	s5,s10
  800648:	408006b3          	neg	a3,s0
  80064c:	4729                	li	a4,10
  80064e:	bd01                	j	80045e <vprintfmt+0x156>
  800650:	03805163          	blez	s8,800672 <vprintfmt+0x36a>
  800654:	02d00693          	li	a3,45
  800658:	f6d81be3          	bne	a6,a3,8005ce <vprintfmt+0x2c6>
  80065c:	00000417          	auipc	s0,0x0
  800660:	21440413          	addi	s0,s0,532 # 800870 <main+0x1ca>
  800664:	02800693          	li	a3,40
  800668:	02800513          	li	a0,40
  80066c:	00140a93          	addi	s5,s0,1
  800670:	b55d                	j	800516 <vprintfmt+0x20e>
  800672:	00000a97          	auipc	s5,0x0
  800676:	1ffa8a93          	addi	s5,s5,511 # 800871 <main+0x1cb>
  80067a:	02800513          	li	a0,40
  80067e:	02800693          	li	a3,40
  800682:	05e00413          	li	s0,94
  800686:	bd51                	j	80051a <vprintfmt+0x212>

0000000000800688 <printfmt>:
  800688:	7139                	addi	sp,sp,-64
  80068a:	02010313          	addi	t1,sp,32
  80068e:	f03a                	sd	a4,32(sp)
  800690:	871a                	mv	a4,t1
  800692:	ec06                	sd	ra,24(sp)
  800694:	f43e                	sd	a5,40(sp)
  800696:	f842                	sd	a6,48(sp)
  800698:	fc46                	sd	a7,56(sp)
  80069a:	e41a                	sd	t1,8(sp)
  80069c:	c6dff0ef          	jal	ra,800308 <vprintfmt>
  8006a0:	60e2                	ld	ra,24(sp)
  8006a2:	6121                	addi	sp,sp,64
  8006a4:	8082                	ret

00000000008006a6 <main>:
  8006a6:	1101                	addi	sp,sp,-32
  8006a8:	ec06                	sd	ra,24(sp)
  8006aa:	e822                	sd	s0,16(sp)
  8006ac:	a81ff0ef          	jal	ra,80012c <fork>
  8006b0:	c169                	beqz	a0,800772 <main+0xcc>
  8006b2:	842a                	mv	s0,a0
  8006b4:	0aa05063          	blez	a0,800754 <main+0xae>
  8006b8:	4581                	li	a1,0
  8006ba:	557d                	li	a0,-1
  8006bc:	a73ff0ef          	jal	ra,80012e <waitpid>
  8006c0:	c93d                	beqz	a0,800736 <main+0x90>
  8006c2:	458d                	li	a1,3
  8006c4:	05fa                	slli	a1,a1,0x1e
  8006c6:	8522                	mv	a0,s0
  8006c8:	a67ff0ef          	jal	ra,80012e <waitpid>
  8006cc:	c531                	beqz	a0,800718 <main+0x72>
  8006ce:	006c                	addi	a1,sp,12
  8006d0:	8522                	mv	a0,s0
  8006d2:	a5dff0ef          	jal	ra,80012e <waitpid>
  8006d6:	e115                	bnez	a0,8006fa <main+0x54>
  8006d8:	4732                	lw	a4,12(sp)
  8006da:	67b1                	lui	a5,0xc
  8006dc:	eaf78793          	addi	a5,a5,-337 # beaf <__panic-0x7f4171>
  8006e0:	00f71d63          	bne	a4,a5,8006fa <main+0x54>
  8006e4:	00000517          	auipc	a0,0x0
  8006e8:	65c50513          	addi	a0,a0,1628 # 800d40 <error_string+0x180>
  8006ec:	a97ff0ef          	jal	ra,800182 <cprintf>
  8006f0:	60e2                	ld	ra,24(sp)
  8006f2:	6442                	ld	s0,16(sp)
  8006f4:	4501                	li	a0,0
  8006f6:	6105                	addi	sp,sp,32
  8006f8:	8082                	ret
  8006fa:	00000697          	auipc	a3,0x0
  8006fe:	60e68693          	addi	a3,a3,1550 # 800d08 <error_string+0x148>
  800702:	00000617          	auipc	a2,0x0
  800706:	59e60613          	addi	a2,a2,1438 # 800ca0 <error_string+0xe0>
  80070a:	45c9                	li	a1,18
  80070c:	00000517          	auipc	a0,0x0
  800710:	5ac50513          	addi	a0,a0,1452 # 800cb8 <error_string+0xf8>
  800714:	90dff0ef          	jal	ra,800020 <__panic>
  800718:	00000697          	auipc	a3,0x0
  80071c:	5c868693          	addi	a3,a3,1480 # 800ce0 <error_string+0x120>
  800720:	00000617          	auipc	a2,0x0
  800724:	58060613          	addi	a2,a2,1408 # 800ca0 <error_string+0xe0>
  800728:	45c5                	li	a1,17
  80072a:	00000517          	auipc	a0,0x0
  80072e:	58e50513          	addi	a0,a0,1422 # 800cb8 <error_string+0xf8>
  800732:	8efff0ef          	jal	ra,800020 <__panic>
  800736:	00000697          	auipc	a3,0x0
  80073a:	59268693          	addi	a3,a3,1426 # 800cc8 <error_string+0x108>
  80073e:	00000617          	auipc	a2,0x0
  800742:	56260613          	addi	a2,a2,1378 # 800ca0 <error_string+0xe0>
  800746:	45c1                	li	a1,16
  800748:	00000517          	auipc	a0,0x0
  80074c:	57050513          	addi	a0,a0,1392 # 800cb8 <error_string+0xf8>
  800750:	8d1ff0ef          	jal	ra,800020 <__panic>
  800754:	00000697          	auipc	a3,0x0
  800758:	54468693          	addi	a3,a3,1348 # 800c98 <error_string+0xd8>
  80075c:	00000617          	auipc	a2,0x0
  800760:	54460613          	addi	a2,a2,1348 # 800ca0 <error_string+0xe0>
  800764:	45bd                	li	a1,15
  800766:	00000517          	auipc	a0,0x0
  80076a:	55250513          	addi	a0,a0,1362 # 800cb8 <error_string+0xf8>
  80076e:	8b3ff0ef          	jal	ra,800020 <__panic>
  800772:	00000517          	auipc	a0,0x0
  800776:	51650513          	addi	a0,a0,1302 # 800c88 <error_string+0xc8>
  80077a:	a09ff0ef          	jal	ra,800182 <cprintf>
  80077e:	4429                	li	s0,10
  800780:	347d                	addiw	s0,s0,-1
  800782:	9afff0ef          	jal	ra,800130 <yield>
  800786:	fc6d                	bnez	s0,800780 <main+0xda>
  800788:	6531                	lui	a0,0xc
  80078a:	eaf50513          	addi	a0,a0,-337 # beaf <__panic-0x7f4171>
  80078e:	989ff0ef          	jal	ra,800116 <exit>
