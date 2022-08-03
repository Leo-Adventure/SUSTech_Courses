
obj/__user_waitkill.out:     file format elf64-littleriscv


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
  800034:	7b850513          	addi	a0,a0,1976 # 8007e8 <main+0xac>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	14c000ef          	jal	ra,800190 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	11e000ef          	jal	ra,80016a <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	c9050513          	addi	a0,a0,-880 # 800ce0 <error_string+0xd0>
  800058:	138000ef          	jal	ra,800190 <cprintf>
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
  800072:	00000517          	auipc	a0,0x0
  800076:	79650513          	addi	a0,a0,1942 # 800808 <main+0xcc>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	10a000ef          	jal	ra,800190 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	0dc000ef          	jal	ra,80016a <vcprintf>
  800092:	00001517          	auipc	a0,0x1
  800096:	c4e50513          	addi	a0,a0,-946 # 800ce0 <error_string+0xd0>
  80009a:	0f6000ef          	jal	ra,800190 <cprintf>
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
  800128:	00000517          	auipc	a0,0x0
  80012c:	70050513          	addi	a0,a0,1792 # 800828 <main+0xec>
  800130:	060000ef          	jal	ra,800190 <cprintf>
  800134:	a001                	j	800134 <exit+0x14>

0000000000800136 <fork>:
  800136:	b77d                	j	8000e4 <sys_fork>

0000000000800138 <waitpid>:
  800138:	bf45                	j	8000e8 <sys_wait>

000000000080013a <yield>:
  80013a:	bf5d                	j	8000f0 <sys_yield>

000000000080013c <kill>:
  80013c:	bf65                	j	8000f4 <sys_kill>

000000000080013e <getpid>:
  80013e:	bf75                	j	8000fa <sys_getpid>

0000000000800140 <_start>:
  800140:	0d0000ef          	jal	ra,800210 <umain>
  800144:	a001                	j	800144 <_start+0x4>

0000000000800146 <open>:
  800146:	1582                	slli	a1,a1,0x20
  800148:	9181                	srli	a1,a1,0x20
  80014a:	bf6d                	j	800104 <sys_open>

000000000080014c <close>:
  80014c:	b7c9                	j	80010e <sys_close>

000000000080014e <dup2>:
  80014e:	b7e1                	j	800116 <sys_dup>

0000000000800150 <cputch>:
  800150:	1141                	addi	sp,sp,-16
  800152:	e022                	sd	s0,0(sp)
  800154:	e406                	sd	ra,8(sp)
  800156:	842e                	mv	s0,a1
  800158:	fa7ff0ef          	jal	ra,8000fe <sys_putc>
  80015c:	401c                	lw	a5,0(s0)
  80015e:	60a2                	ld	ra,8(sp)
  800160:	2785                	addiw	a5,a5,1
  800162:	c01c                	sw	a5,0(s0)
  800164:	6402                	ld	s0,0(sp)
  800166:	0141                	addi	sp,sp,16
  800168:	8082                	ret

000000000080016a <vcprintf>:
  80016a:	1101                	addi	sp,sp,-32
  80016c:	872e                	mv	a4,a1
  80016e:	75dd                	lui	a1,0xffff7
  800170:	86aa                	mv	a3,a0
  800172:	0070                	addi	a2,sp,12
  800174:	00000517          	auipc	a0,0x0
  800178:	fdc50513          	addi	a0,a0,-36 # 800150 <cputch>
  80017c:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <pid1+0xffffffffff7f5ad1>
  800180:	ec06                	sd	ra,24(sp)
  800182:	c602                	sw	zero,12(sp)
  800184:	192000ef          	jal	ra,800316 <vprintfmt>
  800188:	60e2                	ld	ra,24(sp)
  80018a:	4532                	lw	a0,12(sp)
  80018c:	6105                	addi	sp,sp,32
  80018e:	8082                	ret

0000000000800190 <cprintf>:
  800190:	711d                	addi	sp,sp,-96
  800192:	02810313          	addi	t1,sp,40
  800196:	8e2a                	mv	t3,a0
  800198:	f42e                	sd	a1,40(sp)
  80019a:	75dd                	lui	a1,0xffff7
  80019c:	f832                	sd	a2,48(sp)
  80019e:	fc36                	sd	a3,56(sp)
  8001a0:	e0ba                	sd	a4,64(sp)
  8001a2:	00000517          	auipc	a0,0x0
  8001a6:	fae50513          	addi	a0,a0,-82 # 800150 <cputch>
  8001aa:	0050                	addi	a2,sp,4
  8001ac:	871a                	mv	a4,t1
  8001ae:	86f2                	mv	a3,t3
  8001b0:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <pid1+0xffffffffff7f5ad1>
  8001b4:	ec06                	sd	ra,24(sp)
  8001b6:	e4be                	sd	a5,72(sp)
  8001b8:	e8c2                	sd	a6,80(sp)
  8001ba:	ecc6                	sd	a7,88(sp)
  8001bc:	e41a                	sd	t1,8(sp)
  8001be:	c202                	sw	zero,4(sp)
  8001c0:	156000ef          	jal	ra,800316 <vprintfmt>
  8001c4:	60e2                	ld	ra,24(sp)
  8001c6:	4512                	lw	a0,4(sp)
  8001c8:	6125                	addi	sp,sp,96
  8001ca:	8082                	ret

00000000008001cc <initfd>:
  8001cc:	1101                	addi	sp,sp,-32
  8001ce:	87ae                	mv	a5,a1
  8001d0:	e426                	sd	s1,8(sp)
  8001d2:	85b2                	mv	a1,a2
  8001d4:	84aa                	mv	s1,a0
  8001d6:	853e                	mv	a0,a5
  8001d8:	e822                	sd	s0,16(sp)
  8001da:	ec06                	sd	ra,24(sp)
  8001dc:	f6bff0ef          	jal	ra,800146 <open>
  8001e0:	842a                	mv	s0,a0
  8001e2:	00054463          	bltz	a0,8001ea <initfd+0x1e>
  8001e6:	00951863          	bne	a0,s1,8001f6 <initfd+0x2a>
  8001ea:	60e2                	ld	ra,24(sp)
  8001ec:	8522                	mv	a0,s0
  8001ee:	6442                	ld	s0,16(sp)
  8001f0:	64a2                	ld	s1,8(sp)
  8001f2:	6105                	addi	sp,sp,32
  8001f4:	8082                	ret
  8001f6:	8526                	mv	a0,s1
  8001f8:	f55ff0ef          	jal	ra,80014c <close>
  8001fc:	85a6                	mv	a1,s1
  8001fe:	8522                	mv	a0,s0
  800200:	f4fff0ef          	jal	ra,80014e <dup2>
  800204:	84aa                	mv	s1,a0
  800206:	8522                	mv	a0,s0
  800208:	f45ff0ef          	jal	ra,80014c <close>
  80020c:	8426                	mv	s0,s1
  80020e:	bff1                	j	8001ea <initfd+0x1e>

0000000000800210 <umain>:
  800210:	1101                	addi	sp,sp,-32
  800212:	e822                	sd	s0,16(sp)
  800214:	e426                	sd	s1,8(sp)
  800216:	842a                	mv	s0,a0
  800218:	84ae                	mv	s1,a1
  80021a:	4601                	li	a2,0
  80021c:	00000597          	auipc	a1,0x0
  800220:	62458593          	addi	a1,a1,1572 # 800840 <main+0x104>
  800224:	4501                	li	a0,0
  800226:	ec06                	sd	ra,24(sp)
  800228:	fa5ff0ef          	jal	ra,8001cc <initfd>
  80022c:	02054263          	bltz	a0,800250 <umain+0x40>
  800230:	4605                	li	a2,1
  800232:	00000597          	auipc	a1,0x0
  800236:	64e58593          	addi	a1,a1,1614 # 800880 <main+0x144>
  80023a:	4505                	li	a0,1
  80023c:	f91ff0ef          	jal	ra,8001cc <initfd>
  800240:	02054563          	bltz	a0,80026a <umain+0x5a>
  800244:	85a6                	mv	a1,s1
  800246:	8522                	mv	a0,s0
  800248:	4f4000ef          	jal	ra,80073c <main>
  80024c:	ed5ff0ef          	jal	ra,800120 <exit>
  800250:	86aa                	mv	a3,a0
  800252:	00000617          	auipc	a2,0x0
  800256:	5f660613          	addi	a2,a2,1526 # 800848 <main+0x10c>
  80025a:	45e9                	li	a1,26
  80025c:	00000517          	auipc	a0,0x0
  800260:	60c50513          	addi	a0,a0,1548 # 800868 <main+0x12c>
  800264:	dffff0ef          	jal	ra,800062 <__warn>
  800268:	b7e1                	j	800230 <umain+0x20>
  80026a:	86aa                	mv	a3,a0
  80026c:	00000617          	auipc	a2,0x0
  800270:	61c60613          	addi	a2,a2,1564 # 800888 <main+0x14c>
  800274:	45f5                	li	a1,29
  800276:	00000517          	auipc	a0,0x0
  80027a:	5f250513          	addi	a0,a0,1522 # 800868 <main+0x12c>
  80027e:	de5ff0ef          	jal	ra,800062 <__warn>
  800282:	b7c9                	j	800244 <umain+0x34>

0000000000800284 <strnlen>:
  800284:	872a                	mv	a4,a0
  800286:	4501                	li	a0,0
  800288:	e589                	bnez	a1,800292 <strnlen+0xe>
  80028a:	a811                	j	80029e <strnlen+0x1a>
  80028c:	0505                	addi	a0,a0,1
  80028e:	00a58763          	beq	a1,a0,80029c <strnlen+0x18>
  800292:	00a707b3          	add	a5,a4,a0
  800296:	0007c783          	lbu	a5,0(a5)
  80029a:	fbed                	bnez	a5,80028c <strnlen+0x8>
  80029c:	8082                	ret
  80029e:	8082                	ret

00000000008002a0 <printnum>:
  8002a0:	02071893          	slli	a7,a4,0x20
  8002a4:	7139                	addi	sp,sp,-64
  8002a6:	0208d893          	srli	a7,a7,0x20
  8002aa:	e456                	sd	s5,8(sp)
  8002ac:	0316fab3          	remu	s5,a3,a7
  8002b0:	f822                	sd	s0,48(sp)
  8002b2:	f426                	sd	s1,40(sp)
  8002b4:	f04a                	sd	s2,32(sp)
  8002b6:	ec4e                	sd	s3,24(sp)
  8002b8:	fc06                	sd	ra,56(sp)
  8002ba:	e852                	sd	s4,16(sp)
  8002bc:	84aa                	mv	s1,a0
  8002be:	89ae                	mv	s3,a1
  8002c0:	8932                	mv	s2,a2
  8002c2:	fff7841b          	addiw	s0,a5,-1
  8002c6:	2a81                	sext.w	s5,s5
  8002c8:	0516f163          	bgeu	a3,a7,80030a <printnum+0x6a>
  8002cc:	8a42                	mv	s4,a6
  8002ce:	00805863          	blez	s0,8002de <printnum+0x3e>
  8002d2:	347d                	addiw	s0,s0,-1
  8002d4:	864e                	mv	a2,s3
  8002d6:	85ca                	mv	a1,s2
  8002d8:	8552                	mv	a0,s4
  8002da:	9482                	jalr	s1
  8002dc:	f87d                	bnez	s0,8002d2 <printnum+0x32>
  8002de:	1a82                	slli	s5,s5,0x20
  8002e0:	020ada93          	srli	s5,s5,0x20
  8002e4:	00000797          	auipc	a5,0x0
  8002e8:	5c478793          	addi	a5,a5,1476 # 8008a8 <main+0x16c>
  8002ec:	7442                	ld	s0,48(sp)
  8002ee:	9abe                	add	s5,s5,a5
  8002f0:	000ac503          	lbu	a0,0(s5)
  8002f4:	70e2                	ld	ra,56(sp)
  8002f6:	6a42                	ld	s4,16(sp)
  8002f8:	6aa2                	ld	s5,8(sp)
  8002fa:	864e                	mv	a2,s3
  8002fc:	85ca                	mv	a1,s2
  8002fe:	69e2                	ld	s3,24(sp)
  800300:	7902                	ld	s2,32(sp)
  800302:	8326                	mv	t1,s1
  800304:	74a2                	ld	s1,40(sp)
  800306:	6121                	addi	sp,sp,64
  800308:	8302                	jr	t1
  80030a:	0316d6b3          	divu	a3,a3,a7
  80030e:	87a2                	mv	a5,s0
  800310:	f91ff0ef          	jal	ra,8002a0 <printnum>
  800314:	b7e9                	j	8002de <printnum+0x3e>

0000000000800316 <vprintfmt>:
  800316:	7119                	addi	sp,sp,-128
  800318:	f4a6                	sd	s1,104(sp)
  80031a:	f0ca                	sd	s2,96(sp)
  80031c:	ecce                	sd	s3,88(sp)
  80031e:	e8d2                	sd	s4,80(sp)
  800320:	e4d6                	sd	s5,72(sp)
  800322:	e0da                	sd	s6,64(sp)
  800324:	fc5e                	sd	s7,56(sp)
  800326:	ec6e                	sd	s11,24(sp)
  800328:	fc86                	sd	ra,120(sp)
  80032a:	f8a2                	sd	s0,112(sp)
  80032c:	f862                	sd	s8,48(sp)
  80032e:	f466                	sd	s9,40(sp)
  800330:	f06a                	sd	s10,32(sp)
  800332:	89aa                	mv	s3,a0
  800334:	892e                	mv	s2,a1
  800336:	84b2                	mv	s1,a2
  800338:	8db6                	mv	s11,a3
  80033a:	8aba                	mv	s5,a4
  80033c:	02500a13          	li	s4,37
  800340:	5bfd                	li	s7,-1
  800342:	00000b17          	auipc	s6,0x0
  800346:	59ab0b13          	addi	s6,s6,1434 # 8008dc <main+0x1a0>
  80034a:	000dc503          	lbu	a0,0(s11)
  80034e:	001d8413          	addi	s0,s11,1
  800352:	01450b63          	beq	a0,s4,800368 <vprintfmt+0x52>
  800356:	c129                	beqz	a0,800398 <vprintfmt+0x82>
  800358:	864a                	mv	a2,s2
  80035a:	85a6                	mv	a1,s1
  80035c:	0405                	addi	s0,s0,1
  80035e:	9982                	jalr	s3
  800360:	fff44503          	lbu	a0,-1(s0)
  800364:	ff4519e3          	bne	a0,s4,800356 <vprintfmt+0x40>
  800368:	00044583          	lbu	a1,0(s0)
  80036c:	02000813          	li	a6,32
  800370:	4d01                	li	s10,0
  800372:	4301                	li	t1,0
  800374:	5cfd                	li	s9,-1
  800376:	5c7d                	li	s8,-1
  800378:	05500513          	li	a0,85
  80037c:	48a5                	li	a7,9
  80037e:	fdd5861b          	addiw	a2,a1,-35
  800382:	0ff67613          	andi	a2,a2,255
  800386:	00140d93          	addi	s11,s0,1
  80038a:	04c56263          	bltu	a0,a2,8003ce <vprintfmt+0xb8>
  80038e:	060a                	slli	a2,a2,0x2
  800390:	965a                	add	a2,a2,s6
  800392:	4214                	lw	a3,0(a2)
  800394:	96da                	add	a3,a3,s6
  800396:	8682                	jr	a3
  800398:	70e6                	ld	ra,120(sp)
  80039a:	7446                	ld	s0,112(sp)
  80039c:	74a6                	ld	s1,104(sp)
  80039e:	7906                	ld	s2,96(sp)
  8003a0:	69e6                	ld	s3,88(sp)
  8003a2:	6a46                	ld	s4,80(sp)
  8003a4:	6aa6                	ld	s5,72(sp)
  8003a6:	6b06                	ld	s6,64(sp)
  8003a8:	7be2                	ld	s7,56(sp)
  8003aa:	7c42                	ld	s8,48(sp)
  8003ac:	7ca2                	ld	s9,40(sp)
  8003ae:	7d02                	ld	s10,32(sp)
  8003b0:	6de2                	ld	s11,24(sp)
  8003b2:	6109                	addi	sp,sp,128
  8003b4:	8082                	ret
  8003b6:	882e                	mv	a6,a1
  8003b8:	00144583          	lbu	a1,1(s0)
  8003bc:	846e                	mv	s0,s11
  8003be:	00140d93          	addi	s11,s0,1
  8003c2:	fdd5861b          	addiw	a2,a1,-35
  8003c6:	0ff67613          	andi	a2,a2,255
  8003ca:	fcc572e3          	bgeu	a0,a2,80038e <vprintfmt+0x78>
  8003ce:	864a                	mv	a2,s2
  8003d0:	85a6                	mv	a1,s1
  8003d2:	02500513          	li	a0,37
  8003d6:	9982                	jalr	s3
  8003d8:	fff44783          	lbu	a5,-1(s0)
  8003dc:	8da2                	mv	s11,s0
  8003de:	f74786e3          	beq	a5,s4,80034a <vprintfmt+0x34>
  8003e2:	ffedc783          	lbu	a5,-2(s11)
  8003e6:	1dfd                	addi	s11,s11,-1
  8003e8:	ff479de3          	bne	a5,s4,8003e2 <vprintfmt+0xcc>
  8003ec:	bfb9                	j	80034a <vprintfmt+0x34>
  8003ee:	fd058c9b          	addiw	s9,a1,-48
  8003f2:	00144583          	lbu	a1,1(s0)
  8003f6:	846e                	mv	s0,s11
  8003f8:	fd05869b          	addiw	a3,a1,-48
  8003fc:	0005861b          	sext.w	a2,a1
  800400:	02d8e463          	bltu	a7,a3,800428 <vprintfmt+0x112>
  800404:	00144583          	lbu	a1,1(s0)
  800408:	002c969b          	slliw	a3,s9,0x2
  80040c:	0196873b          	addw	a4,a3,s9
  800410:	0017171b          	slliw	a4,a4,0x1
  800414:	9f31                	addw	a4,a4,a2
  800416:	fd05869b          	addiw	a3,a1,-48
  80041a:	0405                	addi	s0,s0,1
  80041c:	fd070c9b          	addiw	s9,a4,-48
  800420:	0005861b          	sext.w	a2,a1
  800424:	fed8f0e3          	bgeu	a7,a3,800404 <vprintfmt+0xee>
  800428:	f40c5be3          	bgez	s8,80037e <vprintfmt+0x68>
  80042c:	8c66                	mv	s8,s9
  80042e:	5cfd                	li	s9,-1
  800430:	b7b9                	j	80037e <vprintfmt+0x68>
  800432:	fffc4693          	not	a3,s8
  800436:	96fd                	srai	a3,a3,0x3f
  800438:	00dc77b3          	and	a5,s8,a3
  80043c:	00144583          	lbu	a1,1(s0)
  800440:	00078c1b          	sext.w	s8,a5
  800444:	846e                	mv	s0,s11
  800446:	bf25                	j	80037e <vprintfmt+0x68>
  800448:	000aac83          	lw	s9,0(s5)
  80044c:	00144583          	lbu	a1,1(s0)
  800450:	0aa1                	addi	s5,s5,8
  800452:	846e                	mv	s0,s11
  800454:	bfd1                	j	800428 <vprintfmt+0x112>
  800456:	4705                	li	a4,1
  800458:	008a8613          	addi	a2,s5,8
  80045c:	00674463          	blt	a4,t1,800464 <vprintfmt+0x14e>
  800460:	1c030c63          	beqz	t1,800638 <vprintfmt+0x322>
  800464:	000ab683          	ld	a3,0(s5)
  800468:	4741                	li	a4,16
  80046a:	8ab2                	mv	s5,a2
  80046c:	2801                	sext.w	a6,a6
  80046e:	87e2                	mv	a5,s8
  800470:	8626                	mv	a2,s1
  800472:	85ca                	mv	a1,s2
  800474:	854e                	mv	a0,s3
  800476:	e2bff0ef          	jal	ra,8002a0 <printnum>
  80047a:	bdc1                	j	80034a <vprintfmt+0x34>
  80047c:	000aa503          	lw	a0,0(s5)
  800480:	864a                	mv	a2,s2
  800482:	85a6                	mv	a1,s1
  800484:	0aa1                	addi	s5,s5,8
  800486:	9982                	jalr	s3
  800488:	b5c9                	j	80034a <vprintfmt+0x34>
  80048a:	4705                	li	a4,1
  80048c:	008a8613          	addi	a2,s5,8
  800490:	00674463          	blt	a4,t1,800498 <vprintfmt+0x182>
  800494:	18030d63          	beqz	t1,80062e <vprintfmt+0x318>
  800498:	000ab683          	ld	a3,0(s5)
  80049c:	4729                	li	a4,10
  80049e:	8ab2                	mv	s5,a2
  8004a0:	b7f1                	j	80046c <vprintfmt+0x156>
  8004a2:	00144583          	lbu	a1,1(s0)
  8004a6:	4d05                	li	s10,1
  8004a8:	846e                	mv	s0,s11
  8004aa:	bdd1                	j	80037e <vprintfmt+0x68>
  8004ac:	864a                	mv	a2,s2
  8004ae:	85a6                	mv	a1,s1
  8004b0:	02500513          	li	a0,37
  8004b4:	9982                	jalr	s3
  8004b6:	bd51                	j	80034a <vprintfmt+0x34>
  8004b8:	00144583          	lbu	a1,1(s0)
  8004bc:	2305                	addiw	t1,t1,1
  8004be:	846e                	mv	s0,s11
  8004c0:	bd7d                	j	80037e <vprintfmt+0x68>
  8004c2:	4705                	li	a4,1
  8004c4:	008a8613          	addi	a2,s5,8
  8004c8:	00674463          	blt	a4,t1,8004d0 <vprintfmt+0x1ba>
  8004cc:	14030c63          	beqz	t1,800624 <vprintfmt+0x30e>
  8004d0:	000ab683          	ld	a3,0(s5)
  8004d4:	4721                	li	a4,8
  8004d6:	8ab2                	mv	s5,a2
  8004d8:	bf51                	j	80046c <vprintfmt+0x156>
  8004da:	03000513          	li	a0,48
  8004de:	864a                	mv	a2,s2
  8004e0:	85a6                	mv	a1,s1
  8004e2:	e042                	sd	a6,0(sp)
  8004e4:	9982                	jalr	s3
  8004e6:	864a                	mv	a2,s2
  8004e8:	85a6                	mv	a1,s1
  8004ea:	07800513          	li	a0,120
  8004ee:	9982                	jalr	s3
  8004f0:	0aa1                	addi	s5,s5,8
  8004f2:	6802                	ld	a6,0(sp)
  8004f4:	4741                	li	a4,16
  8004f6:	ff8ab683          	ld	a3,-8(s5)
  8004fa:	bf8d                	j	80046c <vprintfmt+0x156>
  8004fc:	000ab403          	ld	s0,0(s5)
  800500:	008a8793          	addi	a5,s5,8
  800504:	e03e                	sd	a5,0(sp)
  800506:	14040c63          	beqz	s0,80065e <vprintfmt+0x348>
  80050a:	11805063          	blez	s8,80060a <vprintfmt+0x2f4>
  80050e:	02d00693          	li	a3,45
  800512:	0cd81963          	bne	a6,a3,8005e4 <vprintfmt+0x2ce>
  800516:	00044683          	lbu	a3,0(s0)
  80051a:	0006851b          	sext.w	a0,a3
  80051e:	ce8d                	beqz	a3,800558 <vprintfmt+0x242>
  800520:	00140a93          	addi	s5,s0,1
  800524:	05e00413          	li	s0,94
  800528:	000cc563          	bltz	s9,800532 <vprintfmt+0x21c>
  80052c:	3cfd                	addiw	s9,s9,-1
  80052e:	037c8363          	beq	s9,s7,800554 <vprintfmt+0x23e>
  800532:	864a                	mv	a2,s2
  800534:	85a6                	mv	a1,s1
  800536:	100d0663          	beqz	s10,800642 <vprintfmt+0x32c>
  80053a:	3681                	addiw	a3,a3,-32
  80053c:	10d47363          	bgeu	s0,a3,800642 <vprintfmt+0x32c>
  800540:	03f00513          	li	a0,63
  800544:	9982                	jalr	s3
  800546:	000ac683          	lbu	a3,0(s5)
  80054a:	3c7d                	addiw	s8,s8,-1
  80054c:	0a85                	addi	s5,s5,1
  80054e:	0006851b          	sext.w	a0,a3
  800552:	faf9                	bnez	a3,800528 <vprintfmt+0x212>
  800554:	01805a63          	blez	s8,800568 <vprintfmt+0x252>
  800558:	3c7d                	addiw	s8,s8,-1
  80055a:	864a                	mv	a2,s2
  80055c:	85a6                	mv	a1,s1
  80055e:	02000513          	li	a0,32
  800562:	9982                	jalr	s3
  800564:	fe0c1ae3          	bnez	s8,800558 <vprintfmt+0x242>
  800568:	6a82                	ld	s5,0(sp)
  80056a:	b3c5                	j	80034a <vprintfmt+0x34>
  80056c:	4705                	li	a4,1
  80056e:	008a8d13          	addi	s10,s5,8
  800572:	00674463          	blt	a4,t1,80057a <vprintfmt+0x264>
  800576:	0a030463          	beqz	t1,80061e <vprintfmt+0x308>
  80057a:	000ab403          	ld	s0,0(s5)
  80057e:	0c044463          	bltz	s0,800646 <vprintfmt+0x330>
  800582:	86a2                	mv	a3,s0
  800584:	8aea                	mv	s5,s10
  800586:	4729                	li	a4,10
  800588:	b5d5                	j	80046c <vprintfmt+0x156>
  80058a:	000aa783          	lw	a5,0(s5)
  80058e:	46e1                	li	a3,24
  800590:	0aa1                	addi	s5,s5,8
  800592:	41f7d71b          	sraiw	a4,a5,0x1f
  800596:	8fb9                	xor	a5,a5,a4
  800598:	40e7873b          	subw	a4,a5,a4
  80059c:	02e6c663          	blt	a3,a4,8005c8 <vprintfmt+0x2b2>
  8005a0:	00371793          	slli	a5,a4,0x3
  8005a4:	00000697          	auipc	a3,0x0
  8005a8:	66c68693          	addi	a3,a3,1644 # 800c10 <error_string>
  8005ac:	97b6                	add	a5,a5,a3
  8005ae:	639c                	ld	a5,0(a5)
  8005b0:	cf81                	beqz	a5,8005c8 <vprintfmt+0x2b2>
  8005b2:	873e                	mv	a4,a5
  8005b4:	00000697          	auipc	a3,0x0
  8005b8:	32468693          	addi	a3,a3,804 # 8008d8 <main+0x19c>
  8005bc:	8626                	mv	a2,s1
  8005be:	85ca                	mv	a1,s2
  8005c0:	854e                	mv	a0,s3
  8005c2:	0d4000ef          	jal	ra,800696 <printfmt>
  8005c6:	b351                	j	80034a <vprintfmt+0x34>
  8005c8:	00000697          	auipc	a3,0x0
  8005cc:	30068693          	addi	a3,a3,768 # 8008c8 <main+0x18c>
  8005d0:	8626                	mv	a2,s1
  8005d2:	85ca                	mv	a1,s2
  8005d4:	854e                	mv	a0,s3
  8005d6:	0c0000ef          	jal	ra,800696 <printfmt>
  8005da:	bb85                	j	80034a <vprintfmt+0x34>
  8005dc:	00000417          	auipc	s0,0x0
  8005e0:	2e440413          	addi	s0,s0,740 # 8008c0 <main+0x184>
  8005e4:	85e6                	mv	a1,s9
  8005e6:	8522                	mv	a0,s0
  8005e8:	e442                	sd	a6,8(sp)
  8005ea:	c9bff0ef          	jal	ra,800284 <strnlen>
  8005ee:	40ac0c3b          	subw	s8,s8,a0
  8005f2:	01805c63          	blez	s8,80060a <vprintfmt+0x2f4>
  8005f6:	6822                	ld	a6,8(sp)
  8005f8:	00080a9b          	sext.w	s5,a6
  8005fc:	3c7d                	addiw	s8,s8,-1
  8005fe:	864a                	mv	a2,s2
  800600:	85a6                	mv	a1,s1
  800602:	8556                	mv	a0,s5
  800604:	9982                	jalr	s3
  800606:	fe0c1be3          	bnez	s8,8005fc <vprintfmt+0x2e6>
  80060a:	00044683          	lbu	a3,0(s0)
  80060e:	00140a93          	addi	s5,s0,1
  800612:	0006851b          	sext.w	a0,a3
  800616:	daa9                	beqz	a3,800568 <vprintfmt+0x252>
  800618:	05e00413          	li	s0,94
  80061c:	b731                	j	800528 <vprintfmt+0x212>
  80061e:	000aa403          	lw	s0,0(s5)
  800622:	bfb1                	j	80057e <vprintfmt+0x268>
  800624:	000ae683          	lwu	a3,0(s5)
  800628:	4721                	li	a4,8
  80062a:	8ab2                	mv	s5,a2
  80062c:	b581                	j	80046c <vprintfmt+0x156>
  80062e:	000ae683          	lwu	a3,0(s5)
  800632:	4729                	li	a4,10
  800634:	8ab2                	mv	s5,a2
  800636:	bd1d                	j	80046c <vprintfmt+0x156>
  800638:	000ae683          	lwu	a3,0(s5)
  80063c:	4741                	li	a4,16
  80063e:	8ab2                	mv	s5,a2
  800640:	b535                	j	80046c <vprintfmt+0x156>
  800642:	9982                	jalr	s3
  800644:	b709                	j	800546 <vprintfmt+0x230>
  800646:	864a                	mv	a2,s2
  800648:	85a6                	mv	a1,s1
  80064a:	02d00513          	li	a0,45
  80064e:	e042                	sd	a6,0(sp)
  800650:	9982                	jalr	s3
  800652:	6802                	ld	a6,0(sp)
  800654:	8aea                	mv	s5,s10
  800656:	408006b3          	neg	a3,s0
  80065a:	4729                	li	a4,10
  80065c:	bd01                	j	80046c <vprintfmt+0x156>
  80065e:	03805163          	blez	s8,800680 <vprintfmt+0x36a>
  800662:	02d00693          	li	a3,45
  800666:	f6d81be3          	bne	a6,a3,8005dc <vprintfmt+0x2c6>
  80066a:	00000417          	auipc	s0,0x0
  80066e:	25640413          	addi	s0,s0,598 # 8008c0 <main+0x184>
  800672:	02800693          	li	a3,40
  800676:	02800513          	li	a0,40
  80067a:	00140a93          	addi	s5,s0,1
  80067e:	b55d                	j	800524 <vprintfmt+0x20e>
  800680:	00000a97          	auipc	s5,0x0
  800684:	241a8a93          	addi	s5,s5,577 # 8008c1 <main+0x185>
  800688:	02800513          	li	a0,40
  80068c:	02800693          	li	a3,40
  800690:	05e00413          	li	s0,94
  800694:	bd51                	j	800528 <vprintfmt+0x212>

0000000000800696 <printfmt>:
  800696:	7139                	addi	sp,sp,-64
  800698:	02010313          	addi	t1,sp,32
  80069c:	f03a                	sd	a4,32(sp)
  80069e:	871a                	mv	a4,t1
  8006a0:	ec06                	sd	ra,24(sp)
  8006a2:	f43e                	sd	a5,40(sp)
  8006a4:	f842                	sd	a6,48(sp)
  8006a6:	fc46                	sd	a7,56(sp)
  8006a8:	e41a                	sd	t1,8(sp)
  8006aa:	c6dff0ef          	jal	ra,800316 <vprintfmt>
  8006ae:	60e2                	ld	ra,24(sp)
  8006b0:	6121                	addi	sp,sp,64
  8006b2:	8082                	ret

00000000008006b4 <do_yield>:
  8006b4:	1141                	addi	sp,sp,-16
  8006b6:	e406                	sd	ra,8(sp)
  8006b8:	a83ff0ef          	jal	ra,80013a <yield>
  8006bc:	a7fff0ef          	jal	ra,80013a <yield>
  8006c0:	a7bff0ef          	jal	ra,80013a <yield>
  8006c4:	a77ff0ef          	jal	ra,80013a <yield>
  8006c8:	a73ff0ef          	jal	ra,80013a <yield>
  8006cc:	60a2                	ld	ra,8(sp)
  8006ce:	0141                	addi	sp,sp,16
  8006d0:	b4ad                	j	80013a <yield>

00000000008006d2 <loop>:
  8006d2:	1141                	addi	sp,sp,-16
  8006d4:	00000517          	auipc	a0,0x0
  8006d8:	60450513          	addi	a0,a0,1540 # 800cd8 <error_string+0xc8>
  8006dc:	e406                	sd	ra,8(sp)
  8006de:	ab3ff0ef          	jal	ra,800190 <cprintf>
  8006e2:	a001                	j	8006e2 <loop+0x10>

00000000008006e4 <work>:
  8006e4:	1141                	addi	sp,sp,-16
  8006e6:	00000517          	auipc	a0,0x0
  8006ea:	60250513          	addi	a0,a0,1538 # 800ce8 <error_string+0xd8>
  8006ee:	e406                	sd	ra,8(sp)
  8006f0:	aa1ff0ef          	jal	ra,800190 <cprintf>
  8006f4:	fc1ff0ef          	jal	ra,8006b4 <do_yield>
  8006f8:	00001517          	auipc	a0,0x1
  8006fc:	90852503          	lw	a0,-1784(a0) # 801000 <parent>
  800700:	a3dff0ef          	jal	ra,80013c <kill>
  800704:	e105                	bnez	a0,800724 <work+0x40>
  800706:	00000517          	auipc	a0,0x0
  80070a:	5f250513          	addi	a0,a0,1522 # 800cf8 <error_string+0xe8>
  80070e:	a83ff0ef          	jal	ra,800190 <cprintf>
  800712:	fa3ff0ef          	jal	ra,8006b4 <do_yield>
  800716:	00001517          	auipc	a0,0x1
  80071a:	8f252503          	lw	a0,-1806(a0) # 801008 <pid1>
  80071e:	a1fff0ef          	jal	ra,80013c <kill>
  800722:	c501                	beqz	a0,80072a <work+0x46>
  800724:	557d                	li	a0,-1
  800726:	9fbff0ef          	jal	ra,800120 <exit>
  80072a:	00000517          	auipc	a0,0x0
  80072e:	5e650513          	addi	a0,a0,1510 # 800d10 <error_string+0x100>
  800732:	a5fff0ef          	jal	ra,800190 <cprintf>
  800736:	4501                	li	a0,0
  800738:	9e9ff0ef          	jal	ra,800120 <exit>

000000000080073c <main>:
  80073c:	1141                	addi	sp,sp,-16
  80073e:	e406                	sd	ra,8(sp)
  800740:	e022                	sd	s0,0(sp)
  800742:	9fdff0ef          	jal	ra,80013e <getpid>
  800746:	00001797          	auipc	a5,0x1
  80074a:	8aa7ad23          	sw	a0,-1862(a5) # 801000 <parent>
  80074e:	00001417          	auipc	s0,0x1
  800752:	8ba40413          	addi	s0,s0,-1862 # 801008 <pid1>
  800756:	9e1ff0ef          	jal	ra,800136 <fork>
  80075a:	c008                	sw	a0,0(s0)
  80075c:	c13d                	beqz	a0,8007c2 <main+0x86>
  80075e:	04a05263          	blez	a0,8007a2 <main+0x66>
  800762:	9d5ff0ef          	jal	ra,800136 <fork>
  800766:	00001797          	auipc	a5,0x1
  80076a:	88a7af23          	sw	a0,-1890(a5) # 801004 <pid2>
  80076e:	c93d                	beqz	a0,8007e4 <main+0xa8>
  800770:	04a05b63          	blez	a0,8007c6 <main+0x8a>
  800774:	00000517          	auipc	a0,0x0
  800778:	5ec50513          	addi	a0,a0,1516 # 800d60 <error_string+0x150>
  80077c:	a15ff0ef          	jal	ra,800190 <cprintf>
  800780:	4008                	lw	a0,0(s0)
  800782:	4581                	li	a1,0
  800784:	9b5ff0ef          	jal	ra,800138 <waitpid>
  800788:	4014                	lw	a3,0(s0)
  80078a:	00000617          	auipc	a2,0x0
  80078e:	5e660613          	addi	a2,a2,1510 # 800d70 <error_string+0x160>
  800792:	03400593          	li	a1,52
  800796:	00000517          	auipc	a0,0x0
  80079a:	5ba50513          	addi	a0,a0,1466 # 800d50 <error_string+0x140>
  80079e:	883ff0ef          	jal	ra,800020 <__panic>
  8007a2:	00000697          	auipc	a3,0x0
  8007a6:	58668693          	addi	a3,a3,1414 # 800d28 <error_string+0x118>
  8007aa:	00000617          	auipc	a2,0x0
  8007ae:	58e60613          	addi	a2,a2,1422 # 800d38 <error_string+0x128>
  8007b2:	02c00593          	li	a1,44
  8007b6:	00000517          	auipc	a0,0x0
  8007ba:	59a50513          	addi	a0,a0,1434 # 800d50 <error_string+0x140>
  8007be:	863ff0ef          	jal	ra,800020 <__panic>
  8007c2:	f11ff0ef          	jal	ra,8006d2 <loop>
  8007c6:	4008                	lw	a0,0(s0)
  8007c8:	975ff0ef          	jal	ra,80013c <kill>
  8007cc:	00000617          	auipc	a2,0x0
  8007d0:	5bc60613          	addi	a2,a2,1468 # 800d88 <error_string+0x178>
  8007d4:	03900593          	li	a1,57
  8007d8:	00000517          	auipc	a0,0x0
  8007dc:	57850513          	addi	a0,a0,1400 # 800d50 <error_string+0x140>
  8007e0:	841ff0ef          	jal	ra,800020 <__panic>
  8007e4:	f01ff0ef          	jal	ra,8006e4 <work>
