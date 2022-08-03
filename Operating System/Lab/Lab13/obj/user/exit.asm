
obj/__user_exit.out:     file format elf64-littleriscv


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
  800034:	79050513          	addi	a0,a0,1936 # 8007c0 <main+0x114>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	144000ef          	jal	ra,800188 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	116000ef          	jal	ra,800162 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	7e850513          	addi	a0,a0,2024 # 800838 <main+0x18c>
  800058:	130000ef          	jal	ra,800188 <cprintf>
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
  800076:	76e50513          	addi	a0,a0,1902 # 8007e0 <main+0x134>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	102000ef          	jal	ra,800188 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0d4000ef          	jal	ra,800162 <vcprintf>
  800092:	00000517          	auipc	a0,0x0
  800096:	7a650513          	addi	a0,a0,1958 # 800838 <main+0x18c>
  80009a:	0ee000ef          	jal	ra,800188 <cprintf>
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
  800122:	6e250513          	addi	a0,a0,1762 # 800800 <main+0x154>
  800126:	062000ef          	jal	ra,800188 <cprintf>
  80012a:	a001                	j	80012a <exit+0x14>

000000000080012c <fork>:
  80012c:	bf65                	j	8000e4 <sys_fork>

000000000080012e <wait>:
  80012e:	4581                	li	a1,0
  800130:	4501                	li	a0,0
  800132:	bf5d                	j	8000e8 <sys_wait>

0000000000800134 <waitpid>:
  800134:	bf55                	j	8000e8 <sys_wait>

0000000000800136 <yield>:
  800136:	bf6d                	j	8000f0 <sys_yield>

0000000000800138 <_start>:
  800138:	0d0000ef          	jal	ra,800208 <umain>
  80013c:	a001                	j	80013c <_start+0x4>

000000000080013e <open>:
  80013e:	1582                	slli	a1,a1,0x20
  800140:	9181                	srli	a1,a1,0x20
  800142:	bf65                	j	8000fa <sys_open>

0000000000800144 <close>:
  800144:	b7c1                	j	800104 <sys_close>

0000000000800146 <dup2>:
  800146:	b7d9                	j	80010c <sys_dup>

0000000000800148 <cputch>:
  800148:	1141                	addi	sp,sp,-16
  80014a:	e022                	sd	s0,0(sp)
  80014c:	e406                	sd	ra,8(sp)
  80014e:	842e                	mv	s0,a1
  800150:	fa5ff0ef          	jal	ra,8000f4 <sys_putc>
  800154:	401c                	lw	a5,0(s0)
  800156:	60a2                	ld	ra,8(sp)
  800158:	2785                	addiw	a5,a5,1
  80015a:	c01c                	sw	a5,0(s0)
  80015c:	6402                	ld	s0,0(sp)
  80015e:	0141                	addi	sp,sp,16
  800160:	8082                	ret

0000000000800162 <vcprintf>:
  800162:	1101                	addi	sp,sp,-32
  800164:	872e                	mv	a4,a1
  800166:	75dd                	lui	a1,0xffff7
  800168:	86aa                	mv	a3,a0
  80016a:	0070                	addi	a2,sp,12
  80016c:	00000517          	auipc	a0,0x0
  800170:	fdc50513          	addi	a0,a0,-36 # 800148 <cputch>
  800174:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <magic+0xffffffffff7f5ad9>
  800178:	ec06                	sd	ra,24(sp)
  80017a:	c602                	sw	zero,12(sp)
  80017c:	192000ef          	jal	ra,80030e <vprintfmt>
  800180:	60e2                	ld	ra,24(sp)
  800182:	4532                	lw	a0,12(sp)
  800184:	6105                	addi	sp,sp,32
  800186:	8082                	ret

0000000000800188 <cprintf>:
  800188:	711d                	addi	sp,sp,-96
  80018a:	02810313          	addi	t1,sp,40
  80018e:	8e2a                	mv	t3,a0
  800190:	f42e                	sd	a1,40(sp)
  800192:	75dd                	lui	a1,0xffff7
  800194:	f832                	sd	a2,48(sp)
  800196:	fc36                	sd	a3,56(sp)
  800198:	e0ba                	sd	a4,64(sp)
  80019a:	00000517          	auipc	a0,0x0
  80019e:	fae50513          	addi	a0,a0,-82 # 800148 <cputch>
  8001a2:	0050                	addi	a2,sp,4
  8001a4:	871a                	mv	a4,t1
  8001a6:	86f2                	mv	a3,t3
  8001a8:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <magic+0xffffffffff7f5ad9>
  8001ac:	ec06                	sd	ra,24(sp)
  8001ae:	e4be                	sd	a5,72(sp)
  8001b0:	e8c2                	sd	a6,80(sp)
  8001b2:	ecc6                	sd	a7,88(sp)
  8001b4:	e41a                	sd	t1,8(sp)
  8001b6:	c202                	sw	zero,4(sp)
  8001b8:	156000ef          	jal	ra,80030e <vprintfmt>
  8001bc:	60e2                	ld	ra,24(sp)
  8001be:	4512                	lw	a0,4(sp)
  8001c0:	6125                	addi	sp,sp,96
  8001c2:	8082                	ret

00000000008001c4 <initfd>:
  8001c4:	1101                	addi	sp,sp,-32
  8001c6:	87ae                	mv	a5,a1
  8001c8:	e426                	sd	s1,8(sp)
  8001ca:	85b2                	mv	a1,a2
  8001cc:	84aa                	mv	s1,a0
  8001ce:	853e                	mv	a0,a5
  8001d0:	e822                	sd	s0,16(sp)
  8001d2:	ec06                	sd	ra,24(sp)
  8001d4:	f6bff0ef          	jal	ra,80013e <open>
  8001d8:	842a                	mv	s0,a0
  8001da:	00054463          	bltz	a0,8001e2 <initfd+0x1e>
  8001de:	00951863          	bne	a0,s1,8001ee <initfd+0x2a>
  8001e2:	60e2                	ld	ra,24(sp)
  8001e4:	8522                	mv	a0,s0
  8001e6:	6442                	ld	s0,16(sp)
  8001e8:	64a2                	ld	s1,8(sp)
  8001ea:	6105                	addi	sp,sp,32
  8001ec:	8082                	ret
  8001ee:	8526                	mv	a0,s1
  8001f0:	f55ff0ef          	jal	ra,800144 <close>
  8001f4:	85a6                	mv	a1,s1
  8001f6:	8522                	mv	a0,s0
  8001f8:	f4fff0ef          	jal	ra,800146 <dup2>
  8001fc:	84aa                	mv	s1,a0
  8001fe:	8522                	mv	a0,s0
  800200:	f45ff0ef          	jal	ra,800144 <close>
  800204:	8426                	mv	s0,s1
  800206:	bff1                	j	8001e2 <initfd+0x1e>

0000000000800208 <umain>:
  800208:	1101                	addi	sp,sp,-32
  80020a:	e822                	sd	s0,16(sp)
  80020c:	e426                	sd	s1,8(sp)
  80020e:	842a                	mv	s0,a0
  800210:	84ae                	mv	s1,a1
  800212:	4601                	li	a2,0
  800214:	00000597          	auipc	a1,0x0
  800218:	60458593          	addi	a1,a1,1540 # 800818 <main+0x16c>
  80021c:	4501                	li	a0,0
  80021e:	ec06                	sd	ra,24(sp)
  800220:	fa5ff0ef          	jal	ra,8001c4 <initfd>
  800224:	02054263          	bltz	a0,800248 <umain+0x40>
  800228:	4605                	li	a2,1
  80022a:	00000597          	auipc	a1,0x0
  80022e:	62e58593          	addi	a1,a1,1582 # 800858 <main+0x1ac>
  800232:	4505                	li	a0,1
  800234:	f91ff0ef          	jal	ra,8001c4 <initfd>
  800238:	02054563          	bltz	a0,800262 <umain+0x5a>
  80023c:	85a6                	mv	a1,s1
  80023e:	8522                	mv	a0,s0
  800240:	46c000ef          	jal	ra,8006ac <main>
  800244:	ed3ff0ef          	jal	ra,800116 <exit>
  800248:	86aa                	mv	a3,a0
  80024a:	00000617          	auipc	a2,0x0
  80024e:	5d660613          	addi	a2,a2,1494 # 800820 <main+0x174>
  800252:	45e9                	li	a1,26
  800254:	00000517          	auipc	a0,0x0
  800258:	5ec50513          	addi	a0,a0,1516 # 800840 <main+0x194>
  80025c:	e07ff0ef          	jal	ra,800062 <__warn>
  800260:	b7e1                	j	800228 <umain+0x20>
  800262:	86aa                	mv	a3,a0
  800264:	00000617          	auipc	a2,0x0
  800268:	5fc60613          	addi	a2,a2,1532 # 800860 <main+0x1b4>
  80026c:	45f5                	li	a1,29
  80026e:	00000517          	auipc	a0,0x0
  800272:	5d250513          	addi	a0,a0,1490 # 800840 <main+0x194>
  800276:	dedff0ef          	jal	ra,800062 <__warn>
  80027a:	b7c9                	j	80023c <umain+0x34>

000000000080027c <strnlen>:
  80027c:	872a                	mv	a4,a0
  80027e:	4501                	li	a0,0
  800280:	e589                	bnez	a1,80028a <strnlen+0xe>
  800282:	a811                	j	800296 <strnlen+0x1a>
  800284:	0505                	addi	a0,a0,1
  800286:	00a58763          	beq	a1,a0,800294 <strnlen+0x18>
  80028a:	00a707b3          	add	a5,a4,a0
  80028e:	0007c783          	lbu	a5,0(a5)
  800292:	fbed                	bnez	a5,800284 <strnlen+0x8>
  800294:	8082                	ret
  800296:	8082                	ret

0000000000800298 <printnum>:
  800298:	02071893          	slli	a7,a4,0x20
  80029c:	7139                	addi	sp,sp,-64
  80029e:	0208d893          	srli	a7,a7,0x20
  8002a2:	e456                	sd	s5,8(sp)
  8002a4:	0316fab3          	remu	s5,a3,a7
  8002a8:	f822                	sd	s0,48(sp)
  8002aa:	f426                	sd	s1,40(sp)
  8002ac:	f04a                	sd	s2,32(sp)
  8002ae:	ec4e                	sd	s3,24(sp)
  8002b0:	fc06                	sd	ra,56(sp)
  8002b2:	e852                	sd	s4,16(sp)
  8002b4:	84aa                	mv	s1,a0
  8002b6:	89ae                	mv	s3,a1
  8002b8:	8932                	mv	s2,a2
  8002ba:	fff7841b          	addiw	s0,a5,-1
  8002be:	2a81                	sext.w	s5,s5
  8002c0:	0516f163          	bgeu	a3,a7,800302 <printnum+0x6a>
  8002c4:	8a42                	mv	s4,a6
  8002c6:	00805863          	blez	s0,8002d6 <printnum+0x3e>
  8002ca:	347d                	addiw	s0,s0,-1
  8002cc:	864e                	mv	a2,s3
  8002ce:	85ca                	mv	a1,s2
  8002d0:	8552                	mv	a0,s4
  8002d2:	9482                	jalr	s1
  8002d4:	f87d                	bnez	s0,8002ca <printnum+0x32>
  8002d6:	1a82                	slli	s5,s5,0x20
  8002d8:	020ada93          	srli	s5,s5,0x20
  8002dc:	00000797          	auipc	a5,0x0
  8002e0:	5a478793          	addi	a5,a5,1444 # 800880 <main+0x1d4>
  8002e4:	7442                	ld	s0,48(sp)
  8002e6:	9abe                	add	s5,s5,a5
  8002e8:	000ac503          	lbu	a0,0(s5)
  8002ec:	70e2                	ld	ra,56(sp)
  8002ee:	6a42                	ld	s4,16(sp)
  8002f0:	6aa2                	ld	s5,8(sp)
  8002f2:	864e                	mv	a2,s3
  8002f4:	85ca                	mv	a1,s2
  8002f6:	69e2                	ld	s3,24(sp)
  8002f8:	7902                	ld	s2,32(sp)
  8002fa:	8326                	mv	t1,s1
  8002fc:	74a2                	ld	s1,40(sp)
  8002fe:	6121                	addi	sp,sp,64
  800300:	8302                	jr	t1
  800302:	0316d6b3          	divu	a3,a3,a7
  800306:	87a2                	mv	a5,s0
  800308:	f91ff0ef          	jal	ra,800298 <printnum>
  80030c:	b7e9                	j	8002d6 <printnum+0x3e>

000000000080030e <vprintfmt>:
  80030e:	7119                	addi	sp,sp,-128
  800310:	f4a6                	sd	s1,104(sp)
  800312:	f0ca                	sd	s2,96(sp)
  800314:	ecce                	sd	s3,88(sp)
  800316:	e8d2                	sd	s4,80(sp)
  800318:	e4d6                	sd	s5,72(sp)
  80031a:	e0da                	sd	s6,64(sp)
  80031c:	fc5e                	sd	s7,56(sp)
  80031e:	ec6e                	sd	s11,24(sp)
  800320:	fc86                	sd	ra,120(sp)
  800322:	f8a2                	sd	s0,112(sp)
  800324:	f862                	sd	s8,48(sp)
  800326:	f466                	sd	s9,40(sp)
  800328:	f06a                	sd	s10,32(sp)
  80032a:	89aa                	mv	s3,a0
  80032c:	892e                	mv	s2,a1
  80032e:	84b2                	mv	s1,a2
  800330:	8db6                	mv	s11,a3
  800332:	8aba                	mv	s5,a4
  800334:	02500a13          	li	s4,37
  800338:	5bfd                	li	s7,-1
  80033a:	00000b17          	auipc	s6,0x0
  80033e:	57ab0b13          	addi	s6,s6,1402 # 8008b4 <main+0x208>
  800342:	000dc503          	lbu	a0,0(s11)
  800346:	001d8413          	addi	s0,s11,1
  80034a:	01450b63          	beq	a0,s4,800360 <vprintfmt+0x52>
  80034e:	c129                	beqz	a0,800390 <vprintfmt+0x82>
  800350:	864a                	mv	a2,s2
  800352:	85a6                	mv	a1,s1
  800354:	0405                	addi	s0,s0,1
  800356:	9982                	jalr	s3
  800358:	fff44503          	lbu	a0,-1(s0)
  80035c:	ff4519e3          	bne	a0,s4,80034e <vprintfmt+0x40>
  800360:	00044583          	lbu	a1,0(s0)
  800364:	02000813          	li	a6,32
  800368:	4d01                	li	s10,0
  80036a:	4301                	li	t1,0
  80036c:	5cfd                	li	s9,-1
  80036e:	5c7d                	li	s8,-1
  800370:	05500513          	li	a0,85
  800374:	48a5                	li	a7,9
  800376:	fdd5861b          	addiw	a2,a1,-35
  80037a:	0ff67613          	andi	a2,a2,255
  80037e:	00140d93          	addi	s11,s0,1
  800382:	04c56263          	bltu	a0,a2,8003c6 <vprintfmt+0xb8>
  800386:	060a                	slli	a2,a2,0x2
  800388:	965a                	add	a2,a2,s6
  80038a:	4214                	lw	a3,0(a2)
  80038c:	96da                	add	a3,a3,s6
  80038e:	8682                	jr	a3
  800390:	70e6                	ld	ra,120(sp)
  800392:	7446                	ld	s0,112(sp)
  800394:	74a6                	ld	s1,104(sp)
  800396:	7906                	ld	s2,96(sp)
  800398:	69e6                	ld	s3,88(sp)
  80039a:	6a46                	ld	s4,80(sp)
  80039c:	6aa6                	ld	s5,72(sp)
  80039e:	6b06                	ld	s6,64(sp)
  8003a0:	7be2                	ld	s7,56(sp)
  8003a2:	7c42                	ld	s8,48(sp)
  8003a4:	7ca2                	ld	s9,40(sp)
  8003a6:	7d02                	ld	s10,32(sp)
  8003a8:	6de2                	ld	s11,24(sp)
  8003aa:	6109                	addi	sp,sp,128
  8003ac:	8082                	ret
  8003ae:	882e                	mv	a6,a1
  8003b0:	00144583          	lbu	a1,1(s0)
  8003b4:	846e                	mv	s0,s11
  8003b6:	00140d93          	addi	s11,s0,1
  8003ba:	fdd5861b          	addiw	a2,a1,-35
  8003be:	0ff67613          	andi	a2,a2,255
  8003c2:	fcc572e3          	bgeu	a0,a2,800386 <vprintfmt+0x78>
  8003c6:	864a                	mv	a2,s2
  8003c8:	85a6                	mv	a1,s1
  8003ca:	02500513          	li	a0,37
  8003ce:	9982                	jalr	s3
  8003d0:	fff44783          	lbu	a5,-1(s0)
  8003d4:	8da2                	mv	s11,s0
  8003d6:	f74786e3          	beq	a5,s4,800342 <vprintfmt+0x34>
  8003da:	ffedc783          	lbu	a5,-2(s11)
  8003de:	1dfd                	addi	s11,s11,-1
  8003e0:	ff479de3          	bne	a5,s4,8003da <vprintfmt+0xcc>
  8003e4:	bfb9                	j	800342 <vprintfmt+0x34>
  8003e6:	fd058c9b          	addiw	s9,a1,-48
  8003ea:	00144583          	lbu	a1,1(s0)
  8003ee:	846e                	mv	s0,s11
  8003f0:	fd05869b          	addiw	a3,a1,-48
  8003f4:	0005861b          	sext.w	a2,a1
  8003f8:	02d8e463          	bltu	a7,a3,800420 <vprintfmt+0x112>
  8003fc:	00144583          	lbu	a1,1(s0)
  800400:	002c969b          	slliw	a3,s9,0x2
  800404:	0196873b          	addw	a4,a3,s9
  800408:	0017171b          	slliw	a4,a4,0x1
  80040c:	9f31                	addw	a4,a4,a2
  80040e:	fd05869b          	addiw	a3,a1,-48
  800412:	0405                	addi	s0,s0,1
  800414:	fd070c9b          	addiw	s9,a4,-48
  800418:	0005861b          	sext.w	a2,a1
  80041c:	fed8f0e3          	bgeu	a7,a3,8003fc <vprintfmt+0xee>
  800420:	f40c5be3          	bgez	s8,800376 <vprintfmt+0x68>
  800424:	8c66                	mv	s8,s9
  800426:	5cfd                	li	s9,-1
  800428:	b7b9                	j	800376 <vprintfmt+0x68>
  80042a:	fffc4693          	not	a3,s8
  80042e:	96fd                	srai	a3,a3,0x3f
  800430:	00dc77b3          	and	a5,s8,a3
  800434:	00144583          	lbu	a1,1(s0)
  800438:	00078c1b          	sext.w	s8,a5
  80043c:	846e                	mv	s0,s11
  80043e:	bf25                	j	800376 <vprintfmt+0x68>
  800440:	000aac83          	lw	s9,0(s5)
  800444:	00144583          	lbu	a1,1(s0)
  800448:	0aa1                	addi	s5,s5,8
  80044a:	846e                	mv	s0,s11
  80044c:	bfd1                	j	800420 <vprintfmt+0x112>
  80044e:	4705                	li	a4,1
  800450:	008a8613          	addi	a2,s5,8
  800454:	00674463          	blt	a4,t1,80045c <vprintfmt+0x14e>
  800458:	1c030c63          	beqz	t1,800630 <vprintfmt+0x322>
  80045c:	000ab683          	ld	a3,0(s5)
  800460:	4741                	li	a4,16
  800462:	8ab2                	mv	s5,a2
  800464:	2801                	sext.w	a6,a6
  800466:	87e2                	mv	a5,s8
  800468:	8626                	mv	a2,s1
  80046a:	85ca                	mv	a1,s2
  80046c:	854e                	mv	a0,s3
  80046e:	e2bff0ef          	jal	ra,800298 <printnum>
  800472:	bdc1                	j	800342 <vprintfmt+0x34>
  800474:	000aa503          	lw	a0,0(s5)
  800478:	864a                	mv	a2,s2
  80047a:	85a6                	mv	a1,s1
  80047c:	0aa1                	addi	s5,s5,8
  80047e:	9982                	jalr	s3
  800480:	b5c9                	j	800342 <vprintfmt+0x34>
  800482:	4705                	li	a4,1
  800484:	008a8613          	addi	a2,s5,8
  800488:	00674463          	blt	a4,t1,800490 <vprintfmt+0x182>
  80048c:	18030d63          	beqz	t1,800626 <vprintfmt+0x318>
  800490:	000ab683          	ld	a3,0(s5)
  800494:	4729                	li	a4,10
  800496:	8ab2                	mv	s5,a2
  800498:	b7f1                	j	800464 <vprintfmt+0x156>
  80049a:	00144583          	lbu	a1,1(s0)
  80049e:	4d05                	li	s10,1
  8004a0:	846e                	mv	s0,s11
  8004a2:	bdd1                	j	800376 <vprintfmt+0x68>
  8004a4:	864a                	mv	a2,s2
  8004a6:	85a6                	mv	a1,s1
  8004a8:	02500513          	li	a0,37
  8004ac:	9982                	jalr	s3
  8004ae:	bd51                	j	800342 <vprintfmt+0x34>
  8004b0:	00144583          	lbu	a1,1(s0)
  8004b4:	2305                	addiw	t1,t1,1
  8004b6:	846e                	mv	s0,s11
  8004b8:	bd7d                	j	800376 <vprintfmt+0x68>
  8004ba:	4705                	li	a4,1
  8004bc:	008a8613          	addi	a2,s5,8
  8004c0:	00674463          	blt	a4,t1,8004c8 <vprintfmt+0x1ba>
  8004c4:	14030c63          	beqz	t1,80061c <vprintfmt+0x30e>
  8004c8:	000ab683          	ld	a3,0(s5)
  8004cc:	4721                	li	a4,8
  8004ce:	8ab2                	mv	s5,a2
  8004d0:	bf51                	j	800464 <vprintfmt+0x156>
  8004d2:	03000513          	li	a0,48
  8004d6:	864a                	mv	a2,s2
  8004d8:	85a6                	mv	a1,s1
  8004da:	e042                	sd	a6,0(sp)
  8004dc:	9982                	jalr	s3
  8004de:	864a                	mv	a2,s2
  8004e0:	85a6                	mv	a1,s1
  8004e2:	07800513          	li	a0,120
  8004e6:	9982                	jalr	s3
  8004e8:	0aa1                	addi	s5,s5,8
  8004ea:	6802                	ld	a6,0(sp)
  8004ec:	4741                	li	a4,16
  8004ee:	ff8ab683          	ld	a3,-8(s5)
  8004f2:	bf8d                	j	800464 <vprintfmt+0x156>
  8004f4:	000ab403          	ld	s0,0(s5)
  8004f8:	008a8793          	addi	a5,s5,8
  8004fc:	e03e                	sd	a5,0(sp)
  8004fe:	14040c63          	beqz	s0,800656 <vprintfmt+0x348>
  800502:	11805063          	blez	s8,800602 <vprintfmt+0x2f4>
  800506:	02d00693          	li	a3,45
  80050a:	0cd81963          	bne	a6,a3,8005dc <vprintfmt+0x2ce>
  80050e:	00044683          	lbu	a3,0(s0)
  800512:	0006851b          	sext.w	a0,a3
  800516:	ce8d                	beqz	a3,800550 <vprintfmt+0x242>
  800518:	00140a93          	addi	s5,s0,1
  80051c:	05e00413          	li	s0,94
  800520:	000cc563          	bltz	s9,80052a <vprintfmt+0x21c>
  800524:	3cfd                	addiw	s9,s9,-1
  800526:	037c8363          	beq	s9,s7,80054c <vprintfmt+0x23e>
  80052a:	864a                	mv	a2,s2
  80052c:	85a6                	mv	a1,s1
  80052e:	100d0663          	beqz	s10,80063a <vprintfmt+0x32c>
  800532:	3681                	addiw	a3,a3,-32
  800534:	10d47363          	bgeu	s0,a3,80063a <vprintfmt+0x32c>
  800538:	03f00513          	li	a0,63
  80053c:	9982                	jalr	s3
  80053e:	000ac683          	lbu	a3,0(s5)
  800542:	3c7d                	addiw	s8,s8,-1
  800544:	0a85                	addi	s5,s5,1
  800546:	0006851b          	sext.w	a0,a3
  80054a:	faf9                	bnez	a3,800520 <vprintfmt+0x212>
  80054c:	01805a63          	blez	s8,800560 <vprintfmt+0x252>
  800550:	3c7d                	addiw	s8,s8,-1
  800552:	864a                	mv	a2,s2
  800554:	85a6                	mv	a1,s1
  800556:	02000513          	li	a0,32
  80055a:	9982                	jalr	s3
  80055c:	fe0c1ae3          	bnez	s8,800550 <vprintfmt+0x242>
  800560:	6a82                	ld	s5,0(sp)
  800562:	b3c5                	j	800342 <vprintfmt+0x34>
  800564:	4705                	li	a4,1
  800566:	008a8d13          	addi	s10,s5,8
  80056a:	00674463          	blt	a4,t1,800572 <vprintfmt+0x264>
  80056e:	0a030463          	beqz	t1,800616 <vprintfmt+0x308>
  800572:	000ab403          	ld	s0,0(s5)
  800576:	0c044463          	bltz	s0,80063e <vprintfmt+0x330>
  80057a:	86a2                	mv	a3,s0
  80057c:	8aea                	mv	s5,s10
  80057e:	4729                	li	a4,10
  800580:	b5d5                	j	800464 <vprintfmt+0x156>
  800582:	000aa783          	lw	a5,0(s5)
  800586:	46e1                	li	a3,24
  800588:	0aa1                	addi	s5,s5,8
  80058a:	41f7d71b          	sraiw	a4,a5,0x1f
  80058e:	8fb9                	xor	a5,a5,a4
  800590:	40e7873b          	subw	a4,a5,a4
  800594:	02e6c663          	blt	a3,a4,8005c0 <vprintfmt+0x2b2>
  800598:	00371793          	slli	a5,a4,0x3
  80059c:	00000697          	auipc	a3,0x0
  8005a0:	64c68693          	addi	a3,a3,1612 # 800be8 <error_string>
  8005a4:	97b6                	add	a5,a5,a3
  8005a6:	639c                	ld	a5,0(a5)
  8005a8:	cf81                	beqz	a5,8005c0 <vprintfmt+0x2b2>
  8005aa:	873e                	mv	a4,a5
  8005ac:	00000697          	auipc	a3,0x0
  8005b0:	30468693          	addi	a3,a3,772 # 8008b0 <main+0x204>
  8005b4:	8626                	mv	a2,s1
  8005b6:	85ca                	mv	a1,s2
  8005b8:	854e                	mv	a0,s3
  8005ba:	0d4000ef          	jal	ra,80068e <printfmt>
  8005be:	b351                	j	800342 <vprintfmt+0x34>
  8005c0:	00000697          	auipc	a3,0x0
  8005c4:	2e068693          	addi	a3,a3,736 # 8008a0 <main+0x1f4>
  8005c8:	8626                	mv	a2,s1
  8005ca:	85ca                	mv	a1,s2
  8005cc:	854e                	mv	a0,s3
  8005ce:	0c0000ef          	jal	ra,80068e <printfmt>
  8005d2:	bb85                	j	800342 <vprintfmt+0x34>
  8005d4:	00000417          	auipc	s0,0x0
  8005d8:	2c440413          	addi	s0,s0,708 # 800898 <main+0x1ec>
  8005dc:	85e6                	mv	a1,s9
  8005de:	8522                	mv	a0,s0
  8005e0:	e442                	sd	a6,8(sp)
  8005e2:	c9bff0ef          	jal	ra,80027c <strnlen>
  8005e6:	40ac0c3b          	subw	s8,s8,a0
  8005ea:	01805c63          	blez	s8,800602 <vprintfmt+0x2f4>
  8005ee:	6822                	ld	a6,8(sp)
  8005f0:	00080a9b          	sext.w	s5,a6
  8005f4:	3c7d                	addiw	s8,s8,-1
  8005f6:	864a                	mv	a2,s2
  8005f8:	85a6                	mv	a1,s1
  8005fa:	8556                	mv	a0,s5
  8005fc:	9982                	jalr	s3
  8005fe:	fe0c1be3          	bnez	s8,8005f4 <vprintfmt+0x2e6>
  800602:	00044683          	lbu	a3,0(s0)
  800606:	00140a93          	addi	s5,s0,1
  80060a:	0006851b          	sext.w	a0,a3
  80060e:	daa9                	beqz	a3,800560 <vprintfmt+0x252>
  800610:	05e00413          	li	s0,94
  800614:	b731                	j	800520 <vprintfmt+0x212>
  800616:	000aa403          	lw	s0,0(s5)
  80061a:	bfb1                	j	800576 <vprintfmt+0x268>
  80061c:	000ae683          	lwu	a3,0(s5)
  800620:	4721                	li	a4,8
  800622:	8ab2                	mv	s5,a2
  800624:	b581                	j	800464 <vprintfmt+0x156>
  800626:	000ae683          	lwu	a3,0(s5)
  80062a:	4729                	li	a4,10
  80062c:	8ab2                	mv	s5,a2
  80062e:	bd1d                	j	800464 <vprintfmt+0x156>
  800630:	000ae683          	lwu	a3,0(s5)
  800634:	4741                	li	a4,16
  800636:	8ab2                	mv	s5,a2
  800638:	b535                	j	800464 <vprintfmt+0x156>
  80063a:	9982                	jalr	s3
  80063c:	b709                	j	80053e <vprintfmt+0x230>
  80063e:	864a                	mv	a2,s2
  800640:	85a6                	mv	a1,s1
  800642:	02d00513          	li	a0,45
  800646:	e042                	sd	a6,0(sp)
  800648:	9982                	jalr	s3
  80064a:	6802                	ld	a6,0(sp)
  80064c:	8aea                	mv	s5,s10
  80064e:	408006b3          	neg	a3,s0
  800652:	4729                	li	a4,10
  800654:	bd01                	j	800464 <vprintfmt+0x156>
  800656:	03805163          	blez	s8,800678 <vprintfmt+0x36a>
  80065a:	02d00693          	li	a3,45
  80065e:	f6d81be3          	bne	a6,a3,8005d4 <vprintfmt+0x2c6>
  800662:	00000417          	auipc	s0,0x0
  800666:	23640413          	addi	s0,s0,566 # 800898 <main+0x1ec>
  80066a:	02800693          	li	a3,40
  80066e:	02800513          	li	a0,40
  800672:	00140a93          	addi	s5,s0,1
  800676:	b55d                	j	80051c <vprintfmt+0x20e>
  800678:	00000a97          	auipc	s5,0x0
  80067c:	221a8a93          	addi	s5,s5,545 # 800899 <main+0x1ed>
  800680:	02800513          	li	a0,40
  800684:	02800693          	li	a3,40
  800688:	05e00413          	li	s0,94
  80068c:	bd51                	j	800520 <vprintfmt+0x212>

000000000080068e <printfmt>:
  80068e:	7139                	addi	sp,sp,-64
  800690:	02010313          	addi	t1,sp,32
  800694:	f03a                	sd	a4,32(sp)
  800696:	871a                	mv	a4,t1
  800698:	ec06                	sd	ra,24(sp)
  80069a:	f43e                	sd	a5,40(sp)
  80069c:	f842                	sd	a6,48(sp)
  80069e:	fc46                	sd	a7,56(sp)
  8006a0:	e41a                	sd	t1,8(sp)
  8006a2:	c6dff0ef          	jal	ra,80030e <vprintfmt>
  8006a6:	60e2                	ld	ra,24(sp)
  8006a8:	6121                	addi	sp,sp,64
  8006aa:	8082                	ret

00000000008006ac <main>:
  8006ac:	1101                	addi	sp,sp,-32
  8006ae:	00000517          	auipc	a0,0x0
  8006b2:	60250513          	addi	a0,a0,1538 # 800cb0 <error_string+0xc8>
  8006b6:	ec06                	sd	ra,24(sp)
  8006b8:	e822                	sd	s0,16(sp)
  8006ba:	acfff0ef          	jal	ra,800188 <cprintf>
  8006be:	a6fff0ef          	jal	ra,80012c <fork>
  8006c2:	c561                	beqz	a0,80078a <main+0xde>
  8006c4:	842a                	mv	s0,a0
  8006c6:	85aa                	mv	a1,a0
  8006c8:	00000517          	auipc	a0,0x0
  8006cc:	62850513          	addi	a0,a0,1576 # 800cf0 <error_string+0x108>
  8006d0:	ab9ff0ef          	jal	ra,800188 <cprintf>
  8006d4:	08805c63          	blez	s0,80076c <main+0xc0>
  8006d8:	00000517          	auipc	a0,0x0
  8006dc:	67050513          	addi	a0,a0,1648 # 800d48 <error_string+0x160>
  8006e0:	aa9ff0ef          	jal	ra,800188 <cprintf>
  8006e4:	006c                	addi	a1,sp,12
  8006e6:	8522                	mv	a0,s0
  8006e8:	a4dff0ef          	jal	ra,800134 <waitpid>
  8006ec:	e131                	bnez	a0,800730 <main+0x84>
  8006ee:	4732                	lw	a4,12(sp)
  8006f0:	00001797          	auipc	a5,0x1
  8006f4:	9107a783          	lw	a5,-1776(a5) # 801000 <magic>
  8006f8:	02f71c63          	bne	a4,a5,800730 <main+0x84>
  8006fc:	006c                	addi	a1,sp,12
  8006fe:	8522                	mv	a0,s0
  800700:	a35ff0ef          	jal	ra,800134 <waitpid>
  800704:	c529                	beqz	a0,80074e <main+0xa2>
  800706:	a29ff0ef          	jal	ra,80012e <wait>
  80070a:	c131                	beqz	a0,80074e <main+0xa2>
  80070c:	85a2                	mv	a1,s0
  80070e:	00000517          	auipc	a0,0x0
  800712:	6b250513          	addi	a0,a0,1714 # 800dc0 <error_string+0x1d8>
  800716:	a73ff0ef          	jal	ra,800188 <cprintf>
  80071a:	00000517          	auipc	a0,0x0
  80071e:	6b650513          	addi	a0,a0,1718 # 800dd0 <error_string+0x1e8>
  800722:	a67ff0ef          	jal	ra,800188 <cprintf>
  800726:	60e2                	ld	ra,24(sp)
  800728:	6442                	ld	s0,16(sp)
  80072a:	4501                	li	a0,0
  80072c:	6105                	addi	sp,sp,32
  80072e:	8082                	ret
  800730:	00000697          	auipc	a3,0x0
  800734:	63868693          	addi	a3,a3,1592 # 800d68 <error_string+0x180>
  800738:	00000617          	auipc	a2,0x0
  80073c:	5e860613          	addi	a2,a2,1512 # 800d20 <error_string+0x138>
  800740:	45ed                	li	a1,27
  800742:	00000517          	auipc	a0,0x0
  800746:	5f650513          	addi	a0,a0,1526 # 800d38 <error_string+0x150>
  80074a:	8d7ff0ef          	jal	ra,800020 <__panic>
  80074e:	00000697          	auipc	a3,0x0
  800752:	64a68693          	addi	a3,a3,1610 # 800d98 <error_string+0x1b0>
  800756:	00000617          	auipc	a2,0x0
  80075a:	5ca60613          	addi	a2,a2,1482 # 800d20 <error_string+0x138>
  80075e:	45f1                	li	a1,28
  800760:	00000517          	auipc	a0,0x0
  800764:	5d850513          	addi	a0,a0,1496 # 800d38 <error_string+0x150>
  800768:	8b9ff0ef          	jal	ra,800020 <__panic>
  80076c:	00000697          	auipc	a3,0x0
  800770:	5ac68693          	addi	a3,a3,1452 # 800d18 <error_string+0x130>
  800774:	00000617          	auipc	a2,0x0
  800778:	5ac60613          	addi	a2,a2,1452 # 800d20 <error_string+0x138>
  80077c:	45e1                	li	a1,24
  80077e:	00000517          	auipc	a0,0x0
  800782:	5ba50513          	addi	a0,a0,1466 # 800d38 <error_string+0x150>
  800786:	89bff0ef          	jal	ra,800020 <__panic>
  80078a:	00000517          	auipc	a0,0x0
  80078e:	54e50513          	addi	a0,a0,1358 # 800cd8 <error_string+0xf0>
  800792:	9f7ff0ef          	jal	ra,800188 <cprintf>
  800796:	9a1ff0ef          	jal	ra,800136 <yield>
  80079a:	99dff0ef          	jal	ra,800136 <yield>
  80079e:	999ff0ef          	jal	ra,800136 <yield>
  8007a2:	995ff0ef          	jal	ra,800136 <yield>
  8007a6:	991ff0ef          	jal	ra,800136 <yield>
  8007aa:	98dff0ef          	jal	ra,800136 <yield>
  8007ae:	989ff0ef          	jal	ra,800136 <yield>
  8007b2:	00001517          	auipc	a0,0x1
  8007b6:	84e52503          	lw	a0,-1970(a0) # 801000 <magic>
  8007ba:	95dff0ef          	jal	ra,800116 <exit>
