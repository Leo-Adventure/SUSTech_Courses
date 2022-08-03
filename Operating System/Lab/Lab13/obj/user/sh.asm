
obj/__user_sh.out:     file format elf64-littleriscv


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
  800034:	d0850513          	addi	a0,a0,-760 # 800d38 <main+0xca>
  800038:	ec06                	sd	ra,24(sp)
  80003a:	f436                	sd	a3,40(sp)
  80003c:	f83a                	sd	a4,48(sp)
  80003e:	e0c2                	sd	a6,64(sp)
  800040:	e4c6                	sd	a7,72(sp)
  800042:	e43e                	sd	a5,8(sp)
  800044:	1a2000ef          	jal	ra,8001e6 <cprintf>
  800048:	65a2                	ld	a1,8(sp)
  80004a:	8522                	mv	a0,s0
  80004c:	174000ef          	jal	ra,8001c0 <vcprintf>
  800050:	00001517          	auipc	a0,0x1
  800054:	d6050513          	addi	a0,a0,-672 # 800db0 <main+0x142>
  800058:	18e000ef          	jal	ra,8001e6 <cprintf>
  80005c:	5559                	li	a0,-10
  80005e:	0d6000ef          	jal	ra,800134 <exit>

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
  800076:	ce650513          	addi	a0,a0,-794 # 800d58 <main+0xea>
  80007a:	ec06                	sd	ra,24(sp)
  80007c:	f436                	sd	a3,40(sp)
  80007e:	f83a                	sd	a4,48(sp)
  800080:	e0c2                	sd	a6,64(sp)
  800082:	e4c6                	sd	a7,72(sp)
  800084:	e43e                	sd	a5,8(sp)
  800086:	160000ef          	jal	ra,8001e6 <cprintf>
  80008a:	65a2                	ld	a1,8(sp)
  80008c:	8522                	mv	a0,s0
  80008e:	132000ef          	jal	ra,8001c0 <vcprintf>
  800092:	00001517          	auipc	a0,0x1
  800096:	d1e50513          	addi	a0,a0,-738 # 800db0 <main+0x142>
  80009a:	14c000ef          	jal	ra,8001e6 <cprintf>
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

00000000008000f6 <sys_exec>:
  8000f6:	86b2                	mv	a3,a2
  8000f8:	862e                	mv	a2,a1
  8000fa:	85aa                	mv	a1,a0
  8000fc:	4511                	li	a0,4
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

0000000000800112 <sys_read>:
  800112:	86b2                	mv	a3,a2
  800114:	862e                	mv	a2,a1
  800116:	85aa                	mv	a1,a0
  800118:	06600513          	li	a0,102
  80011c:	b769                	j	8000a6 <syscall>

000000000080011e <sys_write>:
  80011e:	86b2                	mv	a3,a2
  800120:	862e                	mv	a2,a1
  800122:	85aa                	mv	a1,a0
  800124:	06700513          	li	a0,103
  800128:	bfbd                	j	8000a6 <syscall>

000000000080012a <sys_dup>:
  80012a:	862e                	mv	a2,a1
  80012c:	85aa                	mv	a1,a0
  80012e:	08200513          	li	a0,130
  800132:	bf95                	j	8000a6 <syscall>

0000000000800134 <exit>:
  800134:	1141                	addi	sp,sp,-16
  800136:	e406                	sd	ra,8(sp)
  800138:	fa7ff0ef          	jal	ra,8000de <sys_exit>
  80013c:	00001517          	auipc	a0,0x1
  800140:	c3c50513          	addi	a0,a0,-964 # 800d78 <main+0x10a>
  800144:	0a2000ef          	jal	ra,8001e6 <cprintf>
  800148:	a001                	j	800148 <exit+0x14>

000000000080014a <fork>:
  80014a:	bf69                	j	8000e4 <sys_fork>

000000000080014c <waitpid>:
  80014c:	bf71                	j	8000e8 <sys_wait>

000000000080014e <__exec>:
  80014e:	619c                	ld	a5,0(a1)
  800150:	862e                	mv	a2,a1
  800152:	cb89                	beqz	a5,800164 <__exec+0x16>
  800154:	00858793          	addi	a5,a1,8
  800158:	4581                	li	a1,0
  80015a:	6398                	ld	a4,0(a5)
  80015c:	2585                	addiw	a1,a1,1
  80015e:	07a1                	addi	a5,a5,8
  800160:	ff6d                	bnez	a4,80015a <__exec+0xc>
  800162:	bf51                	j	8000f6 <sys_exec>
  800164:	4581                	li	a1,0
  800166:	bf41                	j	8000f6 <sys_exec>

0000000000800168 <_start>:
  800168:	174000ef          	jal	ra,8002dc <umain>
  80016c:	a001                	j	80016c <_start+0x4>

000000000080016e <open>:
  80016e:	1582                	slli	a1,a1,0x20
  800170:	9181                	srli	a1,a1,0x20
  800172:	b779                	j	800100 <sys_open>

0000000000800174 <close>:
  800174:	bf59                	j	80010a <sys_close>

0000000000800176 <read>:
  800176:	bf71                	j	800112 <sys_read>

0000000000800178 <write>:
  800178:	b75d                	j	80011e <sys_write>

000000000080017a <dup2>:
  80017a:	bf45                	j	80012a <sys_dup>

000000000080017c <cputch>:
  80017c:	1141                	addi	sp,sp,-16
  80017e:	e022                	sd	s0,0(sp)
  800180:	e406                	sd	ra,8(sp)
  800182:	842e                	mv	s0,a1
  800184:	f6dff0ef          	jal	ra,8000f0 <sys_putc>
  800188:	401c                	lw	a5,0(s0)
  80018a:	60a2                	ld	ra,8(sp)
  80018c:	2785                	addiw	a5,a5,1
  80018e:	c01c                	sw	a5,0(s0)
  800190:	6402                	ld	s0,0(sp)
  800192:	0141                	addi	sp,sp,16
  800194:	8082                	ret

0000000000800196 <fputch>:
  800196:	1101                	addi	sp,sp,-32
  800198:	8732                	mv	a4,a2
  80019a:	e822                	sd	s0,16(sp)
  80019c:	87aa                	mv	a5,a0
  80019e:	842e                	mv	s0,a1
  8001a0:	4605                	li	a2,1
  8001a2:	00f10593          	addi	a1,sp,15
  8001a6:	853a                	mv	a0,a4
  8001a8:	ec06                	sd	ra,24(sp)
  8001aa:	00f107a3          	sb	a5,15(sp)
  8001ae:	fcbff0ef          	jal	ra,800178 <write>
  8001b2:	401c                	lw	a5,0(s0)
  8001b4:	60e2                	ld	ra,24(sp)
  8001b6:	2785                	addiw	a5,a5,1
  8001b8:	c01c                	sw	a5,0(s0)
  8001ba:	6442                	ld	s0,16(sp)
  8001bc:	6105                	addi	sp,sp,32
  8001be:	8082                	ret

00000000008001c0 <vcprintf>:
  8001c0:	1101                	addi	sp,sp,-32
  8001c2:	872e                	mv	a4,a1
  8001c4:	75dd                	lui	a1,0xffff7
  8001c6:	86aa                	mv	a3,a0
  8001c8:	0070                	addi	a2,sp,12
  8001ca:	00000517          	auipc	a0,0x0
  8001ce:	fb250513          	addi	a0,a0,-78 # 80017c <cputch>
  8001d2:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <buffer.1192+0xffffffffff7f29d1>
  8001d6:	ec06                	sd	ra,24(sp)
  8001d8:	c602                	sw	zero,12(sp)
  8001da:	268000ef          	jal	ra,800442 <vprintfmt>
  8001de:	60e2                	ld	ra,24(sp)
  8001e0:	4532                	lw	a0,12(sp)
  8001e2:	6105                	addi	sp,sp,32
  8001e4:	8082                	ret

00000000008001e6 <cprintf>:
  8001e6:	711d                	addi	sp,sp,-96
  8001e8:	02810313          	addi	t1,sp,40
  8001ec:	8e2a                	mv	t3,a0
  8001ee:	f42e                	sd	a1,40(sp)
  8001f0:	75dd                	lui	a1,0xffff7
  8001f2:	f832                	sd	a2,48(sp)
  8001f4:	fc36                	sd	a3,56(sp)
  8001f6:	e0ba                	sd	a4,64(sp)
  8001f8:	00000517          	auipc	a0,0x0
  8001fc:	f8450513          	addi	a0,a0,-124 # 80017c <cputch>
  800200:	0050                	addi	a2,sp,4
  800202:	871a                	mv	a4,t1
  800204:	86f2                	mv	a3,t3
  800206:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <buffer.1192+0xffffffffff7f29d1>
  80020a:	ec06                	sd	ra,24(sp)
  80020c:	e4be                	sd	a5,72(sp)
  80020e:	e8c2                	sd	a6,80(sp)
  800210:	ecc6                	sd	a7,88(sp)
  800212:	e41a                	sd	t1,8(sp)
  800214:	c202                	sw	zero,4(sp)
  800216:	22c000ef          	jal	ra,800442 <vprintfmt>
  80021a:	60e2                	ld	ra,24(sp)
  80021c:	4512                	lw	a0,4(sp)
  80021e:	6125                	addi	sp,sp,96
  800220:	8082                	ret

0000000000800222 <cputs>:
  800222:	1101                	addi	sp,sp,-32
  800224:	e822                	sd	s0,16(sp)
  800226:	ec06                	sd	ra,24(sp)
  800228:	e426                	sd	s1,8(sp)
  80022a:	842a                	mv	s0,a0
  80022c:	00054503          	lbu	a0,0(a0)
  800230:	c51d                	beqz	a0,80025e <cputs+0x3c>
  800232:	0405                	addi	s0,s0,1
  800234:	4485                	li	s1,1
  800236:	9c81                	subw	s1,s1,s0
  800238:	eb9ff0ef          	jal	ra,8000f0 <sys_putc>
  80023c:	00044503          	lbu	a0,0(s0)
  800240:	008487bb          	addw	a5,s1,s0
  800244:	0405                	addi	s0,s0,1
  800246:	f96d                	bnez	a0,800238 <cputs+0x16>
  800248:	0017841b          	addiw	s0,a5,1
  80024c:	4529                	li	a0,10
  80024e:	ea3ff0ef          	jal	ra,8000f0 <sys_putc>
  800252:	60e2                	ld	ra,24(sp)
  800254:	8522                	mv	a0,s0
  800256:	6442                	ld	s0,16(sp)
  800258:	64a2                	ld	s1,8(sp)
  80025a:	6105                	addi	sp,sp,32
  80025c:	8082                	ret
  80025e:	4405                	li	s0,1
  800260:	b7f5                	j	80024c <cputs+0x2a>

0000000000800262 <fprintf>:
  800262:	715d                	addi	sp,sp,-80
  800264:	02010313          	addi	t1,sp,32
  800268:	8e2a                	mv	t3,a0
  80026a:	f032                	sd	a2,32(sp)
  80026c:	f436                	sd	a3,40(sp)
  80026e:	f83a                	sd	a4,48(sp)
  800270:	00000517          	auipc	a0,0x0
  800274:	f2650513          	addi	a0,a0,-218 # 800196 <fputch>
  800278:	86ae                	mv	a3,a1
  80027a:	0050                	addi	a2,sp,4
  80027c:	871a                	mv	a4,t1
  80027e:	85f2                	mv	a1,t3
  800280:	ec06                	sd	ra,24(sp)
  800282:	fc3e                	sd	a5,56(sp)
  800284:	e0c2                	sd	a6,64(sp)
  800286:	e4c6                	sd	a7,72(sp)
  800288:	e41a                	sd	t1,8(sp)
  80028a:	c202                	sw	zero,4(sp)
  80028c:	1b6000ef          	jal	ra,800442 <vprintfmt>
  800290:	60e2                	ld	ra,24(sp)
  800292:	4512                	lw	a0,4(sp)
  800294:	6161                	addi	sp,sp,80
  800296:	8082                	ret

0000000000800298 <initfd>:
  800298:	1101                	addi	sp,sp,-32
  80029a:	87ae                	mv	a5,a1
  80029c:	e426                	sd	s1,8(sp)
  80029e:	85b2                	mv	a1,a2
  8002a0:	84aa                	mv	s1,a0
  8002a2:	853e                	mv	a0,a5
  8002a4:	e822                	sd	s0,16(sp)
  8002a6:	ec06                	sd	ra,24(sp)
  8002a8:	ec7ff0ef          	jal	ra,80016e <open>
  8002ac:	842a                	mv	s0,a0
  8002ae:	00054463          	bltz	a0,8002b6 <initfd+0x1e>
  8002b2:	00951863          	bne	a0,s1,8002c2 <initfd+0x2a>
  8002b6:	60e2                	ld	ra,24(sp)
  8002b8:	8522                	mv	a0,s0
  8002ba:	6442                	ld	s0,16(sp)
  8002bc:	64a2                	ld	s1,8(sp)
  8002be:	6105                	addi	sp,sp,32
  8002c0:	8082                	ret
  8002c2:	8526                	mv	a0,s1
  8002c4:	eb1ff0ef          	jal	ra,800174 <close>
  8002c8:	85a6                	mv	a1,s1
  8002ca:	8522                	mv	a0,s0
  8002cc:	eafff0ef          	jal	ra,80017a <dup2>
  8002d0:	84aa                	mv	s1,a0
  8002d2:	8522                	mv	a0,s0
  8002d4:	ea1ff0ef          	jal	ra,800174 <close>
  8002d8:	8426                	mv	s0,s1
  8002da:	bff1                	j	8002b6 <initfd+0x1e>

00000000008002dc <umain>:
  8002dc:	1101                	addi	sp,sp,-32
  8002de:	e822                	sd	s0,16(sp)
  8002e0:	e426                	sd	s1,8(sp)
  8002e2:	842a                	mv	s0,a0
  8002e4:	84ae                	mv	s1,a1
  8002e6:	4601                	li	a2,0
  8002e8:	00001597          	auipc	a1,0x1
  8002ec:	aa858593          	addi	a1,a1,-1368 # 800d90 <main+0x122>
  8002f0:	4501                	li	a0,0
  8002f2:	ec06                	sd	ra,24(sp)
  8002f4:	fa5ff0ef          	jal	ra,800298 <initfd>
  8002f8:	02054263          	bltz	a0,80031c <umain+0x40>
  8002fc:	4605                	li	a2,1
  8002fe:	00001597          	auipc	a1,0x1
  800302:	ad258593          	addi	a1,a1,-1326 # 800dd0 <main+0x162>
  800306:	4505                	li	a0,1
  800308:	f91ff0ef          	jal	ra,800298 <initfd>
  80030c:	02054563          	bltz	a0,800336 <umain+0x5a>
  800310:	85a6                	mv	a1,s1
  800312:	8522                	mv	a0,s0
  800314:	15b000ef          	jal	ra,800c6e <main>
  800318:	e1dff0ef          	jal	ra,800134 <exit>
  80031c:	86aa                	mv	a3,a0
  80031e:	00001617          	auipc	a2,0x1
  800322:	a7a60613          	addi	a2,a2,-1414 # 800d98 <main+0x12a>
  800326:	45e9                	li	a1,26
  800328:	00001517          	auipc	a0,0x1
  80032c:	a9050513          	addi	a0,a0,-1392 # 800db8 <main+0x14a>
  800330:	d33ff0ef          	jal	ra,800062 <__warn>
  800334:	b7e1                	j	8002fc <umain+0x20>
  800336:	86aa                	mv	a3,a0
  800338:	00001617          	auipc	a2,0x1
  80033c:	aa060613          	addi	a2,a2,-1376 # 800dd8 <main+0x16a>
  800340:	45f5                	li	a1,29
  800342:	00001517          	auipc	a0,0x1
  800346:	a7650513          	addi	a0,a0,-1418 # 800db8 <main+0x14a>
  80034a:	d19ff0ef          	jal	ra,800062 <__warn>
  80034e:	b7c9                	j	800310 <umain+0x34>

0000000000800350 <strnlen>:
  800350:	872a                	mv	a4,a0
  800352:	4501                	li	a0,0
  800354:	e589                	bnez	a1,80035e <strnlen+0xe>
  800356:	a811                	j	80036a <strnlen+0x1a>
  800358:	0505                	addi	a0,a0,1
  80035a:	00a58763          	beq	a1,a0,800368 <strnlen+0x18>
  80035e:	00a707b3          	add	a5,a4,a0
  800362:	0007c783          	lbu	a5,0(a5)
  800366:	fbed                	bnez	a5,800358 <strnlen+0x8>
  800368:	8082                	ret
  80036a:	8082                	ret

000000000080036c <strcpy>:
  80036c:	87aa                	mv	a5,a0
  80036e:	0005c703          	lbu	a4,0(a1)
  800372:	0785                	addi	a5,a5,1
  800374:	0585                	addi	a1,a1,1
  800376:	fee78fa3          	sb	a4,-1(a5)
  80037a:	fb75                	bnez	a4,80036e <strcpy+0x2>
  80037c:	8082                	ret

000000000080037e <strcmp>:
  80037e:	00054783          	lbu	a5,0(a0)
  800382:	0005c703          	lbu	a4,0(a1)
  800386:	cb89                	beqz	a5,800398 <strcmp+0x1a>
  800388:	0505                	addi	a0,a0,1
  80038a:	0585                	addi	a1,a1,1
  80038c:	fee789e3          	beq	a5,a4,80037e <strcmp>
  800390:	0007851b          	sext.w	a0,a5
  800394:	9d19                	subw	a0,a0,a4
  800396:	8082                	ret
  800398:	4501                	li	a0,0
  80039a:	bfed                	j	800394 <strcmp+0x16>

000000000080039c <strchr>:
  80039c:	00054783          	lbu	a5,0(a0)
  8003a0:	c799                	beqz	a5,8003ae <strchr+0x12>
  8003a2:	00f58763          	beq	a1,a5,8003b0 <strchr+0x14>
  8003a6:	00154783          	lbu	a5,1(a0)
  8003aa:	0505                	addi	a0,a0,1
  8003ac:	fbfd                	bnez	a5,8003a2 <strchr+0x6>
  8003ae:	4501                	li	a0,0
  8003b0:	8082                	ret

00000000008003b2 <printnum>:
  8003b2:	02071893          	slli	a7,a4,0x20
  8003b6:	7139                	addi	sp,sp,-64
  8003b8:	0208d893          	srli	a7,a7,0x20
  8003bc:	e456                	sd	s5,8(sp)
  8003be:	0316fab3          	remu	s5,a3,a7
  8003c2:	f822                	sd	s0,48(sp)
  8003c4:	f426                	sd	s1,40(sp)
  8003c6:	f04a                	sd	s2,32(sp)
  8003c8:	ec4e                	sd	s3,24(sp)
  8003ca:	fc06                	sd	ra,56(sp)
  8003cc:	e852                	sd	s4,16(sp)
  8003ce:	84aa                	mv	s1,a0
  8003d0:	89ae                	mv	s3,a1
  8003d2:	8932                	mv	s2,a2
  8003d4:	fff7841b          	addiw	s0,a5,-1
  8003d8:	2a81                	sext.w	s5,s5
  8003da:	0516f163          	bgeu	a3,a7,80041c <printnum+0x6a>
  8003de:	8a42                	mv	s4,a6
  8003e0:	00805863          	blez	s0,8003f0 <printnum+0x3e>
  8003e4:	347d                	addiw	s0,s0,-1
  8003e6:	864e                	mv	a2,s3
  8003e8:	85ca                	mv	a1,s2
  8003ea:	8552                	mv	a0,s4
  8003ec:	9482                	jalr	s1
  8003ee:	f87d                	bnez	s0,8003e4 <printnum+0x32>
  8003f0:	1a82                	slli	s5,s5,0x20
  8003f2:	020ada93          	srli	s5,s5,0x20
  8003f6:	00001797          	auipc	a5,0x1
  8003fa:	a0278793          	addi	a5,a5,-1534 # 800df8 <main+0x18a>
  8003fe:	7442                	ld	s0,48(sp)
  800400:	9abe                	add	s5,s5,a5
  800402:	000ac503          	lbu	a0,0(s5)
  800406:	70e2                	ld	ra,56(sp)
  800408:	6a42                	ld	s4,16(sp)
  80040a:	6aa2                	ld	s5,8(sp)
  80040c:	864e                	mv	a2,s3
  80040e:	85ca                	mv	a1,s2
  800410:	69e2                	ld	s3,24(sp)
  800412:	7902                	ld	s2,32(sp)
  800414:	8326                	mv	t1,s1
  800416:	74a2                	ld	s1,40(sp)
  800418:	6121                	addi	sp,sp,64
  80041a:	8302                	jr	t1
  80041c:	0316d6b3          	divu	a3,a3,a7
  800420:	87a2                	mv	a5,s0
  800422:	f91ff0ef          	jal	ra,8003b2 <printnum>
  800426:	b7e9                	j	8003f0 <printnum+0x3e>

0000000000800428 <sprintputch>:
  800428:	499c                	lw	a5,16(a1)
  80042a:	6198                	ld	a4,0(a1)
  80042c:	6594                	ld	a3,8(a1)
  80042e:	2785                	addiw	a5,a5,1
  800430:	c99c                	sw	a5,16(a1)
  800432:	00d77763          	bgeu	a4,a3,800440 <sprintputch+0x18>
  800436:	00170793          	addi	a5,a4,1
  80043a:	e19c                	sd	a5,0(a1)
  80043c:	00a70023          	sb	a0,0(a4)
  800440:	8082                	ret

0000000000800442 <vprintfmt>:
  800442:	7119                	addi	sp,sp,-128
  800444:	f4a6                	sd	s1,104(sp)
  800446:	f0ca                	sd	s2,96(sp)
  800448:	ecce                	sd	s3,88(sp)
  80044a:	e8d2                	sd	s4,80(sp)
  80044c:	e4d6                	sd	s5,72(sp)
  80044e:	e0da                	sd	s6,64(sp)
  800450:	fc5e                	sd	s7,56(sp)
  800452:	ec6e                	sd	s11,24(sp)
  800454:	fc86                	sd	ra,120(sp)
  800456:	f8a2                	sd	s0,112(sp)
  800458:	f862                	sd	s8,48(sp)
  80045a:	f466                	sd	s9,40(sp)
  80045c:	f06a                	sd	s10,32(sp)
  80045e:	89aa                	mv	s3,a0
  800460:	892e                	mv	s2,a1
  800462:	84b2                	mv	s1,a2
  800464:	8db6                	mv	s11,a3
  800466:	8aba                	mv	s5,a4
  800468:	02500a13          	li	s4,37
  80046c:	5bfd                	li	s7,-1
  80046e:	00001b17          	auipc	s6,0x1
  800472:	9beb0b13          	addi	s6,s6,-1602 # 800e2c <main+0x1be>
  800476:	000dc503          	lbu	a0,0(s11)
  80047a:	001d8413          	addi	s0,s11,1
  80047e:	01450b63          	beq	a0,s4,800494 <vprintfmt+0x52>
  800482:	c129                	beqz	a0,8004c4 <vprintfmt+0x82>
  800484:	864a                	mv	a2,s2
  800486:	85a6                	mv	a1,s1
  800488:	0405                	addi	s0,s0,1
  80048a:	9982                	jalr	s3
  80048c:	fff44503          	lbu	a0,-1(s0)
  800490:	ff4519e3          	bne	a0,s4,800482 <vprintfmt+0x40>
  800494:	00044583          	lbu	a1,0(s0)
  800498:	02000813          	li	a6,32
  80049c:	4d01                	li	s10,0
  80049e:	4301                	li	t1,0
  8004a0:	5cfd                	li	s9,-1
  8004a2:	5c7d                	li	s8,-1
  8004a4:	05500513          	li	a0,85
  8004a8:	48a5                	li	a7,9
  8004aa:	fdd5861b          	addiw	a2,a1,-35
  8004ae:	0ff67613          	andi	a2,a2,255
  8004b2:	00140d93          	addi	s11,s0,1
  8004b6:	04c56263          	bltu	a0,a2,8004fa <vprintfmt+0xb8>
  8004ba:	060a                	slli	a2,a2,0x2
  8004bc:	965a                	add	a2,a2,s6
  8004be:	4214                	lw	a3,0(a2)
  8004c0:	96da                	add	a3,a3,s6
  8004c2:	8682                	jr	a3
  8004c4:	70e6                	ld	ra,120(sp)
  8004c6:	7446                	ld	s0,112(sp)
  8004c8:	74a6                	ld	s1,104(sp)
  8004ca:	7906                	ld	s2,96(sp)
  8004cc:	69e6                	ld	s3,88(sp)
  8004ce:	6a46                	ld	s4,80(sp)
  8004d0:	6aa6                	ld	s5,72(sp)
  8004d2:	6b06                	ld	s6,64(sp)
  8004d4:	7be2                	ld	s7,56(sp)
  8004d6:	7c42                	ld	s8,48(sp)
  8004d8:	7ca2                	ld	s9,40(sp)
  8004da:	7d02                	ld	s10,32(sp)
  8004dc:	6de2                	ld	s11,24(sp)
  8004de:	6109                	addi	sp,sp,128
  8004e0:	8082                	ret
  8004e2:	882e                	mv	a6,a1
  8004e4:	00144583          	lbu	a1,1(s0)
  8004e8:	846e                	mv	s0,s11
  8004ea:	00140d93          	addi	s11,s0,1
  8004ee:	fdd5861b          	addiw	a2,a1,-35
  8004f2:	0ff67613          	andi	a2,a2,255
  8004f6:	fcc572e3          	bgeu	a0,a2,8004ba <vprintfmt+0x78>
  8004fa:	864a                	mv	a2,s2
  8004fc:	85a6                	mv	a1,s1
  8004fe:	02500513          	li	a0,37
  800502:	9982                	jalr	s3
  800504:	fff44783          	lbu	a5,-1(s0)
  800508:	8da2                	mv	s11,s0
  80050a:	f74786e3          	beq	a5,s4,800476 <vprintfmt+0x34>
  80050e:	ffedc783          	lbu	a5,-2(s11)
  800512:	1dfd                	addi	s11,s11,-1
  800514:	ff479de3          	bne	a5,s4,80050e <vprintfmt+0xcc>
  800518:	bfb9                	j	800476 <vprintfmt+0x34>
  80051a:	fd058c9b          	addiw	s9,a1,-48
  80051e:	00144583          	lbu	a1,1(s0)
  800522:	846e                	mv	s0,s11
  800524:	fd05869b          	addiw	a3,a1,-48
  800528:	0005861b          	sext.w	a2,a1
  80052c:	02d8e463          	bltu	a7,a3,800554 <vprintfmt+0x112>
  800530:	00144583          	lbu	a1,1(s0)
  800534:	002c969b          	slliw	a3,s9,0x2
  800538:	0196873b          	addw	a4,a3,s9
  80053c:	0017171b          	slliw	a4,a4,0x1
  800540:	9f31                	addw	a4,a4,a2
  800542:	fd05869b          	addiw	a3,a1,-48
  800546:	0405                	addi	s0,s0,1
  800548:	fd070c9b          	addiw	s9,a4,-48
  80054c:	0005861b          	sext.w	a2,a1
  800550:	fed8f0e3          	bgeu	a7,a3,800530 <vprintfmt+0xee>
  800554:	f40c5be3          	bgez	s8,8004aa <vprintfmt+0x68>
  800558:	8c66                	mv	s8,s9
  80055a:	5cfd                	li	s9,-1
  80055c:	b7b9                	j	8004aa <vprintfmt+0x68>
  80055e:	fffc4693          	not	a3,s8
  800562:	96fd                	srai	a3,a3,0x3f
  800564:	00dc77b3          	and	a5,s8,a3
  800568:	00144583          	lbu	a1,1(s0)
  80056c:	00078c1b          	sext.w	s8,a5
  800570:	846e                	mv	s0,s11
  800572:	bf25                	j	8004aa <vprintfmt+0x68>
  800574:	000aac83          	lw	s9,0(s5)
  800578:	00144583          	lbu	a1,1(s0)
  80057c:	0aa1                	addi	s5,s5,8
  80057e:	846e                	mv	s0,s11
  800580:	bfd1                	j	800554 <vprintfmt+0x112>
  800582:	4705                	li	a4,1
  800584:	008a8613          	addi	a2,s5,8
  800588:	00674463          	blt	a4,t1,800590 <vprintfmt+0x14e>
  80058c:	1c030c63          	beqz	t1,800764 <vprintfmt+0x322>
  800590:	000ab683          	ld	a3,0(s5)
  800594:	4741                	li	a4,16
  800596:	8ab2                	mv	s5,a2
  800598:	2801                	sext.w	a6,a6
  80059a:	87e2                	mv	a5,s8
  80059c:	8626                	mv	a2,s1
  80059e:	85ca                	mv	a1,s2
  8005a0:	854e                	mv	a0,s3
  8005a2:	e11ff0ef          	jal	ra,8003b2 <printnum>
  8005a6:	bdc1                	j	800476 <vprintfmt+0x34>
  8005a8:	000aa503          	lw	a0,0(s5)
  8005ac:	864a                	mv	a2,s2
  8005ae:	85a6                	mv	a1,s1
  8005b0:	0aa1                	addi	s5,s5,8
  8005b2:	9982                	jalr	s3
  8005b4:	b5c9                	j	800476 <vprintfmt+0x34>
  8005b6:	4705                	li	a4,1
  8005b8:	008a8613          	addi	a2,s5,8
  8005bc:	00674463          	blt	a4,t1,8005c4 <vprintfmt+0x182>
  8005c0:	18030d63          	beqz	t1,80075a <vprintfmt+0x318>
  8005c4:	000ab683          	ld	a3,0(s5)
  8005c8:	4729                	li	a4,10
  8005ca:	8ab2                	mv	s5,a2
  8005cc:	b7f1                	j	800598 <vprintfmt+0x156>
  8005ce:	00144583          	lbu	a1,1(s0)
  8005d2:	4d05                	li	s10,1
  8005d4:	846e                	mv	s0,s11
  8005d6:	bdd1                	j	8004aa <vprintfmt+0x68>
  8005d8:	864a                	mv	a2,s2
  8005da:	85a6                	mv	a1,s1
  8005dc:	02500513          	li	a0,37
  8005e0:	9982                	jalr	s3
  8005e2:	bd51                	j	800476 <vprintfmt+0x34>
  8005e4:	00144583          	lbu	a1,1(s0)
  8005e8:	2305                	addiw	t1,t1,1
  8005ea:	846e                	mv	s0,s11
  8005ec:	bd7d                	j	8004aa <vprintfmt+0x68>
  8005ee:	4705                	li	a4,1
  8005f0:	008a8613          	addi	a2,s5,8
  8005f4:	00674463          	blt	a4,t1,8005fc <vprintfmt+0x1ba>
  8005f8:	14030c63          	beqz	t1,800750 <vprintfmt+0x30e>
  8005fc:	000ab683          	ld	a3,0(s5)
  800600:	4721                	li	a4,8
  800602:	8ab2                	mv	s5,a2
  800604:	bf51                	j	800598 <vprintfmt+0x156>
  800606:	03000513          	li	a0,48
  80060a:	864a                	mv	a2,s2
  80060c:	85a6                	mv	a1,s1
  80060e:	e042                	sd	a6,0(sp)
  800610:	9982                	jalr	s3
  800612:	864a                	mv	a2,s2
  800614:	85a6                	mv	a1,s1
  800616:	07800513          	li	a0,120
  80061a:	9982                	jalr	s3
  80061c:	0aa1                	addi	s5,s5,8
  80061e:	6802                	ld	a6,0(sp)
  800620:	4741                	li	a4,16
  800622:	ff8ab683          	ld	a3,-8(s5)
  800626:	bf8d                	j	800598 <vprintfmt+0x156>
  800628:	000ab403          	ld	s0,0(s5)
  80062c:	008a8793          	addi	a5,s5,8
  800630:	e03e                	sd	a5,0(sp)
  800632:	14040c63          	beqz	s0,80078a <vprintfmt+0x348>
  800636:	11805063          	blez	s8,800736 <vprintfmt+0x2f4>
  80063a:	02d00693          	li	a3,45
  80063e:	0cd81963          	bne	a6,a3,800710 <vprintfmt+0x2ce>
  800642:	00044683          	lbu	a3,0(s0)
  800646:	0006851b          	sext.w	a0,a3
  80064a:	ce8d                	beqz	a3,800684 <vprintfmt+0x242>
  80064c:	00140a93          	addi	s5,s0,1
  800650:	05e00413          	li	s0,94
  800654:	000cc563          	bltz	s9,80065e <vprintfmt+0x21c>
  800658:	3cfd                	addiw	s9,s9,-1
  80065a:	037c8363          	beq	s9,s7,800680 <vprintfmt+0x23e>
  80065e:	864a                	mv	a2,s2
  800660:	85a6                	mv	a1,s1
  800662:	100d0663          	beqz	s10,80076e <vprintfmt+0x32c>
  800666:	3681                	addiw	a3,a3,-32
  800668:	10d47363          	bgeu	s0,a3,80076e <vprintfmt+0x32c>
  80066c:	03f00513          	li	a0,63
  800670:	9982                	jalr	s3
  800672:	000ac683          	lbu	a3,0(s5)
  800676:	3c7d                	addiw	s8,s8,-1
  800678:	0a85                	addi	s5,s5,1
  80067a:	0006851b          	sext.w	a0,a3
  80067e:	faf9                	bnez	a3,800654 <vprintfmt+0x212>
  800680:	01805a63          	blez	s8,800694 <vprintfmt+0x252>
  800684:	3c7d                	addiw	s8,s8,-1
  800686:	864a                	mv	a2,s2
  800688:	85a6                	mv	a1,s1
  80068a:	02000513          	li	a0,32
  80068e:	9982                	jalr	s3
  800690:	fe0c1ae3          	bnez	s8,800684 <vprintfmt+0x242>
  800694:	6a82                	ld	s5,0(sp)
  800696:	b3c5                	j	800476 <vprintfmt+0x34>
  800698:	4705                	li	a4,1
  80069a:	008a8d13          	addi	s10,s5,8
  80069e:	00674463          	blt	a4,t1,8006a6 <vprintfmt+0x264>
  8006a2:	0a030463          	beqz	t1,80074a <vprintfmt+0x308>
  8006a6:	000ab403          	ld	s0,0(s5)
  8006aa:	0c044463          	bltz	s0,800772 <vprintfmt+0x330>
  8006ae:	86a2                	mv	a3,s0
  8006b0:	8aea                	mv	s5,s10
  8006b2:	4729                	li	a4,10
  8006b4:	b5d5                	j	800598 <vprintfmt+0x156>
  8006b6:	000aa783          	lw	a5,0(s5)
  8006ba:	46e1                	li	a3,24
  8006bc:	0aa1                	addi	s5,s5,8
  8006be:	41f7d71b          	sraiw	a4,a5,0x1f
  8006c2:	8fb9                	xor	a5,a5,a4
  8006c4:	40e7873b          	subw	a4,a5,a4
  8006c8:	02e6c663          	blt	a3,a4,8006f4 <vprintfmt+0x2b2>
  8006cc:	00371793          	slli	a5,a4,0x3
  8006d0:	00001697          	auipc	a3,0x1
  8006d4:	a9068693          	addi	a3,a3,-1392 # 801160 <error_string>
  8006d8:	97b6                	add	a5,a5,a3
  8006da:	639c                	ld	a5,0(a5)
  8006dc:	cf81                	beqz	a5,8006f4 <vprintfmt+0x2b2>
  8006de:	873e                	mv	a4,a5
  8006e0:	00000697          	auipc	a3,0x0
  8006e4:	74868693          	addi	a3,a3,1864 # 800e28 <main+0x1ba>
  8006e8:	8626                	mv	a2,s1
  8006ea:	85ca                	mv	a1,s2
  8006ec:	854e                	mv	a0,s3
  8006ee:	0d4000ef          	jal	ra,8007c2 <printfmt>
  8006f2:	b351                	j	800476 <vprintfmt+0x34>
  8006f4:	00000697          	auipc	a3,0x0
  8006f8:	72468693          	addi	a3,a3,1828 # 800e18 <main+0x1aa>
  8006fc:	8626                	mv	a2,s1
  8006fe:	85ca                	mv	a1,s2
  800700:	854e                	mv	a0,s3
  800702:	0c0000ef          	jal	ra,8007c2 <printfmt>
  800706:	bb85                	j	800476 <vprintfmt+0x34>
  800708:	00000417          	auipc	s0,0x0
  80070c:	70840413          	addi	s0,s0,1800 # 800e10 <main+0x1a2>
  800710:	85e6                	mv	a1,s9
  800712:	8522                	mv	a0,s0
  800714:	e442                	sd	a6,8(sp)
  800716:	c3bff0ef          	jal	ra,800350 <strnlen>
  80071a:	40ac0c3b          	subw	s8,s8,a0
  80071e:	01805c63          	blez	s8,800736 <vprintfmt+0x2f4>
  800722:	6822                	ld	a6,8(sp)
  800724:	00080a9b          	sext.w	s5,a6
  800728:	3c7d                	addiw	s8,s8,-1
  80072a:	864a                	mv	a2,s2
  80072c:	85a6                	mv	a1,s1
  80072e:	8556                	mv	a0,s5
  800730:	9982                	jalr	s3
  800732:	fe0c1be3          	bnez	s8,800728 <vprintfmt+0x2e6>
  800736:	00044683          	lbu	a3,0(s0)
  80073a:	00140a93          	addi	s5,s0,1
  80073e:	0006851b          	sext.w	a0,a3
  800742:	daa9                	beqz	a3,800694 <vprintfmt+0x252>
  800744:	05e00413          	li	s0,94
  800748:	b731                	j	800654 <vprintfmt+0x212>
  80074a:	000aa403          	lw	s0,0(s5)
  80074e:	bfb1                	j	8006aa <vprintfmt+0x268>
  800750:	000ae683          	lwu	a3,0(s5)
  800754:	4721                	li	a4,8
  800756:	8ab2                	mv	s5,a2
  800758:	b581                	j	800598 <vprintfmt+0x156>
  80075a:	000ae683          	lwu	a3,0(s5)
  80075e:	4729                	li	a4,10
  800760:	8ab2                	mv	s5,a2
  800762:	bd1d                	j	800598 <vprintfmt+0x156>
  800764:	000ae683          	lwu	a3,0(s5)
  800768:	4741                	li	a4,16
  80076a:	8ab2                	mv	s5,a2
  80076c:	b535                	j	800598 <vprintfmt+0x156>
  80076e:	9982                	jalr	s3
  800770:	b709                	j	800672 <vprintfmt+0x230>
  800772:	864a                	mv	a2,s2
  800774:	85a6                	mv	a1,s1
  800776:	02d00513          	li	a0,45
  80077a:	e042                	sd	a6,0(sp)
  80077c:	9982                	jalr	s3
  80077e:	6802                	ld	a6,0(sp)
  800780:	8aea                	mv	s5,s10
  800782:	408006b3          	neg	a3,s0
  800786:	4729                	li	a4,10
  800788:	bd01                	j	800598 <vprintfmt+0x156>
  80078a:	03805163          	blez	s8,8007ac <vprintfmt+0x36a>
  80078e:	02d00693          	li	a3,45
  800792:	f6d81be3          	bne	a6,a3,800708 <vprintfmt+0x2c6>
  800796:	00000417          	auipc	s0,0x0
  80079a:	67a40413          	addi	s0,s0,1658 # 800e10 <main+0x1a2>
  80079e:	02800693          	li	a3,40
  8007a2:	02800513          	li	a0,40
  8007a6:	00140a93          	addi	s5,s0,1
  8007aa:	b55d                	j	800650 <vprintfmt+0x20e>
  8007ac:	00000a97          	auipc	s5,0x0
  8007b0:	665a8a93          	addi	s5,s5,1637 # 800e11 <main+0x1a3>
  8007b4:	02800513          	li	a0,40
  8007b8:	02800693          	li	a3,40
  8007bc:	05e00413          	li	s0,94
  8007c0:	bd51                	j	800654 <vprintfmt+0x212>

00000000008007c2 <printfmt>:
  8007c2:	7139                	addi	sp,sp,-64
  8007c4:	02010313          	addi	t1,sp,32
  8007c8:	f03a                	sd	a4,32(sp)
  8007ca:	871a                	mv	a4,t1
  8007cc:	ec06                	sd	ra,24(sp)
  8007ce:	f43e                	sd	a5,40(sp)
  8007d0:	f842                	sd	a6,48(sp)
  8007d2:	fc46                	sd	a7,56(sp)
  8007d4:	e41a                	sd	t1,8(sp)
  8007d6:	c6dff0ef          	jal	ra,800442 <vprintfmt>
  8007da:	60e2                	ld	ra,24(sp)
  8007dc:	6121                	addi	sp,sp,64
  8007de:	8082                	ret

00000000008007e0 <vsnprintf>:
  8007e0:	15fd                	addi	a1,a1,-1
  8007e2:	7179                	addi	sp,sp,-48
  8007e4:	95aa                	add	a1,a1,a0
  8007e6:	f406                	sd	ra,40(sp)
  8007e8:	e42a                	sd	a0,8(sp)
  8007ea:	e82e                	sd	a1,16(sp)
  8007ec:	cc02                	sw	zero,24(sp)
  8007ee:	c515                	beqz	a0,80081a <vsnprintf+0x3a>
  8007f0:	02a5e563          	bltu	a1,a0,80081a <vsnprintf+0x3a>
  8007f4:	75dd                	lui	a1,0xffff7
  8007f6:	8736                	mv	a4,a3
  8007f8:	00000517          	auipc	a0,0x0
  8007fc:	c3050513          	addi	a0,a0,-976 # 800428 <sprintputch>
  800800:	86b2                	mv	a3,a2
  800802:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <buffer.1192+0xffffffffff7f29d1>
  800806:	0030                	addi	a2,sp,8
  800808:	c3bff0ef          	jal	ra,800442 <vprintfmt>
  80080c:	67a2                	ld	a5,8(sp)
  80080e:	00078023          	sb	zero,0(a5)
  800812:	4562                	lw	a0,24(sp)
  800814:	70a2                	ld	ra,40(sp)
  800816:	6145                	addi	sp,sp,48
  800818:	8082                	ret
  80081a:	5575                	li	a0,-3
  80081c:	bfe5                	j	800814 <vsnprintf+0x34>

000000000080081e <snprintf>:
  80081e:	715d                	addi	sp,sp,-80
  800820:	02810313          	addi	t1,sp,40
  800824:	f436                	sd	a3,40(sp)
  800826:	869a                	mv	a3,t1
  800828:	ec06                	sd	ra,24(sp)
  80082a:	f83a                	sd	a4,48(sp)
  80082c:	fc3e                	sd	a5,56(sp)
  80082e:	e0c2                	sd	a6,64(sp)
  800830:	e4c6                	sd	a7,72(sp)
  800832:	e41a                	sd	t1,8(sp)
  800834:	fadff0ef          	jal	ra,8007e0 <vsnprintf>
  800838:	60e2                	ld	ra,24(sp)
  80083a:	6161                	addi	sp,sp,80
  80083c:	8082                	ret

000000000080083e <gettoken>:
  80083e:	7139                	addi	sp,sp,-64
  800840:	f822                	sd	s0,48(sp)
  800842:	6100                	ld	s0,0(a0)
  800844:	fc06                	sd	ra,56(sp)
  800846:	f426                	sd	s1,40(sp)
  800848:	f04a                	sd	s2,32(sp)
  80084a:	ec4e                	sd	s3,24(sp)
  80084c:	e852                	sd	s4,16(sp)
  80084e:	e456                	sd	s5,8(sp)
  800850:	e05a                	sd	s6,0(sp)
  800852:	c405                	beqz	s0,80087a <gettoken+0x3c>
  800854:	892a                	mv	s2,a0
  800856:	89ae                	mv	s3,a1
  800858:	00001497          	auipc	s1,0x1
  80085c:	9d048493          	addi	s1,s1,-1584 # 801228 <error_string+0xc8>
  800860:	a021                	j	800868 <gettoken+0x2a>
  800862:	0405                	addi	s0,s0,1
  800864:	fe040fa3          	sb	zero,-1(s0)
  800868:	00044583          	lbu	a1,0(s0)
  80086c:	8526                	mv	a0,s1
  80086e:	b2fff0ef          	jal	ra,80039c <strchr>
  800872:	f965                	bnez	a0,800862 <gettoken+0x24>
  800874:	00044783          	lbu	a5,0(s0)
  800878:	ef81                	bnez	a5,800890 <gettoken+0x52>
  80087a:	4501                	li	a0,0
  80087c:	70e2                	ld	ra,56(sp)
  80087e:	7442                	ld	s0,48(sp)
  800880:	74a2                	ld	s1,40(sp)
  800882:	7902                	ld	s2,32(sp)
  800884:	69e2                	ld	s3,24(sp)
  800886:	6a42                	ld	s4,16(sp)
  800888:	6aa2                	ld	s5,8(sp)
  80088a:	6b02                	ld	s6,0(sp)
  80088c:	6121                	addi	sp,sp,64
  80088e:	8082                	ret
  800890:	0089b023          	sd	s0,0(s3)
  800894:	00044583          	lbu	a1,0(s0)
  800898:	00001517          	auipc	a0,0x1
  80089c:	99850513          	addi	a0,a0,-1640 # 801230 <error_string+0xd0>
  8008a0:	afdff0ef          	jal	ra,80039c <strchr>
  8008a4:	84aa                	mv	s1,a0
  8008a6:	c10d                	beqz	a0,8008c8 <gettoken+0x8a>
  8008a8:	00044503          	lbu	a0,0(s0)
  8008ac:	00140493          	addi	s1,s0,1
  8008b0:	00040023          	sb	zero,0(s0)
  8008b4:	0004c783          	lbu	a5,0(s1)
  8008b8:	00f037b3          	snez	a5,a5
  8008bc:	40f007b3          	neg	a5,a5
  8008c0:	8cfd                	and	s1,s1,a5
  8008c2:	00993023          	sd	s1,0(s2)
  8008c6:	bf5d                	j	80087c <gettoken+0x3e>
  8008c8:	00044583          	lbu	a1,0(s0)
  8008cc:	4981                	li	s3,0
  8008ce:	00001b17          	auipc	s6,0x1
  8008d2:	96ab0b13          	addi	s6,s6,-1686 # 801238 <error_string+0xd8>
  8008d6:	02200a13          	li	s4,34
  8008da:	02000a93          	li	s5,32
  8008de:	cd99                	beqz	a1,8008fc <gettoken+0xbe>
  8008e0:	02098363          	beqz	s3,800906 <gettoken+0xc8>
  8008e4:	00044783          	lbu	a5,0(s0)
  8008e8:	01479663          	bne	a5,s4,8008f4 <gettoken+0xb6>
  8008ec:	01540023          	sb	s5,0(s0)
  8008f0:	0019c993          	xori	s3,s3,1
  8008f4:	00144583          	lbu	a1,1(s0)
  8008f8:	0405                	addi	s0,s0,1
  8008fa:	f1fd                	bnez	a1,8008e0 <gettoken+0xa2>
  8008fc:	07700513          	li	a0,119
  800900:	00993023          	sd	s1,0(s2)
  800904:	bfa5                	j	80087c <gettoken+0x3e>
  800906:	855a                	mv	a0,s6
  800908:	a95ff0ef          	jal	ra,80039c <strchr>
  80090c:	dd61                	beqz	a0,8008e4 <gettoken+0xa6>
  80090e:	84a2                	mv	s1,s0
  800910:	07700513          	li	a0,119
  800914:	b745                	j	8008b4 <gettoken+0x76>

0000000000800916 <readline>:
  800916:	711d                	addi	sp,sp,-96
  800918:	ec86                	sd	ra,88(sp)
  80091a:	e8a2                	sd	s0,80(sp)
  80091c:	e4a6                	sd	s1,72(sp)
  80091e:	e0ca                	sd	s2,64(sp)
  800920:	fc4e                	sd	s3,56(sp)
  800922:	f852                	sd	s4,48(sp)
  800924:	f456                	sd	s5,40(sp)
  800926:	f05a                	sd	s6,32(sp)
  800928:	ec5e                	sd	s7,24(sp)
  80092a:	c909                	beqz	a0,80093c <readline+0x26>
  80092c:	862a                	mv	a2,a0
  80092e:	00000597          	auipc	a1,0x0
  800932:	4fa58593          	addi	a1,a1,1274 # 800e28 <main+0x1ba>
  800936:	4505                	li	a0,1
  800938:	92bff0ef          	jal	ra,800262 <fprintf>
  80093c:	6985                	lui	s3,0x1
  80093e:	4401                	li	s0,0
  800940:	448d                	li	s1,3
  800942:	497d                	li	s2,31
  800944:	4a21                	li	s4,8
  800946:	4aa9                	li	s5,10
  800948:	4b35                	li	s6,13
  80094a:	19f9                	addi	s3,s3,-2
  80094c:	00003b97          	auipc	s7,0x3
  800950:	7bcb8b93          	addi	s7,s7,1980 # 804108 <buffer.1192>
  800954:	4605                	li	a2,1
  800956:	00f10593          	addi	a1,sp,15
  80095a:	4501                	li	a0,0
  80095c:	81bff0ef          	jal	ra,800176 <read>
  800960:	04054163          	bltz	a0,8009a2 <readline+0x8c>
  800964:	c549                	beqz	a0,8009ee <readline+0xd8>
  800966:	00f14603          	lbu	a2,15(sp)
  80096a:	02960c63          	beq	a2,s1,8009a2 <readline+0x8c>
  80096e:	04c97663          	bgeu	s2,a2,8009ba <readline+0xa4>
  800972:	fe89c1e3          	blt	s3,s0,800954 <readline+0x3e>
  800976:	00001597          	auipc	a1,0x1
  80097a:	8d258593          	addi	a1,a1,-1838 # 801248 <error_string+0xe8>
  80097e:	4505                	li	a0,1
  800980:	8e3ff0ef          	jal	ra,800262 <fprintf>
  800984:	00f14703          	lbu	a4,15(sp)
  800988:	008b87b3          	add	a5,s7,s0
  80098c:	4605                	li	a2,1
  80098e:	00f10593          	addi	a1,sp,15
  800992:	4501                	li	a0,0
  800994:	00e78023          	sb	a4,0(a5)
  800998:	2405                	addiw	s0,s0,1
  80099a:	fdcff0ef          	jal	ra,800176 <read>
  80099e:	fc0553e3          	bgez	a0,800964 <readline+0x4e>
  8009a2:	4501                	li	a0,0
  8009a4:	60e6                	ld	ra,88(sp)
  8009a6:	6446                	ld	s0,80(sp)
  8009a8:	64a6                	ld	s1,72(sp)
  8009aa:	6906                	ld	s2,64(sp)
  8009ac:	79e2                	ld	s3,56(sp)
  8009ae:	7a42                	ld	s4,48(sp)
  8009b0:	7aa2                	ld	s5,40(sp)
  8009b2:	7b02                	ld	s6,32(sp)
  8009b4:	6be2                	ld	s7,24(sp)
  8009b6:	6125                	addi	sp,sp,96
  8009b8:	8082                	ret
  8009ba:	01461d63          	bne	a2,s4,8009d4 <readline+0xbe>
  8009be:	d859                	beqz	s0,800954 <readline+0x3e>
  8009c0:	4621                	li	a2,8
  8009c2:	00001597          	auipc	a1,0x1
  8009c6:	88658593          	addi	a1,a1,-1914 # 801248 <error_string+0xe8>
  8009ca:	4505                	li	a0,1
  8009cc:	897ff0ef          	jal	ra,800262 <fprintf>
  8009d0:	347d                	addiw	s0,s0,-1
  8009d2:	b749                	j	800954 <readline+0x3e>
  8009d4:	03560a63          	beq	a2,s5,800a08 <readline+0xf2>
  8009d8:	f7661ee3          	bne	a2,s6,800954 <readline+0x3e>
  8009dc:	4635                	li	a2,13
  8009de:	00001597          	auipc	a1,0x1
  8009e2:	86a58593          	addi	a1,a1,-1942 # 801248 <error_string+0xe8>
  8009e6:	4505                	li	a0,1
  8009e8:	87bff0ef          	jal	ra,800262 <fprintf>
  8009ec:	a011                	j	8009f0 <readline+0xda>
  8009ee:	d855                	beqz	s0,8009a2 <readline+0x8c>
  8009f0:	00003797          	auipc	a5,0x3
  8009f4:	71878793          	addi	a5,a5,1816 # 804108 <buffer.1192>
  8009f8:	943e                	add	s0,s0,a5
  8009fa:	00040023          	sb	zero,0(s0)
  8009fe:	00003517          	auipc	a0,0x3
  800a02:	70a50513          	addi	a0,a0,1802 # 804108 <buffer.1192>
  800a06:	bf79                	j	8009a4 <readline+0x8e>
  800a08:	4629                	li	a2,10
  800a0a:	bfd1                	j	8009de <readline+0xc8>

0000000000800a0c <reopen>:
  800a0c:	1101                	addi	sp,sp,-32
  800a0e:	ec06                	sd	ra,24(sp)
  800a10:	e822                	sd	s0,16(sp)
  800a12:	e426                	sd	s1,8(sp)
  800a14:	842e                	mv	s0,a1
  800a16:	e04a                	sd	s2,0(sp)
  800a18:	84aa                	mv	s1,a0
  800a1a:	8932                	mv	s2,a2
  800a1c:	f58ff0ef          	jal	ra,800174 <close>
  800a20:	8522                	mv	a0,s0
  800a22:	85ca                	mv	a1,s2
  800a24:	f4aff0ef          	jal	ra,80016e <open>
  800a28:	842a                	mv	s0,a0
  800a2a:	00054463          	bltz	a0,800a32 <reopen+0x26>
  800a2e:	00a49e63          	bne	s1,a0,800a4a <reopen+0x3e>
  800a32:	00142513          	slti	a0,s0,1
  800a36:	40a0053b          	negw	a0,a0
  800a3a:	60e2                	ld	ra,24(sp)
  800a3c:	8d61                	and	a0,a0,s0
  800a3e:	6442                	ld	s0,16(sp)
  800a40:	64a2                	ld	s1,8(sp)
  800a42:	6902                	ld	s2,0(sp)
  800a44:	2501                	sext.w	a0,a0
  800a46:	6105                	addi	sp,sp,32
  800a48:	8082                	ret
  800a4a:	8526                	mv	a0,s1
  800a4c:	f28ff0ef          	jal	ra,800174 <close>
  800a50:	85a6                	mv	a1,s1
  800a52:	8522                	mv	a0,s0
  800a54:	f26ff0ef          	jal	ra,80017a <dup2>
  800a58:	84aa                	mv	s1,a0
  800a5a:	8522                	mv	a0,s0
  800a5c:	f18ff0ef          	jal	ra,800174 <close>
  800a60:	8426                	mv	s0,s1
  800a62:	bfc1                	j	800a32 <reopen+0x26>

0000000000800a64 <testfile>:
  800a64:	1141                	addi	sp,sp,-16
  800a66:	4581                	li	a1,0
  800a68:	e406                	sd	ra,8(sp)
  800a6a:	f04ff0ef          	jal	ra,80016e <open>
  800a6e:	87aa                	mv	a5,a0
  800a70:	00054563          	bltz	a0,800a7a <testfile+0x16>
  800a74:	f00ff0ef          	jal	ra,800174 <close>
  800a78:	4781                	li	a5,0
  800a7a:	60a2                	ld	ra,8(sp)
  800a7c:	853e                	mv	a0,a5
  800a7e:	0141                	addi	sp,sp,16
  800a80:	8082                	ret

0000000000800a82 <runcmd>:
  800a82:	711d                	addi	sp,sp,-96
  800a84:	e0ca                	sd	s2,64(sp)
  800a86:	f852                	sd	s4,48(sp)
  800a88:	f456                	sd	s5,40(sp)
  800a8a:	f05a                	sd	s6,32(sp)
  800a8c:	ec86                	sd	ra,88(sp)
  800a8e:	e8a2                	sd	s0,80(sp)
  800a90:	e4a6                	sd	s1,72(sp)
  800a92:	fc4e                	sd	s3,56(sp)
  800a94:	e42a                	sd	a0,8(sp)
  800a96:	07700913          	li	s2,119
  800a9a:	02000a93          	li	s5,32
  800a9e:	00002b17          	auipc	s6,0x2
  800aa2:	562b0b13          	addi	s6,s6,1378 # 803000 <argv.1216>
  800aa6:	03b00a13          	li	s4,59
  800aaa:	4481                	li	s1,0
  800aac:	03e00413          	li	s0,62
  800ab0:	03c00993          	li	s3,60
  800ab4:	082c                	addi	a1,sp,24
  800ab6:	0028                	addi	a0,sp,8
  800ab8:	d87ff0ef          	jal	ra,80083e <gettoken>
  800abc:	0c850963          	beq	a0,s0,800b8e <runcmd+0x10c>
  800ac0:	02a44463          	blt	s0,a0,800ae8 <runcmd+0x66>
  800ac4:	0b450b63          	beq	a0,s4,800b7a <runcmd+0xf8>
  800ac8:	05351b63          	bne	a0,s3,800b1e <runcmd+0x9c>
  800acc:	082c                	addi	a1,sp,24
  800ace:	0028                	addi	a0,sp,8
  800ad0:	d6fff0ef          	jal	ra,80083e <gettoken>
  800ad4:	15251963          	bne	a0,s2,800c26 <runcmd+0x1a4>
  800ad8:	65e2                	ld	a1,24(sp)
  800ada:	4601                	li	a2,0
  800adc:	4501                	li	a0,0
  800ade:	f2fff0ef          	jal	ra,800a0c <reopen>
  800ae2:	d969                	beqz	a0,800ab4 <runcmd+0x32>
  800ae4:	84aa                	mv	s1,a0
  800ae6:	a8bd                	j	800b64 <runcmd+0xe2>
  800ae8:	0d250263          	beq	a0,s2,800bac <runcmd+0x12a>
  800aec:	07c00793          	li	a5,124
  800af0:	06f51163          	bne	a0,a5,800b52 <runcmd+0xd0>
  800af4:	e56ff0ef          	jal	ra,80014a <fork>
  800af8:	87aa                	mv	a5,a0
  800afa:	10051863          	bnez	a0,800c0a <runcmd+0x188>
  800afe:	e76ff0ef          	jal	ra,800174 <close>
  800b02:	4581                	li	a1,0
  800b04:	4501                	li	a0,0
  800b06:	e74ff0ef          	jal	ra,80017a <dup2>
  800b0a:	84aa                	mv	s1,a0
  800b0c:	04054c63          	bltz	a0,800b64 <runcmd+0xe2>
  800b10:	4501                	li	a0,0
  800b12:	e62ff0ef          	jal	ra,800174 <close>
  800b16:	4501                	li	a0,0
  800b18:	e5cff0ef          	jal	ra,800174 <close>
  800b1c:	b779                	j	800aaa <runcmd+0x28>
  800b1e:	e915                	bnez	a0,800b52 <runcmd+0xd0>
  800b20:	c0b1                	beqz	s1,800b64 <runcmd+0xe2>
  800b22:	00002417          	auipc	s0,0x2
  800b26:	4de40413          	addi	s0,s0,1246 # 803000 <argv.1216>
  800b2a:	6008                	ld	a0,0(s0)
  800b2c:	00000597          	auipc	a1,0x0
  800b30:	7ec58593          	addi	a1,a1,2028 # 801318 <error_string+0x1b8>
  800b34:	84bff0ef          	jal	ra,80037e <strcmp>
  800b38:	e159                	bnez	a0,800bbe <runcmd+0x13c>
  800b3a:	4789                	li	a5,2
  800b3c:	10f49563          	bne	s1,a5,800c46 <runcmd+0x1c4>
  800b40:	640c                	ld	a1,8(s0)
  800b42:	00001517          	auipc	a0,0x1
  800b46:	4be50513          	addi	a0,a0,1214 # 802000 <shcwd>
  800b4a:	4481                	li	s1,0
  800b4c:	821ff0ef          	jal	ra,80036c <strcpy>
  800b50:	a811                	j	800b64 <runcmd+0xe2>
  800b52:	862a                	mv	a2,a0
  800b54:	00000597          	auipc	a1,0x0
  800b58:	79c58593          	addi	a1,a1,1948 # 8012f0 <error_string+0x190>
  800b5c:	4505                	li	a0,1
  800b5e:	f04ff0ef          	jal	ra,800262 <fprintf>
  800b62:	54fd                	li	s1,-1
  800b64:	60e6                	ld	ra,88(sp)
  800b66:	6446                	ld	s0,80(sp)
  800b68:	6906                	ld	s2,64(sp)
  800b6a:	79e2                	ld	s3,56(sp)
  800b6c:	7a42                	ld	s4,48(sp)
  800b6e:	7aa2                	ld	s5,40(sp)
  800b70:	7b02                	ld	s6,32(sp)
  800b72:	8526                	mv	a0,s1
  800b74:	64a6                	ld	s1,72(sp)
  800b76:	6125                	addi	sp,sp,96
  800b78:	8082                	ret
  800b7a:	dd0ff0ef          	jal	ra,80014a <fork>
  800b7e:	87aa                	mv	a5,a0
  800b80:	d145                	beqz	a0,800b20 <runcmd+0x9e>
  800b82:	0a054063          	bltz	a0,800c22 <runcmd+0x1a0>
  800b86:	4581                	li	a1,0
  800b88:	dc4ff0ef          	jal	ra,80014c <waitpid>
  800b8c:	bf39                	j	800aaa <runcmd+0x28>
  800b8e:	082c                	addi	a1,sp,24
  800b90:	0028                	addi	a0,sp,8
  800b92:	cadff0ef          	jal	ra,80083e <gettoken>
  800b96:	0d251363          	bne	a0,s2,800c5c <runcmd+0x1da>
  800b9a:	65e2                	ld	a1,24(sp)
  800b9c:	4659                	li	a2,22
  800b9e:	4505                	li	a0,1
  800ba0:	e6dff0ef          	jal	ra,800a0c <reopen>
  800ba4:	f00508e3          	beqz	a0,800ab4 <runcmd+0x32>
  800ba8:	84aa                	mv	s1,a0
  800baa:	bf6d                	j	800b64 <runcmd+0xe2>
  800bac:	09548f63          	beq	s1,s5,800c4a <runcmd+0x1c8>
  800bb0:	6762                	ld	a4,24(sp)
  800bb2:	00349793          	slli	a5,s1,0x3
  800bb6:	97da                	add	a5,a5,s6
  800bb8:	e398                	sd	a4,0(a5)
  800bba:	2485                	addiw	s1,s1,1
  800bbc:	bde5                	j	800ab4 <runcmd+0x32>
  800bbe:	6008                	ld	a0,0(s0)
  800bc0:	ea5ff0ef          	jal	ra,800a64 <testfile>
  800bc4:	c50d                	beqz	a0,800bee <runcmd+0x16c>
  800bc6:	57c1                	li	a5,-16
  800bc8:	f0f51ee3          	bne	a0,a5,800ae4 <runcmd+0x62>
  800bcc:	6014                	ld	a3,0(s0)
  800bce:	00000617          	auipc	a2,0x0
  800bd2:	75260613          	addi	a2,a2,1874 # 801320 <error_string+0x1c0>
  800bd6:	6585                	lui	a1,0x1
  800bd8:	00002517          	auipc	a0,0x2
  800bdc:	53050513          	addi	a0,a0,1328 # 803108 <argv0.1215>
  800be0:	c3fff0ef          	jal	ra,80081e <snprintf>
  800be4:	00002797          	auipc	a5,0x2
  800be8:	52478793          	addi	a5,a5,1316 # 803108 <argv0.1215>
  800bec:	e01c                	sd	a5,0(s0)
  800bee:	00349793          	slli	a5,s1,0x3
  800bf2:	97a2                	add	a5,a5,s0
  800bf4:	0007b023          	sd	zero,0(a5)
  800bf8:	6008                	ld	a0,0(s0)
  800bfa:	00002597          	auipc	a1,0x2
  800bfe:	40658593          	addi	a1,a1,1030 # 803000 <argv.1216>
  800c02:	d4cff0ef          	jal	ra,80014e <__exec>
  800c06:	84aa                	mv	s1,a0
  800c08:	bfb1                	j	800b64 <runcmd+0xe2>
  800c0a:	00054c63          	bltz	a0,800c22 <runcmd+0x1a0>
  800c0e:	4505                	li	a0,1
  800c10:	d64ff0ef          	jal	ra,800174 <close>
  800c14:	4585                	li	a1,1
  800c16:	4501                	li	a0,0
  800c18:	d62ff0ef          	jal	ra,80017a <dup2>
  800c1c:	87aa                	mv	a5,a0
  800c1e:	00055d63          	bgez	a0,800c38 <runcmd+0x1b6>
  800c22:	84be                	mv	s1,a5
  800c24:	b781                	j	800b64 <runcmd+0xe2>
  800c26:	00000597          	auipc	a1,0x0
  800c2a:	66a58593          	addi	a1,a1,1642 # 801290 <error_string+0x130>
  800c2e:	4505                	li	a0,1
  800c30:	e32ff0ef          	jal	ra,800262 <fprintf>
  800c34:	54fd                	li	s1,-1
  800c36:	b73d                	j	800b64 <runcmd+0xe2>
  800c38:	4501                	li	a0,0
  800c3a:	d3aff0ef          	jal	ra,800174 <close>
  800c3e:	4501                	li	a0,0
  800c40:	d34ff0ef          	jal	ra,800174 <close>
  800c44:	bdf1                	j	800b20 <runcmd+0x9e>
  800c46:	54fd                	li	s1,-1
  800c48:	bf31                	j	800b64 <runcmd+0xe2>
  800c4a:	00000597          	auipc	a1,0x0
  800c4e:	62658593          	addi	a1,a1,1574 # 801270 <error_string+0x110>
  800c52:	4505                	li	a0,1
  800c54:	e0eff0ef          	jal	ra,800262 <fprintf>
  800c58:	54fd                	li	s1,-1
  800c5a:	b729                	j	800b64 <runcmd+0xe2>
  800c5c:	00000597          	auipc	a1,0x0
  800c60:	66458593          	addi	a1,a1,1636 # 8012c0 <error_string+0x160>
  800c64:	4505                	li	a0,1
  800c66:	dfcff0ef          	jal	ra,800262 <fprintf>
  800c6a:	54fd                	li	s1,-1
  800c6c:	bde5                	j	800b64 <runcmd+0xe2>

0000000000800c6e <main>:
  800c6e:	7179                	addi	sp,sp,-48
  800c70:	f022                	sd	s0,32(sp)
  800c72:	842a                	mv	s0,a0
  800c74:	00000517          	auipc	a0,0x0
  800c78:	6b450513          	addi	a0,a0,1716 # 801328 <error_string+0x1c8>
  800c7c:	ec26                	sd	s1,24(sp)
  800c7e:	f406                	sd	ra,40(sp)
  800c80:	e84a                	sd	s2,16(sp)
  800c82:	84ae                	mv	s1,a1
  800c84:	d9eff0ef          	jal	ra,800222 <cputs>
  800c88:	4789                	li	a5,2
  800c8a:	04f40e63          	beq	s0,a5,800ce6 <main+0x78>
  800c8e:	00000497          	auipc	s1,0x0
  800c92:	6ea48493          	addi	s1,s1,1770 # 801378 <error_string+0x218>
  800c96:	0687c163          	blt	a5,s0,800cf8 <main+0x8a>
  800c9a:	00000917          	auipc	s2,0x0
  800c9e:	6e690913          	addi	s2,s2,1766 # 801380 <error_string+0x220>
  800ca2:	a831                	j	800cbe <main+0x50>
  800ca4:	00001797          	auipc	a5,0x1
  800ca8:	34078e23          	sb	zero,860(a5) # 802000 <shcwd>
  800cac:	c9eff0ef          	jal	ra,80014a <fork>
  800cb0:	cd2d                	beqz	a0,800d2a <main+0xbc>
  800cb2:	04054c63          	bltz	a0,800d0a <main+0x9c>
  800cb6:	006c                	addi	a1,sp,12
  800cb8:	c94ff0ef          	jal	ra,80014c <waitpid>
  800cbc:	cd09                	beqz	a0,800cd6 <main+0x68>
  800cbe:	8526                	mv	a0,s1
  800cc0:	c57ff0ef          	jal	ra,800916 <readline>
  800cc4:	842a                	mv	s0,a0
  800cc6:	fd79                	bnez	a0,800ca4 <main+0x36>
  800cc8:	4501                	li	a0,0
  800cca:	70a2                	ld	ra,40(sp)
  800ccc:	7402                	ld	s0,32(sp)
  800cce:	64e2                	ld	s1,24(sp)
  800cd0:	6942                	ld	s2,16(sp)
  800cd2:	6145                	addi	sp,sp,48
  800cd4:	8082                	ret
  800cd6:	46b2                	lw	a3,12(sp)
  800cd8:	d2fd                	beqz	a3,800cbe <main+0x50>
  800cda:	8636                	mv	a2,a3
  800cdc:	85ca                	mv	a1,s2
  800cde:	4505                	li	a0,1
  800ce0:	d82ff0ef          	jal	ra,800262 <fprintf>
  800ce4:	bfe9                	j	800cbe <main+0x50>
  800ce6:	648c                	ld	a1,8(s1)
  800ce8:	4601                	li	a2,0
  800cea:	4501                	li	a0,0
  800cec:	d21ff0ef          	jal	ra,800a0c <reopen>
  800cf0:	c62a                	sw	a0,12(sp)
  800cf2:	4481                	li	s1,0
  800cf4:	d15d                	beqz	a0,800c9a <main+0x2c>
  800cf6:	bfd1                	j	800cca <main+0x5c>
  800cf8:	00000597          	auipc	a1,0x0
  800cfc:	55858593          	addi	a1,a1,1368 # 801250 <error_string+0xf0>
  800d00:	4505                	li	a0,1
  800d02:	d60ff0ef          	jal	ra,800262 <fprintf>
  800d06:	557d                	li	a0,-1
  800d08:	b7c9                	j	800cca <main+0x5c>
  800d0a:	00000697          	auipc	a3,0x0
  800d0e:	63668693          	addi	a3,a3,1590 # 801340 <error_string+0x1e0>
  800d12:	00000617          	auipc	a2,0x0
  800d16:	63e60613          	addi	a2,a2,1598 # 801350 <error_string+0x1f0>
  800d1a:	0f200593          	li	a1,242
  800d1e:	00000517          	auipc	a0,0x0
  800d22:	64a50513          	addi	a0,a0,1610 # 801368 <error_string+0x208>
  800d26:	afaff0ef          	jal	ra,800020 <__panic>
  800d2a:	8522                	mv	a0,s0
  800d2c:	d57ff0ef          	jal	ra,800a82 <runcmd>
  800d30:	c62a                	sw	a0,12(sp)
  800d32:	c02ff0ef          	jal	ra,800134 <exit>
