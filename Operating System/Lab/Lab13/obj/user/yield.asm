
obj/__user_yield.out:     file format elf64-littleriscv


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
  800034:	6b850513          	addi	a0,a0,1720 # 8006e8 <main+0x8e>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	0f2000ef          	jal	ra,800136 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	0c4000ef          	jal	ra,800110 <vcprintf>
  800050:	00000517          	auipc	a0,0x0
  800054:	6f050513          	addi	a0,a0,1776 # 800740 <main+0xe6>
  800058:	0de000ef          	jal	ra,800136 <cprintf>
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

00000000008000a2 <sys_yield>:
  8000a2:	4529                	li	a0,10
  8000a4:	b7c1                	j	800064 <syscall>

00000000008000a6 <sys_getpid>:
  8000a6:	4549                	li	a0,18
  8000a8:	bf75                	j	800064 <syscall>

00000000008000aa <sys_putc>:
  8000aa:	85aa                	mv	a1,a0
  8000ac:	4579                	li	a0,30
  8000ae:	bf5d                	j	800064 <syscall>

00000000008000b0 <sys_open>:
  8000b0:	862e                	mv	a2,a1
  8000b2:	85aa                	mv	a1,a0
  8000b4:	06400513          	li	a0,100
  8000b8:	b775                	j	800064 <syscall>

00000000008000ba <sys_close>:
  8000ba:	85aa                	mv	a1,a0
  8000bc:	06500513          	li	a0,101
  8000c0:	b755                	j	800064 <syscall>

00000000008000c2 <sys_dup>:
  8000c2:	862e                	mv	a2,a1
  8000c4:	85aa                	mv	a1,a0
  8000c6:	08200513          	li	a0,130
  8000ca:	bf69                	j	800064 <syscall>

00000000008000cc <exit>:
  8000cc:	1141                	addi	sp,sp,-16
  8000ce:	e406                	sd	ra,8(sp)
  8000d0:	fcdff0ef          	jal	ra,80009c <sys_exit>
  8000d4:	00000517          	auipc	a0,0x0
  8000d8:	63450513          	addi	a0,a0,1588 # 800708 <main+0xae>
  8000dc:	05a000ef          	jal	ra,800136 <cprintf>
  8000e0:	a001                	j	8000e0 <exit+0x14>

00000000008000e2 <yield>:
  8000e2:	b7c1                	j	8000a2 <sys_yield>

00000000008000e4 <getpid>:
  8000e4:	b7c9                	j	8000a6 <sys_getpid>

00000000008000e6 <_start>:
  8000e6:	0d0000ef          	jal	ra,8001b6 <umain>
  8000ea:	a001                	j	8000ea <_start+0x4>

00000000008000ec <open>:
  8000ec:	1582                	slli	a1,a1,0x20
  8000ee:	9181                	srli	a1,a1,0x20
  8000f0:	b7c1                	j	8000b0 <sys_open>

00000000008000f2 <close>:
  8000f2:	b7e1                	j	8000ba <sys_close>

00000000008000f4 <dup2>:
  8000f4:	b7f9                	j	8000c2 <sys_dup>

00000000008000f6 <cputch>:
  8000f6:	1141                	addi	sp,sp,-16
  8000f8:	e022                	sd	s0,0(sp)
  8000fa:	e406                	sd	ra,8(sp)
  8000fc:	842e                	mv	s0,a1
  8000fe:	fadff0ef          	jal	ra,8000aa <sys_putc>
  800102:	401c                	lw	a5,0(s0)
  800104:	60a2                	ld	ra,8(sp)
  800106:	2785                	addiw	a5,a5,1
  800108:	c01c                	sw	a5,0(s0)
  80010a:	6402                	ld	s0,0(sp)
  80010c:	0141                	addi	sp,sp,16
  80010e:	8082                	ret

0000000000800110 <vcprintf>:
  800110:	1101                	addi	sp,sp,-32
  800112:	872e                	mv	a4,a1
  800114:	75dd                	lui	a1,0xffff7
  800116:	86aa                	mv	a3,a0
  800118:	0070                	addi	a2,sp,12
  80011a:	00000517          	auipc	a0,0x0
  80011e:	fdc50513          	addi	a0,a0,-36 # 8000f6 <cputch>
  800122:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5fe9>
  800126:	ec06                	sd	ra,24(sp)
  800128:	c602                	sw	zero,12(sp)
  80012a:	192000ef          	jal	ra,8002bc <vprintfmt>
  80012e:	60e2                	ld	ra,24(sp)
  800130:	4532                	lw	a0,12(sp)
  800132:	6105                	addi	sp,sp,32
  800134:	8082                	ret

0000000000800136 <cprintf>:
  800136:	711d                	addi	sp,sp,-96
  800138:	02810313          	addi	t1,sp,40
  80013c:	8e2a                	mv	t3,a0
  80013e:	f42e                	sd	a1,40(sp)
  800140:	75dd                	lui	a1,0xffff7
  800142:	f832                	sd	a2,48(sp)
  800144:	fc36                	sd	a3,56(sp)
  800146:	e0ba                	sd	a4,64(sp)
  800148:	00000517          	auipc	a0,0x0
  80014c:	fae50513          	addi	a0,a0,-82 # 8000f6 <cputch>
  800150:	0050                	addi	a2,sp,4
  800152:	871a                	mv	a4,t1
  800154:	86f2                	mv	a3,t3
  800156:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <error_string+0xffffffffff7f5fe9>
  80015a:	ec06                	sd	ra,24(sp)
  80015c:	e4be                	sd	a5,72(sp)
  80015e:	e8c2                	sd	a6,80(sp)
  800160:	ecc6                	sd	a7,88(sp)
  800162:	e41a                	sd	t1,8(sp)
  800164:	c202                	sw	zero,4(sp)
  800166:	156000ef          	jal	ra,8002bc <vprintfmt>
  80016a:	60e2                	ld	ra,24(sp)
  80016c:	4512                	lw	a0,4(sp)
  80016e:	6125                	addi	sp,sp,96
  800170:	8082                	ret

0000000000800172 <initfd>:
  800172:	1101                	addi	sp,sp,-32
  800174:	87ae                	mv	a5,a1
  800176:	e426                	sd	s1,8(sp)
  800178:	85b2                	mv	a1,a2
  80017a:	84aa                	mv	s1,a0
  80017c:	853e                	mv	a0,a5
  80017e:	e822                	sd	s0,16(sp)
  800180:	ec06                	sd	ra,24(sp)
  800182:	f6bff0ef          	jal	ra,8000ec <open>
  800186:	842a                	mv	s0,a0
  800188:	00054463          	bltz	a0,800190 <initfd+0x1e>
  80018c:	00951863          	bne	a0,s1,80019c <initfd+0x2a>
  800190:	60e2                	ld	ra,24(sp)
  800192:	8522                	mv	a0,s0
  800194:	6442                	ld	s0,16(sp)
  800196:	64a2                	ld	s1,8(sp)
  800198:	6105                	addi	sp,sp,32
  80019a:	8082                	ret
  80019c:	8526                	mv	a0,s1
  80019e:	f55ff0ef          	jal	ra,8000f2 <close>
  8001a2:	85a6                	mv	a1,s1
  8001a4:	8522                	mv	a0,s0
  8001a6:	f4fff0ef          	jal	ra,8000f4 <dup2>
  8001aa:	84aa                	mv	s1,a0
  8001ac:	8522                	mv	a0,s0
  8001ae:	f45ff0ef          	jal	ra,8000f2 <close>
  8001b2:	8426                	mv	s0,s1
  8001b4:	bff1                	j	800190 <initfd+0x1e>

00000000008001b6 <umain>:
  8001b6:	1101                	addi	sp,sp,-32
  8001b8:	e822                	sd	s0,16(sp)
  8001ba:	e426                	sd	s1,8(sp)
  8001bc:	842a                	mv	s0,a0
  8001be:	84ae                	mv	s1,a1
  8001c0:	4601                	li	a2,0
  8001c2:	00000597          	auipc	a1,0x0
  8001c6:	55e58593          	addi	a1,a1,1374 # 800720 <main+0xc6>
  8001ca:	4501                	li	a0,0
  8001cc:	ec06                	sd	ra,24(sp)
  8001ce:	fa5ff0ef          	jal	ra,800172 <initfd>
  8001d2:	02054263          	bltz	a0,8001f6 <umain+0x40>
  8001d6:	4605                	li	a2,1
  8001d8:	00000597          	auipc	a1,0x0
  8001dc:	58858593          	addi	a1,a1,1416 # 800760 <main+0x106>
  8001e0:	4505                	li	a0,1
  8001e2:	f91ff0ef          	jal	ra,800172 <initfd>
  8001e6:	02054563          	bltz	a0,800210 <umain+0x5a>
  8001ea:	85a6                	mv	a1,s1
  8001ec:	8522                	mv	a0,s0
  8001ee:	46c000ef          	jal	ra,80065a <main>
  8001f2:	edbff0ef          	jal	ra,8000cc <exit>
  8001f6:	86aa                	mv	a3,a0
  8001f8:	00000617          	auipc	a2,0x0
  8001fc:	53060613          	addi	a2,a2,1328 # 800728 <main+0xce>
  800200:	45e9                	li	a1,26
  800202:	00000517          	auipc	a0,0x0
  800206:	54650513          	addi	a0,a0,1350 # 800748 <main+0xee>
  80020a:	e17ff0ef          	jal	ra,800020 <__warn>
  80020e:	b7e1                	j	8001d6 <umain+0x20>
  800210:	86aa                	mv	a3,a0
  800212:	00000617          	auipc	a2,0x0
  800216:	55660613          	addi	a2,a2,1366 # 800768 <main+0x10e>
  80021a:	45f5                	li	a1,29
  80021c:	00000517          	auipc	a0,0x0
  800220:	52c50513          	addi	a0,a0,1324 # 800748 <main+0xee>
  800224:	dfdff0ef          	jal	ra,800020 <__warn>
  800228:	b7c9                	j	8001ea <umain+0x34>

000000000080022a <strnlen>:
  80022a:	872a                	mv	a4,a0
  80022c:	4501                	li	a0,0
  80022e:	e589                	bnez	a1,800238 <strnlen+0xe>
  800230:	a811                	j	800244 <strnlen+0x1a>
  800232:	0505                	addi	a0,a0,1
  800234:	00a58763          	beq	a1,a0,800242 <strnlen+0x18>
  800238:	00a707b3          	add	a5,a4,a0
  80023c:	0007c783          	lbu	a5,0(a5)
  800240:	fbed                	bnez	a5,800232 <strnlen+0x8>
  800242:	8082                	ret
  800244:	8082                	ret

0000000000800246 <printnum>:
  800246:	02071893          	slli	a7,a4,0x20
  80024a:	7139                	addi	sp,sp,-64
  80024c:	0208d893          	srli	a7,a7,0x20
  800250:	e456                	sd	s5,8(sp)
  800252:	0316fab3          	remu	s5,a3,a7
  800256:	f822                	sd	s0,48(sp)
  800258:	f426                	sd	s1,40(sp)
  80025a:	f04a                	sd	s2,32(sp)
  80025c:	ec4e                	sd	s3,24(sp)
  80025e:	fc06                	sd	ra,56(sp)
  800260:	e852                	sd	s4,16(sp)
  800262:	84aa                	mv	s1,a0
  800264:	89ae                	mv	s3,a1
  800266:	8932                	mv	s2,a2
  800268:	fff7841b          	addiw	s0,a5,-1
  80026c:	2a81                	sext.w	s5,s5
  80026e:	0516f163          	bgeu	a3,a7,8002b0 <printnum+0x6a>
  800272:	8a42                	mv	s4,a6
  800274:	00805863          	blez	s0,800284 <printnum+0x3e>
  800278:	347d                	addiw	s0,s0,-1
  80027a:	864e                	mv	a2,s3
  80027c:	85ca                	mv	a1,s2
  80027e:	8552                	mv	a0,s4
  800280:	9482                	jalr	s1
  800282:	f87d                	bnez	s0,800278 <printnum+0x32>
  800284:	1a82                	slli	s5,s5,0x20
  800286:	020ada93          	srli	s5,s5,0x20
  80028a:	00000797          	auipc	a5,0x0
  80028e:	4fe78793          	addi	a5,a5,1278 # 800788 <main+0x12e>
  800292:	7442                	ld	s0,48(sp)
  800294:	9abe                	add	s5,s5,a5
  800296:	000ac503          	lbu	a0,0(s5)
  80029a:	70e2                	ld	ra,56(sp)
  80029c:	6a42                	ld	s4,16(sp)
  80029e:	6aa2                	ld	s5,8(sp)
  8002a0:	864e                	mv	a2,s3
  8002a2:	85ca                	mv	a1,s2
  8002a4:	69e2                	ld	s3,24(sp)
  8002a6:	7902                	ld	s2,32(sp)
  8002a8:	8326                	mv	t1,s1
  8002aa:	74a2                	ld	s1,40(sp)
  8002ac:	6121                	addi	sp,sp,64
  8002ae:	8302                	jr	t1
  8002b0:	0316d6b3          	divu	a3,a3,a7
  8002b4:	87a2                	mv	a5,s0
  8002b6:	f91ff0ef          	jal	ra,800246 <printnum>
  8002ba:	b7e9                	j	800284 <printnum+0x3e>

00000000008002bc <vprintfmt>:
  8002bc:	7119                	addi	sp,sp,-128
  8002be:	f4a6                	sd	s1,104(sp)
  8002c0:	f0ca                	sd	s2,96(sp)
  8002c2:	ecce                	sd	s3,88(sp)
  8002c4:	e8d2                	sd	s4,80(sp)
  8002c6:	e4d6                	sd	s5,72(sp)
  8002c8:	e0da                	sd	s6,64(sp)
  8002ca:	fc5e                	sd	s7,56(sp)
  8002cc:	ec6e                	sd	s11,24(sp)
  8002ce:	fc86                	sd	ra,120(sp)
  8002d0:	f8a2                	sd	s0,112(sp)
  8002d2:	f862                	sd	s8,48(sp)
  8002d4:	f466                	sd	s9,40(sp)
  8002d6:	f06a                	sd	s10,32(sp)
  8002d8:	89aa                	mv	s3,a0
  8002da:	892e                	mv	s2,a1
  8002dc:	84b2                	mv	s1,a2
  8002de:	8db6                	mv	s11,a3
  8002e0:	8aba                	mv	s5,a4
  8002e2:	02500a13          	li	s4,37
  8002e6:	5bfd                	li	s7,-1
  8002e8:	00000b17          	auipc	s6,0x0
  8002ec:	4d4b0b13          	addi	s6,s6,1236 # 8007bc <main+0x162>
  8002f0:	000dc503          	lbu	a0,0(s11)
  8002f4:	001d8413          	addi	s0,s11,1
  8002f8:	01450b63          	beq	a0,s4,80030e <vprintfmt+0x52>
  8002fc:	c129                	beqz	a0,80033e <vprintfmt+0x82>
  8002fe:	864a                	mv	a2,s2
  800300:	85a6                	mv	a1,s1
  800302:	0405                	addi	s0,s0,1
  800304:	9982                	jalr	s3
  800306:	fff44503          	lbu	a0,-1(s0)
  80030a:	ff4519e3          	bne	a0,s4,8002fc <vprintfmt+0x40>
  80030e:	00044583          	lbu	a1,0(s0)
  800312:	02000813          	li	a6,32
  800316:	4d01                	li	s10,0
  800318:	4301                	li	t1,0
  80031a:	5cfd                	li	s9,-1
  80031c:	5c7d                	li	s8,-1
  80031e:	05500513          	li	a0,85
  800322:	48a5                	li	a7,9
  800324:	fdd5861b          	addiw	a2,a1,-35
  800328:	0ff67613          	andi	a2,a2,255
  80032c:	00140d93          	addi	s11,s0,1
  800330:	04c56263          	bltu	a0,a2,800374 <vprintfmt+0xb8>
  800334:	060a                	slli	a2,a2,0x2
  800336:	965a                	add	a2,a2,s6
  800338:	4214                	lw	a3,0(a2)
  80033a:	96da                	add	a3,a3,s6
  80033c:	8682                	jr	a3
  80033e:	70e6                	ld	ra,120(sp)
  800340:	7446                	ld	s0,112(sp)
  800342:	74a6                	ld	s1,104(sp)
  800344:	7906                	ld	s2,96(sp)
  800346:	69e6                	ld	s3,88(sp)
  800348:	6a46                	ld	s4,80(sp)
  80034a:	6aa6                	ld	s5,72(sp)
  80034c:	6b06                	ld	s6,64(sp)
  80034e:	7be2                	ld	s7,56(sp)
  800350:	7c42                	ld	s8,48(sp)
  800352:	7ca2                	ld	s9,40(sp)
  800354:	7d02                	ld	s10,32(sp)
  800356:	6de2                	ld	s11,24(sp)
  800358:	6109                	addi	sp,sp,128
  80035a:	8082                	ret
  80035c:	882e                	mv	a6,a1
  80035e:	00144583          	lbu	a1,1(s0)
  800362:	846e                	mv	s0,s11
  800364:	00140d93          	addi	s11,s0,1
  800368:	fdd5861b          	addiw	a2,a1,-35
  80036c:	0ff67613          	andi	a2,a2,255
  800370:	fcc572e3          	bgeu	a0,a2,800334 <vprintfmt+0x78>
  800374:	864a                	mv	a2,s2
  800376:	85a6                	mv	a1,s1
  800378:	02500513          	li	a0,37
  80037c:	9982                	jalr	s3
  80037e:	fff44783          	lbu	a5,-1(s0)
  800382:	8da2                	mv	s11,s0
  800384:	f74786e3          	beq	a5,s4,8002f0 <vprintfmt+0x34>
  800388:	ffedc783          	lbu	a5,-2(s11)
  80038c:	1dfd                	addi	s11,s11,-1
  80038e:	ff479de3          	bne	a5,s4,800388 <vprintfmt+0xcc>
  800392:	bfb9                	j	8002f0 <vprintfmt+0x34>
  800394:	fd058c9b          	addiw	s9,a1,-48
  800398:	00144583          	lbu	a1,1(s0)
  80039c:	846e                	mv	s0,s11
  80039e:	fd05869b          	addiw	a3,a1,-48
  8003a2:	0005861b          	sext.w	a2,a1
  8003a6:	02d8e463          	bltu	a7,a3,8003ce <vprintfmt+0x112>
  8003aa:	00144583          	lbu	a1,1(s0)
  8003ae:	002c969b          	slliw	a3,s9,0x2
  8003b2:	0196873b          	addw	a4,a3,s9
  8003b6:	0017171b          	slliw	a4,a4,0x1
  8003ba:	9f31                	addw	a4,a4,a2
  8003bc:	fd05869b          	addiw	a3,a1,-48
  8003c0:	0405                	addi	s0,s0,1
  8003c2:	fd070c9b          	addiw	s9,a4,-48
  8003c6:	0005861b          	sext.w	a2,a1
  8003ca:	fed8f0e3          	bgeu	a7,a3,8003aa <vprintfmt+0xee>
  8003ce:	f40c5be3          	bgez	s8,800324 <vprintfmt+0x68>
  8003d2:	8c66                	mv	s8,s9
  8003d4:	5cfd                	li	s9,-1
  8003d6:	b7b9                	j	800324 <vprintfmt+0x68>
  8003d8:	fffc4693          	not	a3,s8
  8003dc:	96fd                	srai	a3,a3,0x3f
  8003de:	00dc77b3          	and	a5,s8,a3
  8003e2:	00144583          	lbu	a1,1(s0)
  8003e6:	00078c1b          	sext.w	s8,a5
  8003ea:	846e                	mv	s0,s11
  8003ec:	bf25                	j	800324 <vprintfmt+0x68>
  8003ee:	000aac83          	lw	s9,0(s5)
  8003f2:	00144583          	lbu	a1,1(s0)
  8003f6:	0aa1                	addi	s5,s5,8
  8003f8:	846e                	mv	s0,s11
  8003fa:	bfd1                	j	8003ce <vprintfmt+0x112>
  8003fc:	4705                	li	a4,1
  8003fe:	008a8613          	addi	a2,s5,8
  800402:	00674463          	blt	a4,t1,80040a <vprintfmt+0x14e>
  800406:	1c030c63          	beqz	t1,8005de <vprintfmt+0x322>
  80040a:	000ab683          	ld	a3,0(s5)
  80040e:	4741                	li	a4,16
  800410:	8ab2                	mv	s5,a2
  800412:	2801                	sext.w	a6,a6
  800414:	87e2                	mv	a5,s8
  800416:	8626                	mv	a2,s1
  800418:	85ca                	mv	a1,s2
  80041a:	854e                	mv	a0,s3
  80041c:	e2bff0ef          	jal	ra,800246 <printnum>
  800420:	bdc1                	j	8002f0 <vprintfmt+0x34>
  800422:	000aa503          	lw	a0,0(s5)
  800426:	864a                	mv	a2,s2
  800428:	85a6                	mv	a1,s1
  80042a:	0aa1                	addi	s5,s5,8
  80042c:	9982                	jalr	s3
  80042e:	b5c9                	j	8002f0 <vprintfmt+0x34>
  800430:	4705                	li	a4,1
  800432:	008a8613          	addi	a2,s5,8
  800436:	00674463          	blt	a4,t1,80043e <vprintfmt+0x182>
  80043a:	18030d63          	beqz	t1,8005d4 <vprintfmt+0x318>
  80043e:	000ab683          	ld	a3,0(s5)
  800442:	4729                	li	a4,10
  800444:	8ab2                	mv	s5,a2
  800446:	b7f1                	j	800412 <vprintfmt+0x156>
  800448:	00144583          	lbu	a1,1(s0)
  80044c:	4d05                	li	s10,1
  80044e:	846e                	mv	s0,s11
  800450:	bdd1                	j	800324 <vprintfmt+0x68>
  800452:	864a                	mv	a2,s2
  800454:	85a6                	mv	a1,s1
  800456:	02500513          	li	a0,37
  80045a:	9982                	jalr	s3
  80045c:	bd51                	j	8002f0 <vprintfmt+0x34>
  80045e:	00144583          	lbu	a1,1(s0)
  800462:	2305                	addiw	t1,t1,1
  800464:	846e                	mv	s0,s11
  800466:	bd7d                	j	800324 <vprintfmt+0x68>
  800468:	4705                	li	a4,1
  80046a:	008a8613          	addi	a2,s5,8
  80046e:	00674463          	blt	a4,t1,800476 <vprintfmt+0x1ba>
  800472:	14030c63          	beqz	t1,8005ca <vprintfmt+0x30e>
  800476:	000ab683          	ld	a3,0(s5)
  80047a:	4721                	li	a4,8
  80047c:	8ab2                	mv	s5,a2
  80047e:	bf51                	j	800412 <vprintfmt+0x156>
  800480:	03000513          	li	a0,48
  800484:	864a                	mv	a2,s2
  800486:	85a6                	mv	a1,s1
  800488:	e042                	sd	a6,0(sp)
  80048a:	9982                	jalr	s3
  80048c:	864a                	mv	a2,s2
  80048e:	85a6                	mv	a1,s1
  800490:	07800513          	li	a0,120
  800494:	9982                	jalr	s3
  800496:	0aa1                	addi	s5,s5,8
  800498:	6802                	ld	a6,0(sp)
  80049a:	4741                	li	a4,16
  80049c:	ff8ab683          	ld	a3,-8(s5)
  8004a0:	bf8d                	j	800412 <vprintfmt+0x156>
  8004a2:	000ab403          	ld	s0,0(s5)
  8004a6:	008a8793          	addi	a5,s5,8
  8004aa:	e03e                	sd	a5,0(sp)
  8004ac:	14040c63          	beqz	s0,800604 <vprintfmt+0x348>
  8004b0:	11805063          	blez	s8,8005b0 <vprintfmt+0x2f4>
  8004b4:	02d00693          	li	a3,45
  8004b8:	0cd81963          	bne	a6,a3,80058a <vprintfmt+0x2ce>
  8004bc:	00044683          	lbu	a3,0(s0)
  8004c0:	0006851b          	sext.w	a0,a3
  8004c4:	ce8d                	beqz	a3,8004fe <vprintfmt+0x242>
  8004c6:	00140a93          	addi	s5,s0,1
  8004ca:	05e00413          	li	s0,94
  8004ce:	000cc563          	bltz	s9,8004d8 <vprintfmt+0x21c>
  8004d2:	3cfd                	addiw	s9,s9,-1
  8004d4:	037c8363          	beq	s9,s7,8004fa <vprintfmt+0x23e>
  8004d8:	864a                	mv	a2,s2
  8004da:	85a6                	mv	a1,s1
  8004dc:	100d0663          	beqz	s10,8005e8 <vprintfmt+0x32c>
  8004e0:	3681                	addiw	a3,a3,-32
  8004e2:	10d47363          	bgeu	s0,a3,8005e8 <vprintfmt+0x32c>
  8004e6:	03f00513          	li	a0,63
  8004ea:	9982                	jalr	s3
  8004ec:	000ac683          	lbu	a3,0(s5)
  8004f0:	3c7d                	addiw	s8,s8,-1
  8004f2:	0a85                	addi	s5,s5,1
  8004f4:	0006851b          	sext.w	a0,a3
  8004f8:	faf9                	bnez	a3,8004ce <vprintfmt+0x212>
  8004fa:	01805a63          	blez	s8,80050e <vprintfmt+0x252>
  8004fe:	3c7d                	addiw	s8,s8,-1
  800500:	864a                	mv	a2,s2
  800502:	85a6                	mv	a1,s1
  800504:	02000513          	li	a0,32
  800508:	9982                	jalr	s3
  80050a:	fe0c1ae3          	bnez	s8,8004fe <vprintfmt+0x242>
  80050e:	6a82                	ld	s5,0(sp)
  800510:	b3c5                	j	8002f0 <vprintfmt+0x34>
  800512:	4705                	li	a4,1
  800514:	008a8d13          	addi	s10,s5,8
  800518:	00674463          	blt	a4,t1,800520 <vprintfmt+0x264>
  80051c:	0a030463          	beqz	t1,8005c4 <vprintfmt+0x308>
  800520:	000ab403          	ld	s0,0(s5)
  800524:	0c044463          	bltz	s0,8005ec <vprintfmt+0x330>
  800528:	86a2                	mv	a3,s0
  80052a:	8aea                	mv	s5,s10
  80052c:	4729                	li	a4,10
  80052e:	b5d5                	j	800412 <vprintfmt+0x156>
  800530:	000aa783          	lw	a5,0(s5)
  800534:	46e1                	li	a3,24
  800536:	0aa1                	addi	s5,s5,8
  800538:	41f7d71b          	sraiw	a4,a5,0x1f
  80053c:	8fb9                	xor	a5,a5,a4
  80053e:	40e7873b          	subw	a4,a5,a4
  800542:	02e6c663          	blt	a3,a4,80056e <vprintfmt+0x2b2>
  800546:	00371793          	slli	a5,a4,0x3
  80054a:	00000697          	auipc	a3,0x0
  80054e:	5a668693          	addi	a3,a3,1446 # 800af0 <error_string>
  800552:	97b6                	add	a5,a5,a3
  800554:	639c                	ld	a5,0(a5)
  800556:	cf81                	beqz	a5,80056e <vprintfmt+0x2b2>
  800558:	873e                	mv	a4,a5
  80055a:	00000697          	auipc	a3,0x0
  80055e:	25e68693          	addi	a3,a3,606 # 8007b8 <main+0x15e>
  800562:	8626                	mv	a2,s1
  800564:	85ca                	mv	a1,s2
  800566:	854e                	mv	a0,s3
  800568:	0d4000ef          	jal	ra,80063c <printfmt>
  80056c:	b351                	j	8002f0 <vprintfmt+0x34>
  80056e:	00000697          	auipc	a3,0x0
  800572:	23a68693          	addi	a3,a3,570 # 8007a8 <main+0x14e>
  800576:	8626                	mv	a2,s1
  800578:	85ca                	mv	a1,s2
  80057a:	854e                	mv	a0,s3
  80057c:	0c0000ef          	jal	ra,80063c <printfmt>
  800580:	bb85                	j	8002f0 <vprintfmt+0x34>
  800582:	00000417          	auipc	s0,0x0
  800586:	21e40413          	addi	s0,s0,542 # 8007a0 <main+0x146>
  80058a:	85e6                	mv	a1,s9
  80058c:	8522                	mv	a0,s0
  80058e:	e442                	sd	a6,8(sp)
  800590:	c9bff0ef          	jal	ra,80022a <strnlen>
  800594:	40ac0c3b          	subw	s8,s8,a0
  800598:	01805c63          	blez	s8,8005b0 <vprintfmt+0x2f4>
  80059c:	6822                	ld	a6,8(sp)
  80059e:	00080a9b          	sext.w	s5,a6
  8005a2:	3c7d                	addiw	s8,s8,-1
  8005a4:	864a                	mv	a2,s2
  8005a6:	85a6                	mv	a1,s1
  8005a8:	8556                	mv	a0,s5
  8005aa:	9982                	jalr	s3
  8005ac:	fe0c1be3          	bnez	s8,8005a2 <vprintfmt+0x2e6>
  8005b0:	00044683          	lbu	a3,0(s0)
  8005b4:	00140a93          	addi	s5,s0,1
  8005b8:	0006851b          	sext.w	a0,a3
  8005bc:	daa9                	beqz	a3,80050e <vprintfmt+0x252>
  8005be:	05e00413          	li	s0,94
  8005c2:	b731                	j	8004ce <vprintfmt+0x212>
  8005c4:	000aa403          	lw	s0,0(s5)
  8005c8:	bfb1                	j	800524 <vprintfmt+0x268>
  8005ca:	000ae683          	lwu	a3,0(s5)
  8005ce:	4721                	li	a4,8
  8005d0:	8ab2                	mv	s5,a2
  8005d2:	b581                	j	800412 <vprintfmt+0x156>
  8005d4:	000ae683          	lwu	a3,0(s5)
  8005d8:	4729                	li	a4,10
  8005da:	8ab2                	mv	s5,a2
  8005dc:	bd1d                	j	800412 <vprintfmt+0x156>
  8005de:	000ae683          	lwu	a3,0(s5)
  8005e2:	4741                	li	a4,16
  8005e4:	8ab2                	mv	s5,a2
  8005e6:	b535                	j	800412 <vprintfmt+0x156>
  8005e8:	9982                	jalr	s3
  8005ea:	b709                	j	8004ec <vprintfmt+0x230>
  8005ec:	864a                	mv	a2,s2
  8005ee:	85a6                	mv	a1,s1
  8005f0:	02d00513          	li	a0,45
  8005f4:	e042                	sd	a6,0(sp)
  8005f6:	9982                	jalr	s3
  8005f8:	6802                	ld	a6,0(sp)
  8005fa:	8aea                	mv	s5,s10
  8005fc:	408006b3          	neg	a3,s0
  800600:	4729                	li	a4,10
  800602:	bd01                	j	800412 <vprintfmt+0x156>
  800604:	03805163          	blez	s8,800626 <vprintfmt+0x36a>
  800608:	02d00693          	li	a3,45
  80060c:	f6d81be3          	bne	a6,a3,800582 <vprintfmt+0x2c6>
  800610:	00000417          	auipc	s0,0x0
  800614:	19040413          	addi	s0,s0,400 # 8007a0 <main+0x146>
  800618:	02800693          	li	a3,40
  80061c:	02800513          	li	a0,40
  800620:	00140a93          	addi	s5,s0,1
  800624:	b55d                	j	8004ca <vprintfmt+0x20e>
  800626:	00000a97          	auipc	s5,0x0
  80062a:	17ba8a93          	addi	s5,s5,379 # 8007a1 <main+0x147>
  80062e:	02800513          	li	a0,40
  800632:	02800693          	li	a3,40
  800636:	05e00413          	li	s0,94
  80063a:	bd51                	j	8004ce <vprintfmt+0x212>

000000000080063c <printfmt>:
  80063c:	7139                	addi	sp,sp,-64
  80063e:	02010313          	addi	t1,sp,32
  800642:	f03a                	sd	a4,32(sp)
  800644:	871a                	mv	a4,t1
  800646:	ec06                	sd	ra,24(sp)
  800648:	f43e                	sd	a5,40(sp)
  80064a:	f842                	sd	a6,48(sp)
  80064c:	fc46                	sd	a7,56(sp)
  80064e:	e41a                	sd	t1,8(sp)
  800650:	c6dff0ef          	jal	ra,8002bc <vprintfmt>
  800654:	60e2                	ld	ra,24(sp)
  800656:	6121                	addi	sp,sp,64
  800658:	8082                	ret

000000000080065a <main>:
  80065a:	1101                	addi	sp,sp,-32
  80065c:	ec06                	sd	ra,24(sp)
  80065e:	e822                	sd	s0,16(sp)
  800660:	e426                	sd	s1,8(sp)
  800662:	e04a                	sd	s2,0(sp)
  800664:	a81ff0ef          	jal	ra,8000e4 <getpid>
  800668:	85aa                	mv	a1,a0
  80066a:	00000517          	auipc	a0,0x0
  80066e:	54e50513          	addi	a0,a0,1358 # 800bb8 <error_string+0xc8>
  800672:	ac5ff0ef          	jal	ra,800136 <cprintf>
  800676:	4401                	li	s0,0
  800678:	00000917          	auipc	s2,0x0
  80067c:	56090913          	addi	s2,s2,1376 # 800bd8 <error_string+0xe8>
  800680:	4495                	li	s1,5
  800682:	a61ff0ef          	jal	ra,8000e2 <yield>
  800686:	a5fff0ef          	jal	ra,8000e4 <getpid>
  80068a:	85aa                	mv	a1,a0
  80068c:	8622                	mv	a2,s0
  80068e:	854a                	mv	a0,s2
  800690:	2405                	addiw	s0,s0,1
  800692:	aa5ff0ef          	jal	ra,800136 <cprintf>
  800696:	fe9416e3          	bne	s0,s1,800682 <main+0x28>
  80069a:	a4bff0ef          	jal	ra,8000e4 <getpid>
  80069e:	85aa                	mv	a1,a0
  8006a0:	00000517          	auipc	a0,0x0
  8006a4:	56050513          	addi	a0,a0,1376 # 800c00 <error_string+0x110>
  8006a8:	a8fff0ef          	jal	ra,800136 <cprintf>
  8006ac:	00000517          	auipc	a0,0x0
  8006b0:	57450513          	addi	a0,a0,1396 # 800c20 <error_string+0x130>
  8006b4:	a83ff0ef          	jal	ra,800136 <cprintf>
  8006b8:	60e2                	ld	ra,24(sp)
  8006ba:	6442                	ld	s0,16(sp)
  8006bc:	64a2                	ld	s1,8(sp)
  8006be:	6902                	ld	s2,0(sp)
  8006c0:	4501                	li	a0,0
  8006c2:	6105                	addi	sp,sp,32
  8006c4:	8082                	ret
